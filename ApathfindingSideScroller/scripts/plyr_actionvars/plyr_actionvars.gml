/// @description Variables for control, animation, and constant variables
function plyr_actionvars() {

	plyr_state = playerState.enable;

	facing = image_xscale;

	//player_state = playerState.enable;

	////////////////////////////Variables for thumbsticks
	lsHor = 0;
	lsVer = 0;
	lsHorRelease = 0;
	lsVerRelease = 0;
	lsStickOnce = false; //Mainly for flight animation
	lsStickDirection[0] = 0; //Detects which way the stick was pushed horizontally
	lsStickDirection[1] = 0; //Detects which way the stick was pushed vertically
	////////////////////////////

	#region /////////////////////////////////Physics Vars
	groundAccel = 1.00;
	groundFric  = 12;
	airAccel    = 0.75;
	airFric     = 0.15;
	vxMax       = 8;
	vyMax       = 30;
	jumpHeight  = 25.00;
	gravNorm    = 1.5;
	gravSlide   = 0.3; 
	gravDirection = 270;
	///////////////////////////////////////////////
	#endregion
	
	#region /////////////////////////////////Action and Animation Variables/////////////
	var_jumping = 0; //jump
	var_coyote_jump_frame = 0;//Frame Count for Coyote Timer
	var_coyote_jump_frame_max = 8;//Max Frame Count for Coyote Timer
	var_i_frame_count = 0;//Total I frames given when performing actions
	var_running = 0; //run
	var_dashing = 0; //dashing
	var_rolling = 0; //rolling
	var_crouching = 0; //holding down
	var_shooting = 0; //any kind of shooting
	var_chem_blast = 0; //handles chemical blasts, heavy shots 
	var_super = 0; //handles animations for supers
	var_wallgrab = 0; //wallgrab
	var_wallslide = 0; //handle wall sliding
	var_aiming = 0; //trigger aiming stance

	var_chemball_creating = 0; //handles chemical ball creation
	var_chemball_hold = 0; //handles movement when chemical ball is active
	var_chemball_throw = 0; //handles throwing of chemical ball when active

	var_parry = 0; //parry window
	var_parry_buffer = 0;//lag frames after parry to prevent imediate aiming or shooting
	var_parry_frame = 0;//frame count when inside a Element Bullet's Box to parry
	var_parry_frame_max = 5;//Max frame count before damage initiates
	//damage and death
	var_hit = 0;
	var_dead = 0;
	var_inv = 0;
	var_inv_cooldown = 0; //Cooldown to prevent lack of hitstun
	//////////////////////////////////
	#endregion


	#region /////////////////////////////Action Limiting Values
	var_mash_count = 0; //Value to count mash inputs
	var_mash_freeze_max = 10;//total mash to break out of freeze
	var_mash_shock_max = 240;//treated as a time frame; max time to break out of shock
	var_temp = 0; //variable when we are on hot(increases value)/cold(decreases value) objects

	//misc animation variables
	var_idle_count = 0; //for special idle animation playback
	var_anim = 0;//Handles animations for intros or disable states
	var_clearrun = 0;//For handling character movement upon completing a level
	var_aim_buffer = 0; //For buffering aim for heavy chemblasts when direction is let go
	var_bubble_timer = 0;//Handles timing of bubbles to spawn when underwater
	var_skid_timer = 0;//Handles when player runs then quickly turns over a period of time
	var_skid_timer_MAX = 180//Frame count to execute skiding time

	//extract shot limit
	extract_shot = 3;

	//cool down variables to handle fire rates, switching shots and mixtures
	cool_down_shoot = 0; //handle fire rate, higher number means more time
	cool_down_chem_blast = 0;//handle fire rate of chemical blasts; usually set to 15
	cool_down_switch = 0; //handle switching between weapons and mixtures
	cool_down_air_move = 0; //prevent dash spam or chem blast spam in air
	//////////////////////////////
	#endregion


	/////////////////////////////Constants
	dash_speed = 2;
	temp_depth = depth;

	///Squash and Stretch
	stretch_y = 1;
	stretch_x = 1;

	///Draw Variable for switching shots
	shot_alpha = 0;
	shot_pulse_elem = 1.5;
	shot_pulse_mix = 1.5;

	chem_alpha = 0;
	chem_grow = 1;
	
	therm_stretch = 0;





}
