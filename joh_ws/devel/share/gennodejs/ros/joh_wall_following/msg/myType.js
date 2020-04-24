// Auto-generated. Do not edit!

// (in-package joh_wall_following.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class myType {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.average = null;
      this.maximum = null;
    }
    else {
      if (initObj.hasOwnProperty('average')) {
        this.average = initObj.average
      }
      else {
        this.average = 0.0;
      }
      if (initObj.hasOwnProperty('maximum')) {
        this.maximum = initObj.maximum
      }
      else {
        this.maximum = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type myType
    // Serialize message field [average]
    bufferOffset = _serializer.float32(obj.average, buffer, bufferOffset);
    // Serialize message field [maximum]
    bufferOffset = _serializer.float32(obj.maximum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type myType
    let len;
    let data = new myType(null);
    // Deserialize message field [average]
    data.average = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [maximum]
    data.maximum = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'joh_wall_following/myType';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5671c16aa0f68ca7c0fecdd35e122f93';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 average
    float32 maximum
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new myType(null);
    if (msg.average !== undefined) {
      resolved.average = msg.average;
    }
    else {
      resolved.average = 0.0
    }

    if (msg.maximum !== undefined) {
      resolved.maximum = msg.maximum;
    }
    else {
      resolved.maximum = 0.0
    }

    return resolved;
    }
};

module.exports = myType;
