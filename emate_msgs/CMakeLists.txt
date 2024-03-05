cmake_minimum_required(VERSION 3.0.2)
project(emate_msgs)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  geometry_msgs
  geographic_msgs
  message_generation
)

add_message_files(
  FILES
  CI.msg
  LV95.msg
  NED.msg
  RPY.msg
  Balisereader.msg
  FusionResultGlobal.msg
  FusionResultTrack.msg
  GnssPvt.msg
  GnssIntf.msg
  Imu.msg
  Speedometer.msg
)


generate_messages(
  DEPENDENCIES
  std_msgs
  geometry_msgs
  geographic_msgs
)

catkin_package(
 LIBRARIES emate_msgs
 CATKIN_DEPENDS roscpp rospy std_msgs geometry_msgs geographic_msgs message_generation message_runtime
 DEPENDS system_lib
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
)
