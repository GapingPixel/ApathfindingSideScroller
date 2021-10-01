// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_IK_system_draw(sIK){

for (var i = 0; i < seg_amount; i++) {
	
	//Sprite's center point should be middle left or middle right depending on the sprite
	draw_sprite_ext(sIK,0,seg_x[i], seg_y[i],1,1,
	point_direction(seg_x[i], seg_y[i],seg_x[i+1], seg_y[i+1]),
	image_blend,1)	
}

}