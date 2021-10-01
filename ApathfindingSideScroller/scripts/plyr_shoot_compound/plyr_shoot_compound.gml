function plyr_shoot_compound(player_id, player_obj) {
	//Chemical Blast script key
	/*
	ar0 = comp and chemical_energy gauge and mixture
	ar1 = obj_plyrx
	ar2 = player_id 1 or 2
	//Use cool_down_shoot for non special shots and cool_down_shoots for Special Shot Animations
	*/

	var inst; //for single
	var inst_spr; //for spread
	var dpth = -1;
	var i;//for loop
	//var c_pink = make_color_rgb(255,255,128);//PINK for Carbon
	var mixture = global.player_active_mixture[player_id]
	var compound = global.player_weapon_slot[player_id][mixture][2]
	var isLaser = false;//Boolean to check when a shot is a laser/charge shot
	var crouchShot = player_obj.var_crouching * 30;//Offset Value for shots when ducking

	switch(compound)
	{
		
	#region//Diatomics
	case "H2":
	
	image_blend = c_orange;
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_h2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 20;
	break;


	case "Na2":
	image_blend = c_gray;
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + crouchShot,dpth,plyr_bulletComp_na2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 25;
	break;

	case "K2":
	image_blend = c_gray;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_k2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 6;
	break;


	case "Ba2":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle),
	dpth,plyr_bulletComp_ba2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 25;
	break;


	case "Ho2":
	image_blend = c_gray;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ho2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 20;
	break;

	/*
	case "C2":
	player_obj.var_chem_blast = 0
	image_blend = make_color_rgb(175,175,175)
	instance_create_depth(x,y,plyr_bulletComp_cs2);
	player_obj.cool_down_shoot = 25;
	break;
	*/

	case "N2":
	isLaser = true;
	image_blend = c_aqua;
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),
	y + lengthdir_y(70*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_n2);
	with(inst)
	{
	     plyr_shoot_source_originator(player_id);
		 bullet_controller = player_obj;
	}
	player_obj.cool_down_shoot = 4;
	break;


	case "O2":
	image_alpha = 0;
	var inst =instance_create_depth(x,y,dpth*10,plyr_bulletComp_o2);
	with (inst)
	{
		bullet_parent = player_obj;
		plyr_shoot_source_originator(player_id);
	}
	player_obj.cool_down_shoot = 30;
	break;


	case "F2":
	image_blend = c_red;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + crouchShot,
	dpth,plyr_bulletComp_f2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 30;
	break;


	case "Cl2":
	image_blend = c_yellow;
	for(i = -45; i <= 45; i += 15)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_cl2);
	with(inst_spr)
	{
	    plyr_shoot_source_originator(player_id);
	}
	inst_spr.image_angle += i;
	}

	audio_play_sound(snd_common_element_shoot_cl,10,false);
	player_obj.cool_down_shoot = 30;
	break;


	case "Br2":
	
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + crouchShot,
	dpth,plyr_bulletComp_br2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;


	case "I2":
	for (var i = 0; i < 10; i++)
	{
	inst = instance_create_depth(x + lengthdir_x((i/2.5)*70*image_xscale,image_angle),
	y + lengthdir_y((i/2.5)*70*image_xscale,image_angle) + (crouchShot),
	dpth, plyr_bulletComp_i2);
	with (inst)
	{
		bullet_data[0] = 45//-(i*1.5);
		plyr_shoot_source_originator(player_id);
	}
	}
	scr_play_sound(snd_common_element_shoot_i,0,0.5,0.6)
	player_obj.cool_down_shoot = 30;
	break;
	//end of diatomics


#endregion

	#region//Hydrogen combos
	case "HNa":
	image_blend = c_orange
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hna);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 30;
	break;


	case "HK":
	image_blend = c_orange;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hk);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 8;
	break;


	case "H2Ba":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_h2ba);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 25;
	break;


	case "HF":
	inst = instance_create_depth(x + lengthdir_x(70*image_xscale,image_angle),
	y + lengthdir_y(70*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hf);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 10;
	break;

	case "HCl":
	for(i = -20; i <= 20; i += 20)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(40*image_xscale,image_angle),
	y + lengthdir_y(40*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hcl);
	with(inst_spr)
	{
	    plyr_shoot_source_originator(player_id);
	}
	inst_spr.image_angle += i;    
	}
	player_obj.cool_down_shoot = 30;
	break;


	case "HoH3":
	image_blend = c_orange;
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hoh3);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 20;
	break;

	case "CH4":
	image_blend = c_orange;
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_h2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "H3N":
	image_blend = c_aqua;
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_h3n);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 20;
	break;

	case "H2O":
	image_blend = c_white;
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_h2o);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 20;
	break;

	case "HBr":
	image_alpha = 0;
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_h2);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 25;
	break;

	case "HI":
	image_alpha = 0;
	inst = instance_create_depth(x + lengthdir_x(25*image_xscale,image_angle),
	y + lengthdir_y(25*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hi);
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 30;
	break;
	//End of Hydrogen combos

#endregion

	#region//Sodium Combos
	case "NaK":
	image_blend = c_aqua;
	inst = instance_create_depth(x + lengthdir_x(30*image_xscale,image_angle),
	y + lengthdir_y(30*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_nak);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 8;
	break;

	case "Na2Ba":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_na2ba);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 35;
	break;

	case "CNa4":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_na2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "Na3N":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_na3n);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "Na2O":
	inst = instance_create_depth(x,
	y,
	dpth,plyr_bulletComp_na3n);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "NaF":
	audio_play_sound(snd_plyr_chem_blast,0,false);
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_naf);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 30;
	break;

	case "NaCl":
	for(i = -20; i <= 20; i += 20)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(30*image_xscale,image_angle),
	y + lengthdir_y(30*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_nacl);
	with(inst_spr)
	    plyr_shoot_source_originator(player_id);
    
	inst_spr.image_angle += i;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "NaBr":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_na3n);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "NaI":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_nai);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

