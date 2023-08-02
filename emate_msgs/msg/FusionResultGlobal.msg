Header header                           # local time stamp

string algo_id                          # unique identifier of algorithm and version
uint16[10] sensor_set                   # set of used sensors
string para_set                         # set of parameters as json string
int16 status                            # status of algorithm

emate_msgs/LV95 coord_lv95              # position in LV95 (north, east, height) [m]
geographic_msgs/GeoPoint coord_etrs89   # position in ETRS89 (lat, long, alt) [deg, m]
emate_msgs/NED vel                      # velocity (north, east, down) [m/s]
geometry_msgs/Vector3 acc               # acceleration (x, y, z) [m/s2]
emate_msgs/RPY attitude                 # attitude (roll, pitch, yaw) [rad]
geometry_msgs/Vector3 ang_rate          # angular rate along each axis (x, y, z) [rad/s]

emate_msgs/LV95 coord_stddev            # standard deviation of position (north, east, height) [m]
emate_msgs/NED vel_stddev               # standard deviation of velocity (north, east, down) [m/s]
emate_msgs/RPY att_stddev               # standard deviation of attitude (roll, pitch, yaw) [rad]

uint16 used_sats                        # number of used satellites
uint16 tracked_sats                     # number of tracked satellites

float64 speed                           # speed [m/s]
float64 speed_stddev                    # standard deviation of speed [m/s]

bool direction                          # direction flag (true if driving +x, false if driving -x in body frame)
