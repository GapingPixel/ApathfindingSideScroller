/// @description Insert description here
// You can write your code in this editor
/*if keyboard_check(vk_up) and alarm_get(0) == -1 {
	image_angle +=45;
	alarm_set(0,5);
}*/
if alarm_get(0) == -1 {

	var _plyr = instance_nearest(x,y,parPlyr);
	image_angle = ( abs(point_direction(x,y,_plyr.x,_plyr.y)/90)*90 );

	alarm_set(0,5);

}

