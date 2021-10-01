/// @description Insert description here
// You can write your code in this editor


if variable_instance_exists(id,"fire_arc_angle")
{
 fire_arc_angle += fire_arc_orbit_speed;      
 x = fire_arc_orbit_x + lengthdir_x(-fire_arc_distance, fire_arc_angle);
 y = fire_arc_orbit_y + lengthdir_y(-fire_arc_distance, fire_arc_angle);
}
 
 if place_meeting(x,y,terr_fire_arc_end) instance_destroy();