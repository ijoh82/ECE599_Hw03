;; Auto-generated. Do not edit!


(when (boundp 'joh_wall_following::myType)
  (if (not (find-package "JOH_WALL_FOLLOWING"))
    (make-package "JOH_WALL_FOLLOWING"))
  (shadow 'myType (find-package "JOH_WALL_FOLLOWING")))
(unless (find-package "JOH_WALL_FOLLOWING::MYTYPE")
  (make-package "JOH_WALL_FOLLOWING::MYTYPE"))

(in-package "ROS")
;;//! \htmlinclude myType.msg.html


(defclass joh_wall_following::myType
  :super ros::object
  :slots (_average _maximum ))

(defmethod joh_wall_following::myType
  (:init
   (&key
    ((:average __average) 0.0)
    ((:maximum __maximum) 0.0)
    )
   (send-super :init)
   (setq _average (float __average))
   (setq _maximum (float __maximum))
   self)
  (:average
   (&optional __average)
   (if __average (setq _average __average)) _average)
  (:maximum
   (&optional __maximum)
   (if __maximum (setq _maximum __maximum)) _maximum)
  (:serialization-length
   ()
   (+
    ;; float32 _average
    4
    ;; float32 _maximum
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _average
       (sys::poke _average (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _maximum
       (sys::poke _maximum (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _average
     (setq _average (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _maximum
     (setq _maximum (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get joh_wall_following::myType :md5sum-) "5671c16aa0f68ca7c0fecdd35e122f93")
(setf (get joh_wall_following::myType :datatype-) "joh_wall_following/myType")
(setf (get joh_wall_following::myType :definition-)
      "float32 average
float32 maximum

")



(provide :joh_wall_following/myType "5671c16aa0f68ca7c0fecdd35e122f93")


