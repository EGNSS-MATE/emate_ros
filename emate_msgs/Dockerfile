FROM ros:noetic-ros-core

# install build tools
RUN apt-get update && apt-get install -y \
    build-essential python3-catkin-tools python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

# clone ros package repo
ENV ROS_WS /opt/ros_ws
RUN mkdir -p $ROS_WS/src/emate_msgs/
COPY . $ROS_WS/src/emate_msgs/

# install deps
RUN apt-get update && \
    rosdep init && \
    rosdep update && \
    rosdep install -y \
      --from-paths \
        $ROS_WS/src/emate_msgs \
      --ignore-src && \
    rm -rf /var/lib/apt/lists/*

# build ros package source
WORKDIR $ROS_WS
RUN catkin config \
      --extend /opt/ros/$ROS_DISTRO && catkin init &&\
    catkin build

# source ros package from entrypoint
RUN sed --in-place --expression \
      '$isource "$ROS_WS/devel/setup.bash"' \
      /ros_entrypoint.sh

# run using launch file \
# CMD ["roslaunch", "roscpp_tutorials", "talker_listener.launch"]