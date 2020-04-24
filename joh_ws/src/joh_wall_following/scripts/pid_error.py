#!/usr/bin/env python

import rospy
import math
import numpy as np
import yaml
import sys
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Float64
import pdb

pub = rospy.Publisher('pid_error', Float64, queue_size=10)

# You can define constants in Python as uppercase global names like these.
MIN_DISTANCE = 0.1
MAX_DISTANCE = 30.0
MIN_ANGLE = -45.0
MAX_ANGLE = 225.0
# my code -------------------------------------------------
NUM_OF_SAMPLE = 10
LOOKAHEAD_DIST = 1.5 * 0.025 * 2   # time interval = 0.025 sec
# ---------------------------------------------------------

# data: single message from topic /scan
# angle: between -45 to 225 degrees, where 0 degrees is directly to the right
# Outputs length in meters to object with angle in lidar scan field of view
def getRange(data, angle):   
    # TODO: implement 
    # my code --------------------------------------------- 
    theta = 0;
    alpha = 0;
    distA = 0;
    distB = 0;
    distToWall = 0;

    angle_inc = (data.angle_max - data.angle_min) / len(data.ranges)

    if angle >= 0.0 and angle <= math.radians(70.0):
        theta = angle
        index = int( (angle   + math.pi/4) // angle_inc)
        distA = data.ranges[index]
        index = int( (0.0     + math.pi/4) // angle_inc)
        distB = data.ranges[index]
    elif angle >= math.radians(110.0) and angle <= math.pi:
        theta = angle
        index = int( (angle   + math.pi/4) // angle_inc)
        distA = data.ranges[index]
        index = int( (math.pi + math.pi/4) // angle_inc)
        distB = data.ranges[index]
    else:
        print("Error: 'angle' is wrong in getRange()\n")

    if   distA < MIN_DISTANCE:
        distA = MIN_DISTANCE
    elif distA > MAX_DISTANCE:
        distA = MAX_DISTANCE
    if   distB < MIN_DISTANCE:
        distB = MIN_DISTANCE
    elif distB > MAX_DISTANCE:
        distB = MAX_DISTANCE

    if angle >= 0.0 and angle <= math.radians(70.0):
        alpha = math.atan( (distA * math.cos(theta) - distB) / (distA * math.sin(theta)) )
    elif angle >= math.radians(110.0) and angle <= math.pi:
        alpha = math.atan( (distB - distA * math.cos(math.pi-theta)) / (distA * math.sin(math.pi-theta)) )

    distToWall = distB * math.cos(alpha)
    return distToWall, alpha
    # ------------------------------------------------------
    # return 0.0    # commented

# data: single message from topic /scan
# desired_distance: desired distance to the left wall [meters]
# Outputs the PID error required to make the car follow the left wall.
def followLeft(data, desired_distance):
    # TODO: implement 
    # my code----------------------------------------------
    # take average of distToWall from multiple angle samples
    distToWallCurr = 0
    alphaCurr      = 0
    incAnglSamp = math.radians(70.0 / NUM_OF_SAMPLE )   
    for n in range(NUM_OF_SAMPLE):
        anglSamp = math.pi - (n+1) * incAnglSamp    # theta for left wall
        distToWall, alpha = getRange(data, anglSamp)
        distToWallCurr = distToWallCurr + distToWall
        alphaCurr      = alphaCurr      + alpha
    distToWallCurr = distToWallCurr / NUM_OF_SAMPLE
    alphaCurr      = alphaCurr      / NUM_OF_SAMPLE

    distToWallNext = distToWallCurr - LOOKAHEAD_DIST * math.sin(alphaCurr) # for left wall
    error = desired_distance - distToWallNext    # for left wall
    return error
    # -----------------------------------------------------
    # return 0.0    # commented

# data: single message from topic /scan
# desired_distance: desired distance to the right wall [meters]
# Outputs the PID error required to make the car follow the right wall.
def followRight(data, desired_distance):
    # TODO: implement
    # my code----------------------------------------------
    # take average of distToWall from multiple angle samples
    distToWallCurr = 0
    alphaCurr      = 0
    incAnglSamp = math.radians(70.0 / NUM_OF_SAMPLE )   
    for n in range(NUM_OF_SAMPLE):
        anglSamp = 0.0 + (n+1) * incAnglSamp    # theta for right wall
        distToWall, alpha = getRange(data, anglSamp)
        distToWallCurr = distToWallCurr + distToWall
        alphaCurr      = alphaCurr      + alpha
    distToWallCurr = distToWallCurr / NUM_OF_SAMPLE
    alphaCurr      = alphaCurr      / NUM_OF_SAMPLE

    distToWallNext = distToWallCurr + LOOKAHEAD_DIST * math.sin(alphaCurr) # for right wall
    error = -(desired_distance - distToWallNext)     # for right wall
    return error
    # -----------------------------------------------------
    # return 0.0    # commented

# data: single message from topic /scan
# Outputs the PID error required to make the car drive in the middle
# of the hallway.
def followCenter(data):
    # TODO: implement
    # my code----------------------------------------------
    distToRghtWallCurr = 0
    distToLeftWallCurr = 0
    alphaCurr      = 0
    incAnglSamp = math.radians(70.0 / NUM_OF_SAMPLE)

    # take average of right side from multiple angle samples
    for n in range(NUM_OF_SAMPLE):
        anglSamp = 0.0 + (n+1) * incAnglSamp    # theta for right wall
        distToWall,alpha = getRange(data, anglSamp)
        distToRghtWallCurr = distToRghtWallCurr + distToWall
        alphaCurr          = alphaCurr          + alpha
    distToRghtWallCurr = distToRghtWallCurr / NUM_OF_SAMPLE

    # take average of left side from multiple angle samples  
    for n in range(NUM_OF_SAMPLE):
        anglSamp = math.pi - (n+1) * incAnglSamp    # theta for left wall
        distToWall,alpha = getRange(data, anglSamp)
        distToLeftWallCurr = distToLeftWallCurr + distToWall
        alphaCurr          = alphaCurr          + alpha
    distToLeftWallCurr = distToLeftWallCurr / NUM_OF_SAMPLE

    # get error from left and right
    alphaCurr = alphaCurr / (2 * NUM_OF_SAMPLE)
    distToRghtWallNext = distToRghtWallCurr + LOOKAHEAD_DIST * math.sin(alphaCurr) # for right wall
    distToLeftWallNext = distToLeftWallCurr - LOOKAHEAD_DIST * math.sin(alphaCurr) # for left  wall
    error = distToRghtWallNext - distToLeftWallNext    # for center of walls
    return error
    # -----------------------------------------------------
    return 0.0

# Callback for receiving LIDAR data on the /scan topic.
# data: the LIDAR data, published as a list of distances to the wall.
def scan_callback(data):
    error = 0.0 # TODO: replace with followLeft, followRight, or followCenter
    # my code ---------------------------------------------
    #error = followRight (data, 0.4)
    error = followLeft  (data, 0.3)
    #error = followCenter(data)
    # -----------------------------------------------------
    msg = Float64()
    msg.data = error
    pub.publish(msg)

# Boilerplate code to start this ROS node.
# DO NOT MODIFY!
if __name__ == '__main__':
	rospy.init_node('pid_error_node', anonymous = True)
	rospy.Subscriber("scan", LaserScan, scan_callback)
	rospy.spin()
