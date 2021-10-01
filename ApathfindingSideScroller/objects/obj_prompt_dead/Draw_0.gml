event_inherited();
var str_dead = scr_get_string(422);


//YOU DIED
repeat(3)
draw_text_transformed_color(x+random_range(-5,5),y+random_range(-5,5),str_dead,8,20,5,
c_black,c_black,
c_black,c_black,image_alpha);

draw_text_transformed_color(x+random_range(-5,5),y+random_range(-5,5),str_dead,8,20,5,
c_white,c_white,
c_white,c_white,image_alpha);

/*
if retry_prompt = true
{
alpha = clamp(alpha + (0.05),0,0.8);
draw_set_alpha(alpha);
//draw_sprite_stretched_ext(spr_trans_black,-1,cam_x,cam_y,960, 540,c_red, alpha);
//draw_set_alpha(alpha + 0.3);
}
*/

