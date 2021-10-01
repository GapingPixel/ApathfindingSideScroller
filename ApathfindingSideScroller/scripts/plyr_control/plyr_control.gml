/// @description Control variables
function plyr_control(argument0) {
	//arg0
	//0 for p1, 1 for p2

	var control = argument0;

	if var_hit = 0 && var_super = 0
	{
	    //analog stick
	    thres = 0.20;//threshold
	    dz = 0.10;//deadzone
	    gamepad_set_axis_deadzone(control,dz);
    
    
	    //lsHor and lsVer Releas for thumbsticks
	    lsHor = gamepad_axis_value(control,gp_axislh);
	    lsVer = gamepad_axis_value(control,gp_axislv);
    
	    //Release Variable charge for releasing the thumbstick axis
	    lsHorRelease -= 1;
    
	    if lsHorRelease < 0
	        lsHorRelease = 0;
        
	    if lsHorRelease > 10
	        lsHorRelease = 10;
        
	    lsVerRelease -= 1;
    
	    if lsVerRelease < 0
	        lsVerRelease = 0;
        
	    if lsVerRelease > 10
	        lsVerRelease = 10;
    
	    //right and left
	    right_inp = max(keyboard_check(global.config_right_k[control]),gamepad_button_check(control,global.config_right[control]),0);
	    left_inp = max(keyboard_check(global.config_left_k[control]),gamepad_button_check(control,global.config_left[control]),0);
    
	    rightPress_inp = max(keyboard_check_pressed(global.config_right_k[control]),gamepad_button_check_pressed(control,global.config_right[control]),0);
	    leftPress_inp = max(keyboard_check_pressed(global.config_left_k[control]),gamepad_button_check_pressed(control,global.config_left[control]),0);

	    rightRelease_inp = max(keyboard_check_released(global.config_right_k[control]),gamepad_button_check_released(control,global.config_right[control]),0);
	    leftRelease_inp = max(keyboard_check_released(global.config_left_k[control]),gamepad_button_check_released(control,global.config_left[control]),0);

    
	    //up and down
	    up_inp = max(keyboard_check(global.config_up_k[control]),gamepad_button_check(control,global.config_up[control]),0);
	    down_inp = max(keyboard_check(global.config_down_k[control]),gamepad_button_check(control,global.config_down[control]),0);
    
	    upPress_inp = max(keyboard_check_pressed(global.config_up_k[control]),gamepad_button_check_pressed(control,global.config_up[control]),0);
	    downPress_inp = max(keyboard_check_pressed(global.config_down_k[control]),gamepad_button_check_pressed(control,global.config_down[control]),0);
    
	    upRelease_inp = max(keyboard_check_released(global.config_up_k[control]),gamepad_button_check_released(control,global.config_up[control]),0);
	    downRelease_inp = max(keyboard_check_released(global.config_down_k[control]),gamepad_button_check_released(control,global.config_down[control]),0);

    
	    ///Analog Stick
	    //Horizontal Held
		
	    if (abs(lsHor) > thres)
	    {
	        right_inp = max(lsHor,0);
	        left_inp = abs(min(lsHor,0));
	    }
    
	    if right_inp || left_inp
		{
			if right_inp { lsStickDirection[0] = 1; }
			if left_inp { lsStickDirection[0] = 2; }
	        lsHorRelease += abs(lsHor)*10;
		}
        
		
	    //Horizontal Release       
	    if lsHorRelease < 10 && lsHorRelease > 5
	    {
			if lsStickDirection[0] = 2
				leftRelease_inp = true;
			if lsStickDirection[0] = 1
				rightRelease_inp = true;
				
			alarm[4] = 1;//Set thumb stick to neutral
	    }
    
	    //Vertical Held
	    if (abs(lsVer) > thres)
	    {
	        down_inp = max(lsVer,0);
	        up_inp = abs(min(lsVer,0));
	    }
    
	    if up_inp || down_inp
		{
			if down_inp { lsStickDirection[1] = 1; }
			if up_inp { lsStickDirection[1] = 2; }
	        lsVerRelease += abs(lsVer)*10;
		}
    
	    //Vertical Released
	    if lsVerRelease < 10 && lsVerRelease > 5
	    {
	        if lsStickDirection[1] = 2
				upRelease_inp = true;
			if lsStickDirection[1] = 1
				downRelease_inp = true;
			
	        alarm[4] = 1;
	    }

	    //jump
	    jump_inp = max(keyboard_check_pressed(global.config_jump_k[control]),gamepad_button_check_pressed(control,global.config_jump[control]),0);
	    jumpHeld_inp = max(keyboard_check(global.config_jump_k[control]),gamepad_button_check(control,global.config_jump[control]),0);
	    jumpRelease_inp = max(keyboard_check_released(global.config_jump_k[control]), gamepad_button_check_released(control,global.config_jump[control]),0);
    
	    //dash
	    dash_inp = max(keyboard_check_pressed(global.config_dash_k[control]),gamepad_button_check_pressed(control,global.config_dash[control]),0);
    
	    //aim
	    aim_inp = max(keyboard_check_pressed(global.config_aim_k[control]), gamepad_button_check_pressed(control,global.config_aim[control]),0);
	    aimHeld_inp = max(keyboard_check(global.config_aim_k[control]), gamepad_button_check(control,global.config_aim[control]),0);
	    aimRelease_inp = max(keyboard_check_released(global.config_aim_k[control]), gamepad_button_check_released(control,global.config_aim[control]),0);
    
	    //shoot
	    shoot_inp = max(keyboard_check_pressed(global.config_shoot_k[control]), gamepad_button_check_pressed(control,global.config_shoot[control]),0);
	    shootHeld_inp = max(keyboard_check(global.config_shoot_k[control]), gamepad_button_check(control,global.config_shoot[control]),0);
	    shootRelease_inp = max(keyboard_check_released(global.config_shoot_k[control]), gamepad_button_check_released(control,global.config_shoot[control]),0);
    
	    //switch element
	    switch_element_inp = max(keyboard_check_pressed(global.config_switch_k[control]), gamepad_button_check_pressed(control,global.config_switch[control]),0);
	    switch_elementHeld_inp = max(keyboard_check(global.config_switch_k[control]), gamepad_button_check(control,global.config_switch[control]),0);
    
	    //chemical blast
	    chemblast_inp = max(keyboard_check_pressed(global.config_chem_blast_k[control]), gamepad_button_check_pressed(control,global.config_chem_blast[control]),0);
	    chemblastHeld_inp = max(keyboard_check(global.config_chem_blast_k[control]), gamepad_button_check(control,global.config_chem_blast[control]),0);
	    chemblastRelease_inp = max(keyboard_check_released(global.config_chem_blast_k[control]) ,gamepad_button_check_released(control,global.config_chem_blast[control]),0);
    
	    //Switch Mixture
	    switch_mixture_inp = max(keyboard_check_pressed(global.config_mix_switch_k[control]), gamepad_button_check_pressed(control,global.config_mix_switch[control]),0);
    
	    //Chemical Ball
		var chemball_button_combo;
		var room_state = global.game_room_state;
		if room_state != roomState.Flight
			chemball_button_combo = (down_inp && switch_elementHeld_inp && aim_inp);
		else
			chemball_button_combo = (switch_elementHeld_inp && aim_inp);
		
	    chemball_inp = max(keyboard_check_pressed(global.config_chem_ball_k[control]), gamepad_button_check_pressed(control,global.config_chem_ball[control]), chemball_button_combo,0);
	    chemballReturn_inp = max(keyboard_check_pressed(global.config_chem_ball_k[control]),gamepad_button_check_pressed(control,global.config_chem_ball[control]), chemball_button_combo,0);
    
		//Mash Input
		mash_inp = leftPress_inp || rightPress_inp || upPress_inp || downPress_inp || aim_inp || switch_element_inp || jump_inp || shoot_inp || dash_inp || chemblast_inp;
	}
	else
	{
	    //sets variables to zero when damaged
	    right_inp = 0
	    rightPress_inp = 0
	    rightRelease_inp = 0
	    left_inp = 0
	    leftPress_inp = 0
	    leftRelease_inp = 0
	    up_inp = 0
	    upPress_inp = 0
	    upRelease_inp = 0
	    down_inp = 0
	    downPress_inp = 0
	    downRelease_inp = 0
	    jump_inp = 0
	    jumpHeld_inp = 0
	    shoot_inp = 0
	    shootHeld_inp = 0
	    shootRelease_inp = 0
	    aim_inp = 0
	    chemblast_inp = 0
	    chemblastHeld_inp = 0
	    chemblastRelease_inp = 0
	    switch_element_inp = 0
	    chemball_inp = 0
	    chemballReturn_inp = 0
		mash_inp = 0
	}

	//Manage Ammo counts
	var mix_id = global.player_active_mixture[control]
	
	var MaxAmmo = global.player_weapon_slot[control][mix_id][5];
	if global.player_weapon_slot[control][mix_id][4] > MaxAmmo
		global.player_weapon_slot[control][mix_id][4] = MaxAmmo;
		
	if global.player_chem_blast[control][2] > 100
		global.player_chem_blast[control][2] = 100;

}
