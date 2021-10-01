// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_draw_flash(){

//Draw flashes when 

if enemy_hit_flash = true
	image_blend = c_yellow
	//draw_sprite_shadow(0,0,1,c_white,0.50);

var hot =  255 * (enemy_temp / enemy_temp_hot)
if enemy_temp > 0
	image_blend = make_color_rgb(255,255 - hot,255 - hot)
	//draw_sprite_shadow(0,0,0.95,c_orange,0.25 * (enemy_temp / enemy_temp_hot));

switch(enemy_state)
{
	default:
	//Empty
	break;
	
	case enemyState.FROZEN:
	image_blend = c_blue;
	//draw_sprite_shadow(0,0,1.1,c_aqua,0.25);
	break;
	
	case enemyState.SHOCKED:
	image_blend = choose(c_lime,c_yellow);
	//draw_sprite_shadow(0,0,1.05,choose(c_lime,c_yellow),0.25);
	break;
}



}