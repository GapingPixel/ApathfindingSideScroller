/// @description Insert description here
// You can write your code in this editor
part_particles_create(global.parsys_high,x,y,part_var_plyr_deadsmoke,1)
DeadPlayerHeads_var_img_ang = DeadPlayerHeads_var_img_ang mod 360


if y > room_height*2
    instance_destroy();
    

if image_yscale > 1
    image_yscale -= 0.05
