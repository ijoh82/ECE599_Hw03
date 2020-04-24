#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include "joh_wall_following/myType.h"

// get cumulative error
float ERROR_SUM = 0.0;
float ERROR_MAX = 0.0;
int   DATA_COUNT = 0;
void getErrors(const std_msgs::Float64 pid_error) {
    float error = (float) (pid_error.data);
    ERROR_SUM = ERROR_SUM + error;
    if (abs(error) > ERROR_MAX)
    {
        ERROR_MAX = error;
    }
    DATA_COUNT ++;
}



int main(int argc, char **argv) {
    ros::init(argc, argv, "joh_analysis");
    ros::NodeHandle n;

    // call subscriber by specifying the topic to receive
    ros::Subscriber sub = n.subscribe("/pid_error", 1000, getErrors);

    // Call publisher by specifying the topic to send
    ros::Publisher  pub = n.advertise<joh_wall_following::myType>("/wall_following_analysis", 1000);

    int freq = 10;                // publish speed [Hz]
    ros::Rate loop_rate(freq);

    // set variables for publisher loop
    int count = 0;               // loop counter (to apply controlled delay)
    int countDelay = 10;         // intentional delay (to prevent starting error)
    int countLimit = 1000;       // upper limit of counting (to prevent overflow)
    bool goodToRun = false;

    while (ros::ok()) 
    {
        if (count > countDelay)
        {
            goodToRun = true;
        }
        if (goodToRun)
        {
            // compute the error analysis
            joh_wall_following::myType aveAndMax;
            aveAndMax.average = ERROR_SUM / DATA_COUNT;
            aveAndMax.maximum = ERROR_MAX;
            printf("ave=%f , max=%f , cnt=%i\n", aveAndMax.average, aveAndMax.maximum, DATA_COUNT);
        
            // Publish the message to send
            pub.publish(aveAndMax);
        }
        ros::spinOnce();
        loop_rate.sleep();
        count = (count + 1) % countLimit;     
     } // end while
    ros::spin();
    return 0;
}
