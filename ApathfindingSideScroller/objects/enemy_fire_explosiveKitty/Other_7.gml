/// @description Animation End

/*
//Jump to Fall (acutal jump)
var anim = skeleton_animation_get();
if anim = "1_jump"
{
    vy -= jumpHeight * random_range(0.9,1.1);
    scr_play_sound(snd_enemy_elem_fire_kitty_jump,0,1,1)
   
   #region Particles
	var part_var_kitty_jump = part_type_create();
	part_type_shape(part_var_kitty_jump,pt_shape_line);
	part_type_size(part_var_kitty_jump,1,1,-0.05,0);
	part_type_scale(part_var_kitty_jump,1,0.75);
	part_type_color3(part_var_kitty_jump,255,8421631,255);
	part_type_alpha2(part_var_kitty_jump,1,0);
	part_type_speed(part_var_kitty_jump,5,12,0,0);
	part_type_direction(part_var_kitty_jump,0,180,0,0);
	part_type_orientation(part_var_kitty_jump,0,0,0,0,1);
	part_type_blend(part_var_kitty_jump,1);
	part_type_life(part_var_kitty_jump,15,30);
	#endregion
    part_particles_create(global.parsys,x,y+(sprite_height/2),part_var_kitty_jump,155);
    skeleton_animation_set("0_fall");
    
    //Poop explosion in the bottom
	instance_create_depth(x,y+(sprite_height/2),depth,enemy_bullet_fire_kittyExplosion);
    
}

//Land to idle
if anim = "3_land"
{
    image_speed = 0.5;
    skeleton_animation_set("0_idle");
    alarm[1] = choose(35,25,15);
}

//Turn to idle
if anim = "4_turn"
{
    image_speed = 0.5;
    skeleton_animation_set("0_idle");
}