Header header                           # local time stamp

string algo_id                          # unique identifier of algorithm and version
uint16[10] sensor_set                   # set of used sensors
string para_set                         # set of parameters as json string
int16 status                            # status of algorithm

string[] track_id                       # array of with possible track IDs

bool movement_direction                 # direction flag (true if driving +x, false if driving -x in body frame)
bool orientation                        # orientation flag (true if body x is towards destination node, false when body x axis is towards origin node)

float64 travelled_dist                  # travelled distance since start of mission [m]
float64 relative_dist                   # relative along track distance to origin node [m]

float64 speed                           # along track speed [m/s]
float64 acc                             # acceleration [m/s2]

emate_msgs/CI dist_ci                   # confidence interval of travelled and relative distance [m]
emate_msgs/CI speed_ci                  # confidence interval of along track speed [m/s]

float64 cross_track_dist                # distance between global position and track axis [m]
