/// @description FRAMESkip  with ONE Object - BlackOpzFX.com

// To Use: Place ONE [obj_frameskipx] into any room to ENABLE Frame Skippping.

// The Default Settings will Activate Frame Skipping if 10% of frames are missed
// It collects 3x room_speed as the array size to average FPS values. Also Onscreen Display is ON.
// Simply place this object in your room to enable frame skipping

// NOTE: These Default Settings have been TESTED to give the best overall results

SKIP_Frames = true; // SKIPFrames ACTIVE?
ONSCREEN_Stats = false; // Testing Info Onscreen?
MAX_Skips = room_speed/2; // MAX Skips per second (Prevent Skip every Frame Errors) (2+)
FSKIP_ArrayCount = room_speed*3; // How many FPS Frames to Average (2+)
MAXFRAMES_Missed = ceil(room_speed*0.10); // Allow 0.10 (10%) Frame Loss before Activate

FSKIP_Index = 0; // Index that increments every step - DO NOT CHANGE
SKIPEvery = -1; // SKIP Off by Default - DO NOT CHANGE

//SET FPSIndex[] Array to room_speed 
for(var i = 0; i <FSKIP_ArrayCount; i ++){FPSIndex[i] = room_speed;} FPS=room_speed;



