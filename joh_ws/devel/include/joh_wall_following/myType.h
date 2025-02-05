// Generated by gencpp from file joh_wall_following/myType.msg
// DO NOT EDIT!


#ifndef JOH_WALL_FOLLOWING_MESSAGE_MYTYPE_H
#define JOH_WALL_FOLLOWING_MESSAGE_MYTYPE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace joh_wall_following
{
template <class ContainerAllocator>
struct myType_
{
  typedef myType_<ContainerAllocator> Type;

  myType_()
    : average(0.0)
    , maximum(0.0)  {
    }
  myType_(const ContainerAllocator& _alloc)
    : average(0.0)
    , maximum(0.0)  {
  (void)_alloc;
    }



   typedef float _average_type;
  _average_type average;

   typedef float _maximum_type;
  _maximum_type maximum;





  typedef boost::shared_ptr< ::joh_wall_following::myType_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::joh_wall_following::myType_<ContainerAllocator> const> ConstPtr;

}; // struct myType_

typedef ::joh_wall_following::myType_<std::allocator<void> > myType;

typedef boost::shared_ptr< ::joh_wall_following::myType > myTypePtr;
typedef boost::shared_ptr< ::joh_wall_following::myType const> myTypeConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::joh_wall_following::myType_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::joh_wall_following::myType_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::joh_wall_following::myType_<ContainerAllocator1> & lhs, const ::joh_wall_following::myType_<ContainerAllocator2> & rhs)
{
  return lhs.average == rhs.average &&
    lhs.maximum == rhs.maximum;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::joh_wall_following::myType_<ContainerAllocator1> & lhs, const ::joh_wall_following::myType_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace joh_wall_following

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::joh_wall_following::myType_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::joh_wall_following::myType_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::joh_wall_following::myType_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::joh_wall_following::myType_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::joh_wall_following::myType_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::joh_wall_following::myType_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::joh_wall_following::myType_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5671c16aa0f68ca7c0fecdd35e122f93";
  }

  static const char* value(const ::joh_wall_following::myType_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5671c16aa0f68ca7ULL;
  static const uint64_t static_value2 = 0xc0fecdd35e122f93ULL;
};

template<class ContainerAllocator>
struct DataType< ::joh_wall_following::myType_<ContainerAllocator> >
{
  static const char* value()
  {
    return "joh_wall_following/myType";
  }

  static const char* value(const ::joh_wall_following::myType_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::joh_wall_following::myType_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 average\n"
"float32 maximum\n"
;
  }

  static const char* value(const ::joh_wall_following::myType_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::joh_wall_following::myType_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.average);
      stream.next(m.maximum);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct myType_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::joh_wall_following::myType_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::joh_wall_following::myType_<ContainerAllocator>& v)
  {
    s << indent << "average: ";
    Printer<float>::stream(s, indent + "  ", v.average);
    s << indent << "maximum: ";
    Printer<float>::stream(s, indent + "  ", v.maximum);
  }
};

} // namespace message_operations
} // namespace ros

#endif // JOH_WALL_FOLLOWING_MESSAGE_MYTYPE_H
