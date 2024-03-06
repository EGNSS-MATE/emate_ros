# emate_ros

ROS Code for EGNSS MATE

## Packages

### emate_msgs
Defines the structures for the for input and output messages.

#### Installation

#### Native

1. Create a catkin workspace and a source folder

 ```bash
mkdir -p catkin_ws/src && cd ./catkin_ws/src
```

2. Clone repo into src folder and return to catkin workspace

```bash
git clone https://github.com/EGNSS-MATE/emate_ros.git && cd -
```

3. Install dependencies

```bash
rosdep install -y --from-paths src/emate_ros/emate_msgs --ignore-src
```

4. Compile and source workspace

```bash
catkin_make && source devel/setup.bash
```

5. Test if the messages have been build successfully

```bash
rosmsg package emate_msgs
```

#### Message description

* Balisereader: [emate_msgs/Balisereader.msg](emate_msgs/msg/Balisereader.msg)
* Fusion Result Global: [emate_msgs/FusionResultGlobal.msg](emate_msgs/msg/FusionResultGlobal.msg)
* Fusion Result Track: [emate_msgs/FusionResultTrack.msg](emate_msgs/msg/FusionResultTrack.msg)
* GNSS PVT: [emate_msgs/GnssPvt.msg](emate_msgs/msg/GnssPvt.msg)
* GNSS Interference: [emate_msgs/GnssIntf.msg](emate_msgs/msg/GnssIntf.msg)
* IMU: [emate_msgs/Imu.msg](emate_msgs/msg/Imu.msg)
* Speedometer: [emate_msgs/Speedometer.msg](emate_msgs/msg/Speedometer.msg)

##### Basic Messages

* CI (Confidence Interval): [emate_msgs/CI.msg](emate_msgs/msg/CI.msg)
* LV95 (North, East, Height): [emate_msgs/LV95.msg](emate_msgs/msg/LV95.msg)
* NED (North, East, Down): [emate_msgs/NED.msg](emate_msgs/msg/NED.msg)
* RPY (Roll, Pitch, Yaw): [emate_msgs/RPY.msg](emate_msgs/msg/RPY.msg)

### emate_mock_fusion
Example for the fusion solution. It reads the input messages GnssPvt from the topic /gnss_asterx_01 and write the output messages FusionResultGlobal/FusionResultTrack to the topics /fusion_result_global and /fusion_result_track.

The directory ./src/emate_ros/emate_mock_fusion/src/emate_mock_fusion is a placeholder for python library objects.

#### Installation

#### Native

1. Create a catkin workspace and a source folder

 ```bash
mkdir -p catkin_ws/src && cd ./catkin_ws/src
```

2. Clone repo into src folder and return to catkin workspace

```bash
git clone https://github.com/EGNSS-MATE/emate_ros.git && cd -
```

3. Install dependencies

```bash
rosdep install -y --from-paths src/emate_ros/emate_mock_fusion --ignore-src
```

4. Compile and source workspace

```bash
catkin_make && source devel/setup.bash
```

5. Test if the messages have been build successfully

```bash
rosrun emate_mock_fusion mock_fusion_node.py
```

## Docker :whale:

1. Create directories

```bash
mkdir ~/git
cd ~/git && git clone git@github.com:EGNSS-MATE/emate_ros.git
cd ~/git/emate_ros
```

2. Build docker image with egnss mate ros packages inside

```bash
docker build -t emate_container .
```

3. Run container within the net of the host

```bash
docker run -it --net=host emate_container /bin/bash
```