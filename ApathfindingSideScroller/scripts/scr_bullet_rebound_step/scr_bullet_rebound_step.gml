// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bullet_rebound_step(){

if !ini
{
ini = true
bullet_data[4] *= image_xscale;
}
motion_set(image_angle,bullet_data[0] * bullet_data[4]);

//slowly rewind
if image_xscale = 1
bullet_data[4] -= 0.05;
else
bullet_data[4] += 0.05;

motion_add(image_angle + 15,1 * image_xscale);

if speed > 15 && depth < -500
    depth -= 1;
}