#endregion

	#region//Potassium Combos
	case "K2Ba":
	image_blend = c_gray;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_k2ba);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 9;
	break;

	case "HoK3":
	image_blend = c_gray;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_k3ho);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 8;
	break;

	case "CK4":
	image_blend = c_gray;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_kf);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 9;
	break;

	case "K3N":
	image_blend = c_aqua;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_k3n);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 9;
	break;

	case "K2O":
	image_alpha = 0;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_kf);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "KF":
	image_blend = c_yellow;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_kf);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 9;
	break;

	case "KCl":
	image_blend = c_lime;
	for(i = -30; i <= 30; i+=15)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_kcl);   
	with(inst_spr)
	{
	    plyr_shoot_source_originator(player_id);
	}
	inst_spr.image_angle += i;
	}
	audio_play_sound(snd_common_element_shoot_k,0,false);
	audio_play_sound(snd_common_element_shoot_cl,1,false);
	scr_play_sound(snd_common_salt_bang,0,1.1,1.2);
	player_obj.cool_down_shoot = 9;
	break;

	case "KBr":
	image_blend = c_lime;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_kbr);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 9;
	break;

	case "KI":
	image_blend = c_lime;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ki);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
		
	scr_play_sound(snd_common_element_shoot_i,0,1,1);
	scr_play_sound(snd_common_element_shoot_cl,0,1,1);
	scr_play_sound(snd_common_salt_bang,0,1,1.1);
	player_obj.cool_down_shoot = 6;
	break;
#endregion

	#region//Barium Combos
	case "Ho2Ba3":

	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ho2ba3);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 30;
	break;


	case "CBa2":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ba2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;


	case "Ba3N2":
	
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ba3n2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;


	case "BaO":
	for(i = 0; i <= 360; i += 45)
	{
	inst_spr = instance_create_depth(x,
	y,
	dpth,plyr_bulletComp_ba2);   
	
	inst_spr.image_angle = i;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "BaF2":
	image_blend = c_yellow;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_baf2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;


	case "BaCl2":
	image_blend = c_lime;
	for(i = -30; i <= 30; i+=30)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_bacl2);
	with(inst_spr)
	    plyr_shoot_source_originator(player_id);

	inst_spr.image_angle += i;
	}
	player_obj.cool_down_shoot = 25;
	break;

	case "BaBr2":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ho2ba3);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 25;
	break;


	case "BaI2":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_bai2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 25;
	break;
#endregion

	#region//Holmium Combos
	case "C2Ho2":
	image_alpha = 0;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ho2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "HoN":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hoh3);   
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
		bullet_controller = player_obj;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "Ho2O3":
	image_alpha = 0;

	inst = instance_create_depth(x,
	y,
	dpth,plyr_bulletComp_ho2);   
	
	
	player_obj.cool_down_shoot = 35;
	break;

	case "HoCl3":
	image_alpha = 1;
	for(i = -30; i <= 30; i+=30)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hocl3);
	with(inst_spr)
	    plyr_shoot_source_originator(player_id);

	inst_spr.image_angle += i;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "HoBr3":
	image_alpha = 1
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ho2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "HoI3":
	image_alpha = 0;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ho2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 30;
	break;

#endregion

	#region//Carbon Combos
	case "C2N2":
	image_alpha = 0;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle),
	dpth,plyr_bulletComp_ho2); 
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;


	case "CO2":
	image_alpha = 0;

	inst = instance_create_depth(x ,y,
	dpth,plyr_bulletComp_ho2);   
	player_obj.cool_down_shoot = 15;
	break;

	case "CF4":
	isLaser = true;
	image_blend = c_red;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + crouchShot,
	dpth,plyr_bulletComp_ho2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;

	case "CCl4":
	image_alpha = 0;
	for(i = -30; i <= 30; i+=30)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + crouchShot,
	dpth,plyr_bulletComp_hocl3);
	with(inst_spr)
	    plyr_shoot_source_originator(player_id);

	inst_spr.image_angle += i;
	}
	player_obj.cool_down_shoot = 35;
	break;

	case "CBr4":
	image_alpha = 0;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + crouchShot,
	dpth,plyr_bulletComp_ho2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 35;
	break;

	case "CI4":
	isLaser = true;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + crouchShot,
	dpth,plyr_bulletComp_ho2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;
