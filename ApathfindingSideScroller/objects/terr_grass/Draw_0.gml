
    
if object_state = objectState.onFire
{
image_blend = make_color_rgb(255 - (env_heat_value*20),255 - (env_heat_value*20),255 - (env_heat_value*20))
}

DrawShadow(0,0,image_xscale/2,1)
draw_sprite_skew(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha,skew,0);