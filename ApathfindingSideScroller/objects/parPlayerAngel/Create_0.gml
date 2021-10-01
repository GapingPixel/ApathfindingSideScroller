/// @description Insert description here
playerAngel_var_plyr_id = 0; //Determines
image_speed = 0.15;
playerAngel_var_revive = false;
playerAngel_var_halo_frame = 0; //For halo animation
playerAngel_var_glow_alpha = 1;//Glow of angel
playerAngel_var_glow_fade = true;
alarm[0] = 5;//Halo animation tick
playerAngel_var_hold_delay = 60;//delay determine by raw death count

var room_state = global.game_room_state
if room_state = roomState.Flight
{
	image_xscale = 0.6;
	image_yscale = 0.6;
}

switch(global.character[playerAngel_var_plyr_id])
{
	
	case 0: sprite_index = p1_angel; break;
	case 1: sprite_index = p2_angel; break;
	
}

#region//Particles
part_var_playerAngel_sparkles = part_type_create();
part_type_sprite(part_var_playerAngel_sparkles,spr_effect_light_twinkle,0,0,0);
part_type_size(part_var_playerAngel_sparkles,0.05,0.25,0,0);
part_type_scale(part_var_playerAngel_sparkles,1,1);
part_type_color1(part_var_playerAngel_sparkles,16777215);
part_type_alpha2(part_var_playerAngel_sparkles,1,0);
part_type_speed(part_var_playerAngel_sparkles,1,1,0,0);
part_type_direction(part_var_playerAngel_sparkles,-45,225,0,0);
part_type_gravity(part_var_playerAngel_sparkles,0.01,270);
part_type_blend(part_var_playerAngel_sparkles,1);
part_type_life(part_var_playerAngel_sparkles,60,120);


part_var_playerAngel_bing = part_type_create();
part_type_sprite(part_var_playerAngel_bing,spr_effect_light_twinkle,0,0,0);
part_type_size(part_var_playerAngel_bing,1,1,-0.02,0);
part_type_scale(part_var_playerAngel_bing,1,0.25);
part_type_color3(part_var_playerAngel_bing,16777088,8454143,16744703);
part_type_speed(part_var_playerAngel_bing,15,0,0,0);
part_type_direction(part_var_playerAngel_bing,0,0,0,0);
part_type_orientation(part_var_playerAngel_bing,0,0,0,0,1);
part_type_blend(part_var_playerAngel_bing,1);
part_type_life(part_var_playerAngel_bing,20,0);
//for loop


part_var_playerAngel_burst = part_type_create();
part_type_sprite(part_var_playerAngel_burst,spr_effect_parry_bing,0,0,0);
part_type_size(part_var_playerAngel_burst,1,1,0.5,0);
part_type_color3(part_var_playerAngel_burst,12058623,16777173,14201087);
part_type_blend(part_var_playerAngel_burst,1);
part_type_life(part_var_playerAngel_burst,3,0);



part_var_playerAngel_halo = part_type_create();
part_type_sprite(part_var_playerAngel_halo,spr_effect_angel_halo,0,0,0);
part_type_size(part_var_playerAngel_halo,0.20,0.50,0.01,0);
part_type_alpha1(part_var_playerAngel_halo,1);
part_type_speed(part_var_playerAngel_halo,10,15,0,0);
part_type_direction(part_var_playerAngel_halo,0,0,0,0);
part_type_gravity(part_var_playerAngel_halo,0.50,270);
part_type_orientation(part_var_playerAngel_halo,0,0,20,0,0);
part_type_blend(part_var_playerAngel_halo,1);
part_type_life(part_var_playerAngel_halo,80,0);
//1


part_var_playerAngel_halo_orb = part_type_create();
part_type_sprite(part_var_playerAngel_halo_orb,spr_effect_angel_halo_orb,0,0,0);
part_type_size(part_var_playerAngel_halo_orb,0.20,0.50,0.015,0);
part_type_alpha1(part_var_playerAngel_halo_orb,1);
part_type_speed(part_var_playerAngel_halo_orb,15,20,0,0);
part_type_direction(part_var_playerAngel_halo_orb,choose(75,105),0,0,0);
part_type_gravity(part_var_playerAngel_halo_orb,0.50,270);
part_type_orientation(part_var_playerAngel_halo_orb,0,0,20,0,0);
part_type_blend(part_var_playerAngel_halo_orb,1);
part_type_life(part_var_playerAngel_halo_orb,80,0);

part_var_playerAngel_smoke = part_type_create();
part_type_sprite(part_var_playerAngel_smoke,spr_effect_smoke_small,1,1,0);
part_type_size(part_var_playerAngel_smoke,0.50,1,0,0.20);
part_type_color2(part_var_playerAngel_smoke,16744448,16777088);
part_type_alpha1(part_var_playerAngel_smoke,1);
part_type_speed(part_var_playerAngel_smoke,7,10,0,0);
part_type_direction(part_var_playerAngel_smoke,0,359,20,0);
part_type_blend(part_var_playerAngel_smoke,1);
part_type_life(part_var_playerAngel_smoke,20,0);
//5

part_var_playerAngel_smoke_poof = part_type_create();
part_type_sprite(part_var_playerAngel_smoke_poof,spr_effect_smoke_small,1,1,0);
part_type_size(part_var_playerAngel_smoke_poof,0.25,0.25,0,0.25);
part_type_color3(part_var_playerAngel_smoke_poof,16744448,16777088,16777215);
part_type_speed(part_var_playerAngel_smoke_poof,10,10,0,0);
part_type_orientation(part_var_playerAngel_smoke_poof,0,0,0,0,0);
part_type_blend(part_var_playerAngel_smoke_poof,1);
part_type_life(part_var_playerAngel_smoke_poof,20,0);
//1



#endregion

