
DrawShadow(0,0,1.5,1)

scr_skeleton_animation_noninterpolate();

if enemy_hp <= 0
draw_sprite_shake(20);
else
draw_self();

