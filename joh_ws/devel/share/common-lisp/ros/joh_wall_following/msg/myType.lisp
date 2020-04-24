; Auto-generated. Do not edit!


(cl:in-package joh_wall_following-msg)


;//! \htmlinclude myType.msg.html

(cl:defclass <myType> (roslisp-msg-protocol:ros-message)
  ((average
    :reader average
    :initarg :average
    :type cl:float
    :initform 0.0)
   (maximum
    :reader maximum
    :initarg :maximum
    :type cl:float
    :initform 0.0))
)

(cl:defclass myType (<myType>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <myType>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'myType)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name joh_wall_following-msg:<myType> is deprecated: use joh_wall_following-msg:myType instead.")))

(cl:ensure-generic-function 'average-val :lambda-list '(m))
(cl:defmethod average-val ((m <myType>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joh_wall_following-msg:average-val is deprecated.  Use joh_wall_following-msg:average instead.")
  (average m))

(cl:ensure-generic-function 'maximum-val :lambda-list '(m))
(cl:defmethod maximum-val ((m <myType>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joh_wall_following-msg:maximum-val is deprecated.  Use joh_wall_following-msg:maximum instead.")
  (maximum m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <myType>) ostream)
  "Serializes a message object of type '<myType>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'average))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'maximum))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <myType>) istream)
  "Deserializes a message object of type '<myType>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'average) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'maximum) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<myType>)))
  "Returns string type for a message object of type '<myType>"
  "joh_wall_following/myType")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'myType)))
  "Returns string type for a message object of type 'myType"
  "joh_wall_following/myType")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<myType>)))
  "Returns md5sum for a message object of type '<myType>"
  "5671c16aa0f68ca7c0fecdd35e122f93")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'myType)))
  "Returns md5sum for a message object of type 'myType"
  "5671c16aa0f68ca7c0fecdd35e122f93")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<myType>)))
  "Returns full string definition for message of type '<myType>"
  (cl:format cl:nil "float32 average~%float32 maximum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'myType)))
  "Returns full string definition for message of type 'myType"
  (cl:format cl:nil "float32 average~%float32 maximum~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <myType>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <myType>))
  "Converts a ROS message object to a list"
  (cl:list 'myType
    (cl:cons ':average (average msg))
    (cl:cons ':maximum (maximum msg))
))
