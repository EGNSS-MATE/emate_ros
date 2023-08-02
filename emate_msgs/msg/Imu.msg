Header header                           # local time stamp
uint16 device_id                        # specific device id
uint16 acc_error_code                   # error code of accelerometer (0 = no error)
uint16 ang_error_code                   # error code of gyroscope (0 = no error)
geometry_msgs/Vector3 spec_force        # specific force along each axis (x, y, z) [m/s2]
geometry_msgs/Vector3 ang_rate          # angular rate along each axis (x, y, z) [rad/s]
bool compensated                        # if calibrated and corrected for estimated errors, compensated for earth rate and gravity
bool corrected                          # if calibrated and corrected for errors estimated by EKF based data fusion
