// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_env_material_drawMaterial(){
//script for drawing materials and shake when taking damage

if env_draw_shadow == true
DrawShadow(0,sprite_height,1.9* image_xscale,1);

if alarm_get(0) > 0
{
if env_dur > 0.1
draw_sprite_shake(1)
else
draw_sprite_shake(5)
}
else
draw_self();



}