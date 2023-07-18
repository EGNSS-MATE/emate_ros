Header header                           # local time stamp
uint16 device_id                        # specific device id
uint16 error_code                       # error code of speedometer (0 = no error)
float64 speed                           # measured speed [m/s]
float64 rel_dist                        # relative distance measured since last measurement [m]
bool standstill                         # standstill flag
