
DrawShadow(0,0,1,1);

if enemy_hp <= 0
draw_sprite_ext(sprite_index,image_index,x+random_range(-5,5),y+random_range(-5,5),image_xscale,image_yscale,0,c_white,1)
else
draw_self();

