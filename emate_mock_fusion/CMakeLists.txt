cmake_minimum_required(VERSION 3.0.2)
project(emate_mock_fusion)

find_package(catkin REQUIRED COMPONENTS
        roscpp
        rospy
)

catkin_python_setup()

catkin_package(
)

include_directories(
        # include
        ${catkin_INCLUDE_DIRS}
)

catkin_install_python(PROGRAMS
        scripts/mock_fusion_node.py
        DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)