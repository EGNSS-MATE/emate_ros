import os
import rospy
import numpy as np
from emate_msgs.msg import FusionResultGlobal, FusionResultTrack
from emate_msgs.msg import GnssPvt


class MockFusion:
    def __init__(self):
        self._tmp_value = None

        self._algo_id = os.getenv("INPUT_ALGO_ID", None)
        if self._algo_id is None:
           print("Environvariable INPUT_ALGO_ID is not set. Use test as default.")
        else:
           self._algo_id = "test"

        self._pub_global = rospy.Publisher(
            "/fusion_result_global",
            FusionResultGlobal,
            queue_size=10,
        )
        self._pub_track = rospy.Publisher(
            "/fusion_result_track",
            FusionResultTrack,
            queue_size=10,
        )

    def _timer_callback(self, event):
        print("Timer called at " + str(event.current_real))
        self._write_msgs()

    def _gnss_callback(self, data: GnssPvt):
        self._tmp_value = data

    def start(self):
        rospy.init_node("mock_fusion_node", anonymous=True)

        rospy.Timer(rospy.Duration(1.0), self._timer_callback)

        rospy.Subscriber(
            "/gnss_5",
            GnssPvt,
            self._gnss_callback,
        )

        rospy.spin()

    def _write_msgs(self):
        global_msg, track_msg = FusionResultGlobal(), FusionResultTrack()
        global_msg.header.stamp, track_msg.header.stamp = (
            self._tmp_value.header.stamp,
            self._tmp_value.header.stamp,
        )

        # global
        global_msg.algo_id = self._algo_id
        global_msg.sensor_set = [3, 6, 1, 4, 5, 6, 7, 8, 9, 9]
        global_msg.para_set = '{"xx": "xx", "yy": 20.0, "zz": [1, 2, 3, 4]}'
        global_msg.status = -1

        global_msg.coord_etrs89 = self._tmp_value.coord_etrs89
        global_msg.coord_lv95.north = 100.0
        global_msg.coord_lv95.east = 100.0
        global_msg.coord_lv95.height = -100.0
        global_msg.vel = self._tmp_value.vel
        global_msg.acc.x = -10.0
        global_msg.acc.y = 10.0
        global_msg.acc.z = -10.0
        global_msg.attitude.roll = 1.0
        global_msg.attitude.pitch = -1.0
        global_msg.attitude.yaw = 1.0
        global_msg.ang_rate.x = 0.01
        global_msg.ang_rate.y = -0.01
        global_msg.ang_rate.z = 0.01

        global_msg.coord_stddev.north = 10.0
        global_msg.coord_stddev.east = -10.0
        global_msg.coord_stddev.height = 10.0
        global_msg.vel_stddev.north = 10.0
        global_msg.vel_stddev.east = -10.0
        global_msg.vel_stddev.north = 10.0
        global_msg.att_stddev.roll = 1.0
        global_msg.att_stddev.pitch = 1.0
        global_msg.att_stddev.yaw = -1.0

        global_msg.used_sats = 10
        global_msg.tracked_sats = 5
        global_msg.speed, global_msg.speed_stddev = 10.0, -10.0
        global_msg.movement_direction = True

        # track
        track_msg.algo_id = self._algo_id
        track_msg.sensor_set = [3, 6, 1, 4, 5, 6, 7, 8, 9, 9]
        track_msg.para_set = '{"xx": "xx", "yy": 20.0, "zz": [1, 2, 3, 4]}'
        track_msg.status = -1

        track_msg.track_id = ["abcd-efgh", "ijkl-mnop", "qrst-uvwx" "zyxw-vuts"]

        track_msg.movement_direction, track_msg.orientation = True, False

        track_msg.travelled_dist, track_msg.relative_dist = 40.0323, -40.234323

        track_msg.speed = np.sqrt(
            self._tmp_value.vel.north**2
            + self._tmp_value.vel.east**2
            + self._tmp_value.vel.down**2
        )

        track_msg.acc = 10.001
        track_msg.dist_ci.overestimation = 10.00
        track_msg.dist_ci.underestimation = -10.00
        track_msg.speed_ci.overestimation = -10.00
        track_msg.speed_ci.underestimation = 10.00

        track_msg.cross_track_dist = 10.000

        self._pub_global.publish(global_msg)
        self._pub_track.publish(track_msg)


if __name__ == "__main__":
    try:
        fusion = MockFusion()
        fusion.start()
    except rospy.ROSInterruptException:
        pass
