/// @description Burning Alarm
if env_heat_value < 10
env_heat_value += 1;
env_dur -= 1;
alarm[2] = 60;

