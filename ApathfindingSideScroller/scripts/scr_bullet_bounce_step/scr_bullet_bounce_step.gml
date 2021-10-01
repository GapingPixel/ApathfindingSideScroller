// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bullet_bounce_step(){

image_angle = direction;

var sWidth = sprite_width/2
var sHeight = sprite_height/2
    
if place_meeting(x+lengthdir_x(sWidth*image_xscale,image_angle),y +lengthdir_y(sHeight*image_xscale,image_angle),parSolid) 
{
    move_bounce_all(true);
    bullet_data[5] -= 1;
	bullet_data[6] = 10;
    scr_play_sound(snd_common_element_shoot_bounce,0,0.9,0.95);
}

if bullet_data[5] > 0
bullet_data[6] -= 1;

if bullet_data[6] > 0
image_index = 1;
else
image_index = 0;

if bullet_data[5] = 0
{
    instance_destroy();    
}

}