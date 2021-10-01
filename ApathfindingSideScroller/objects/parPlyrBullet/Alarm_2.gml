/// @description Trigger Homing Alarm
if image_xscale = -1
{
    image_angle += 180;
    image_xscale = 1;
}
bullet_data[2] = 1;