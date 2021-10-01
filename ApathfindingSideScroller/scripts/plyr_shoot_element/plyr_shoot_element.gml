/// @description Switch Case for element fired from shoot_source based on active_atom_slot
function plyr_shoot_element(extract_bullet,player_id, player_obj) {
	//arguments
	/*
	argument0 = extract_bullet_px
	player_id = active_elem_slot[x]
	player_obj = obj_plyrx
	player_id = shoot_source_originator script
	*/

	var inst; //set up for instance create
	var inst_spr; //set up for spread instance
	var dpth = depth+1;//depth of bullet
	var mixture = global.player_active_mixture[player_id];
	var activeShot = global.player_active_weapon_slot[player_id];
	var weapon_string = global.player_weapon_slot[player_id][mixture][activeShot]

	switch(weapon_string)
	{
	//Element Extractor
	case "null":
	if player_id = 0
	image_blend = make_color_rgb(200,255,255);
	if player_id = 1
	image_blend = make_color_rgb(255,220,100);
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),
	y + lengthdir_y(70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth,extract_bullet);
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 20;
	break;

	//Hydrogen
	default:
	case "h":
	image_blend = make_color_rgb(255,185,0);
	inst = instance_create_depth(x + lengthdir_x(40*image_xscale,image_angle),y + lengthdir_y(40*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_h)
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 18;
	break;

	//Sodium
	case "na":
	image_blend = make_color_rgb(255,255,255);
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),y + lengthdir_y(50*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_na);
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 30;
	break;

	//Potassium
	case "k":
	image_blend = make_color_rgb(255,255,0);
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),y + lengthdir_y(70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_k);
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 8;
	break;

	//Barium
	case "ba":
	image_blend = make_color_rgb(180,180,0);
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),y + lengthdir_y(70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_ba);
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 24;
	break;

	//Holmium
	case "ho":
	image_blend = make_color_rgb(0,180,0);
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),y + lengthdir_y(70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_ho);
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 14;
	break;

	//Carbon
	case "c":
	image_blend = make_color_rgb(255,175,175);
	//instance_create_depth(,,);
	player_obj.cool_down_shoot = 20;
	break;

	//Nitrogen
	case "n":
	image_blend = make_color_rgb(100,100,255);
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),y + lengthdir_y(70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_n);
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
		bullet_controller = player_obj;
	}
	player_obj.cool_down_shoot = 5;
	break;

	//Oxygen
	case "o":
	image_blend = make_color_rgb(0,255,255);
	//instance_create_depth(,,,);
	player_obj.cool_down_shoot = 20;
	break;

	//Fluorine
	case "f":
	image_blend = make_color_rgb(255,0,0);
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),y + lengthdir_y(70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_f);
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 30;
	break;

	//Chlorine
	case "cl":
	image_blend = make_color_rgb(0,255,0);
	for(var i = -15; i <= 15; i+=15)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),
	y + lengthdir_y(70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_cl);   
	with(inst_spr)
	{
	    plyr_shoot_source_originator(player_id);
	}
	inst_spr.image_angle += i;
	}
	
	scr_play_sound(snd_common_element_shoot_cl,0,1,1.1);
	player_obj.cool_down_shoot = 24;
	break;

	//Bromine
	case "br":
	image_blend = make_color_rgb(128,0,0);
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),y + lengthdir_y(70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_br);
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 25;
	break;

	//Iodine
	case "i":
	image_blend = make_color_rgb(200,128,200);
	for (var i = 0; i < 10; i++)
	{
	inst = instance_create_depth(x + lengthdir_x((i/2.5)*70*image_xscale,image_angle),y + lengthdir_y((i/2.5)*70*image_xscale,image_angle) + (player_obj.var_crouching * 30),dpth, plyr_bullet_i);
	with (inst)
	{
		bullet_data[0] = 45//-(i*1.5);
		plyr_shoot_source_originator(player_id);
	}
	}
	
	scr_play_sound(snd_common_element_shoot_i,0,1,1.1);

	player_obj.cool_down_shoot = 35;
	break;
	}




}
