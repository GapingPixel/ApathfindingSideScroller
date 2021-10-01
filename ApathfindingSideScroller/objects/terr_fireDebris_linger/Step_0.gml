/// @description Gravity and Particles
event_inherited();

grav_decay -= 1

if grav_decay < 0
    Gravity();
    

part_particles_create(global.parsys,x+random_range(-sprite_width/4,sprite_width/4),
y+sprite_height/2,part_var_enemy_hit_fire,6);

//disable gravity when on ground
if onGround
{
    motion_set(image_angle,0)
}

//destroy instance when out of view
if out_of_view(0)
{
	instance_destroy();
}