#endregion

	#region//Nitrogen Combos
	case "N2O3":
	image_alpha = 0;

	for(i = 0; i <= 360; i += 45)
	{
	inst_spr = instance_create_depth(x,
	y,
	dpth,plyr_bulletComp_ho2);   
	
	inst_spr.image_angle = i;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "F3N":
	isLaser = true;
	image_blend = c_red;
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_f3n);   
	with(inst)
	{
	    plyr_shoot_source_originator(player_id);
		bullet_controller = player_obj;
	}
	player_obj.cool_down_shoot = 4;
	break;

	case "Cl3N":
	for(i = -30; i <= 30; i+=30)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hocl3);
	with(inst_spr)
	    plyr_shoot_source_originator(player_id);

	inst_spr.image_angle += i;
	}
	player_obj.cool_down_shoot = 35;
	break;

	case "Br3N":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ho2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 25;
	break;

	case "I3N":

	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_ho2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;
	#endregion

	#region//Oxygen Combos
	case "F2O":
	image_alpha = 0;


	for(i = 0; i <= 360; i += 45)
	{
	inst_spr = instance_create_depth(x,
	y,
	dpth,plyr_bulletComp_h2);   
	
	inst_spr.image_angle = i;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "Cl2O":
	image_alpha = 0;

	for(i = 0; i <= 360; i += 45)
	{
	inst_spr = instance_create_depth(x,
	y,
	dpth,plyr_bulletComp_h2);   
	
	inst_spr.image_angle = i;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "Br2O":
	image_alpha = 0;

	for(i = 0; i <= 360; i += 45)
	{
	inst_spr = instance_create_depth(x,
	y,
	dpth,plyr_bulletComp_h2);   
	
	inst_spr.image_angle = i;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "I2O":
	image_alpha = 0;
	for(i = 0; i <= 360; i += 45)
	{
	inst_spr = instance_create_depth(x,
	y,
	dpth,plyr_bulletComp_h2);   
	
	inst_spr.image_angle = i;
	}
	player_obj.cool_down_shoot = 15;
	break;
#endregion

	#region//Fluorine Combos
	case "FCl":
	image_blend = c_orange;
	for(i = -30; i <= 30; i+=30)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth, plyr_bulletComp_fcl);   
	with(inst_spr)
	{
	    plyr_shoot_source_originator(player_id);
	}
	inst_spr.image_angle += i;
	}
	audio_play_sound(snd_common_element_shoot_f,0,false);
	audio_play_sound(snd_common_element_shoot_cl,0,false);
	player_obj.cool_down_shoot = 30;
	break;

	case "FBr":
	image_blend = c_orange;

	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_fbr);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 30;
	break;

	case "FI":
	image_blend = c_orange;

	for (i = 0; i < 10; i++)
	{
	inst = instance_create_depth(x + lengthdir_x((i/2.5)*70*image_xscale,image_angle),y + lengthdir_y((i/2.5)*70*image_xscale,image_angle) + (player_id.var_crouching * 30),dpth, plyr_bulletComp_fi);
	with (inst)
	{
		bullet_data[0] = 45//-(i*1.5);
		plyr_shoot_source_originator(player_id);
	}
	}
	scr_play_sound(snd_common_fire_ignite_1,0,0.5,0.5);
	scr_play_sound(snd_common_element_shoot_i,0,1,1.1);

	player_obj.cool_down_shoot = 30;
	break;
#endregion

	#region//Chlorine Combos
	case "ClBr":
	for(i = -30; i <= 30; i+=30)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_hocl3);
	with(inst_spr)
	    plyr_shoot_source_originator(player_id);

	inst_spr.image_angle += i;
	}
	player_obj.cool_down_shoot = 15;
	break;

	case "ClI":
	image_blend = c_yellow
	for(i = -45; i <= 45; i+=45)
	{
	inst_spr = instance_create_depth(x + lengthdir_x(80*image_xscale,image_angle),
	y + lengthdir_y(80*image_xscale,image_angle) + (crouchShot),
	dpth,plyr_bulletComp_cli);
	with(inst_spr)
	{
	    plyr_shoot_source_originator(player_id);
	
		image_xscale *= 5;
	}

	inst_spr.image_angle += i;
	}
	player_obj.cool_down_shoot = 30;
	break;
#endregion

	#region//Bromine Combos
	case "BrI":
	inst = instance_create_depth(x + lengthdir_x(50*image_xscale,image_angle),
	y + lengthdir_y(50*image_xscale,image_angle) + crouchShot,
	dpth,plyr_bulletComp_h2);   
	with(inst)
	    plyr_shoot_source_originator(player_id);
	player_obj.cool_down_shoot = 15;
	break;
	#endregion

#region//Iodine Combos
	/// PSYCKE! We already did 'em!
#endregion

	}

	//Remove compound and elements when energy is zero
		global.player_weapon_slot[player_id][mixture][4] -= 1;
		if global.player_weapon_slot[player_id][mixture][4] <= 0
		{
		    plyr_flush_elements(player_id)
		}




}
