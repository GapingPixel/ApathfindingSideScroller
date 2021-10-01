/// @description Extract Get Stop
var slow_down = 15;
var normal_speed = 60

if room_speed >= normal_speed
{
room_speed = slow_down;
alarm[6] = 1;
}
else
room_speed = normal_speed;
