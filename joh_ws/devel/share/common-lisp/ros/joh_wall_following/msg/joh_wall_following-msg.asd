
(cl:in-package :asdf)

(defsystem "joh_wall_following-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "myType" :depends-on ("_package_myType"))
    (:file "_package_myType" :depends-on ("_package"))
  ))