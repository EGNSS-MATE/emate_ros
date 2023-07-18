Header header                           # local time stamp

uint16 device_id                        # specific device id
uint16 gps_week                         # gps week
float64 gps_tow                         # gps time of week [s]
uint16 error_code                       # error code (0 = no error)

emate_msgs/LV95 coord_lv95              # position in LV95 (north, east, height) [m]
geographic_msgs/GeoPoint coord_etrs89   # position in ETRS89 (lat, long, alt) [deg, m]
emate_msgs/NED vel                      # velocity (north, east, down) [m/s]

emate_msgs/LV95 coord_stddev            # standard deviation of position (north, east, height) [m]
emate_msgs/NED vel_stddev               # standard deviation of velocity (north, east, down) [m/s]

float64 undulation                      # undulation
float64 pos_dilution_of_prec            # position dilution of precision
uint16 quality                          # solution quality
uint16 used_sats                        # number of used satellites
uint16 tracked_sats                     # number of tracked satellites
float64 correction_age_received         # duration since reception of last NTRIP differential correction
