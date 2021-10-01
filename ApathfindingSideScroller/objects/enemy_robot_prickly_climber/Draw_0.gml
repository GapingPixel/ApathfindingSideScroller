DrawShadow(0,0,1.5,1);

scr_skeleton_animation_noninterpolate();

scr_element_glow(1);

if enemy_hp <= 0
draw_sprite_shake(15)
else
draw_self();

