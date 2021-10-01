/// @description Insert description here
// You can write your code in this editor

//basic variables
fire_arc_spawn_count = 0;
fire_arc_max_spawn = 6;

//set up spawn angle, distance, speed, etc. 
fire_arc_angle = image_angle;
fire_arc_distance = 300;
fire_arc_orbit_x = x + lengthdir_x(fire_arc_distance, fire_arc_angle);
fire_arc_orbit_y = y + lengthdir_y(fire_arc_distance, fire_arc_angle);
if (fire_arc_angle > 1) {
    fire_arc_orbit_speed = 3;
} else {
    fire_arc_orbit_speed = -3;
}  

//create tube at end of arc
var xx = x + lengthdir_x(fire_arc_distance * 2, fire_arc_angle);
var yy = y + lengthdir_y(fire_arc_distance * 2, fire_arc_angle);
instance_create_layer(xx, yy, layer, terr_fire_arc_end);