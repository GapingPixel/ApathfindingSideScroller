/// @description Insert description here
// You can write your code in this editor
var target = parPlyr;
var range = 400

if (instance_exists(target)) {
    if (distance_to_object(target) < range) && (alarm[0] == -1) {
        alarm[0] = 180;
    }
}