Header header                           # local time stamp

uint16 device_id                        # specific device id
uint16 gps_week                         # gps week
float64 gps_tow                         # gps time of week [s]
uint16 error_code                       # error code (0 = no error)

string antenna                          # antenna (main, aux1, aux*)
bool spoofing_osnma                     # spoofing detected by Galileo OSNMA
bool spoofing                           # spoofing detected by built-in test
uint16 n_jamming                        # number of radio channels affected by jamming
uint32 freq_jamming                     # interference frequency [Hz]
uint32 bandwidth_jamming                # interference bandwidth [Hz]

int16 gain_l5_e5b_b2b                   # receiver gain for Galileo E5b and Beidou B2b [dB]
int16 gain_l5_e5a_b2a                   # receiver gain for GPS L5 and Galileo E5a and Beidou B2a [dB]
int16 gain_gps_l2                       # receiver gain for GPS L2 [dB]
int16 gain_gps_l1_e1                    # receiver gain for GPS L1 and Galileo E1 [dB]
int16 gain_glo_l2                       # receiver gain for GLONASS L2 [dB]
int16 gain_glo_l1                       # receiver gain for GLONASS L1 [dB]
int16 gain_b1                           # receiver gain for Beidou B1 [dB]