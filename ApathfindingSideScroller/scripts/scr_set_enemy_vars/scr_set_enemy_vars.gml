///@description scr_set_enemy_vars(HP, elem_def, fire_def, ice_def, salt_def, cor_def, freezeable, shockable, combustable)
///@param HP
///@param ElemDef
///@param FireDef
///@param IceDef
///@param SaltDef
///@param CorDef
///@param FreezeBool
///@param ShockBool
///@param CombustBool
function scr_set_enemy_vars(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	//Set HP Defenses, and Booleans for Enemies
	//Health
	enemy_hp = argument0;
	enemy_hpMax = enemy_hp;
	enemy_goodies = 0;//What does the enemy drop on death; 0 = nothing
	enemy_goodies_quantity = 1;//Quantity of how many goods the baddy drops on death
	
	//Determines enemy poise to hitstun from non hitstunning bullets based on hp
	enemy_poise = 0;
	if enemy_hp < 2.5
		enemy_poise = 0;
	else
		enemy_poise = 1;
	
	//Defense variables
	/*
	Higher the number, the weaker they are to type
	*/
	enemy_def_elem = argument1; //For elements to take extra damage from extrators
	enemy_def_flam = argument2; //Flame resist
	enemy_def_cyro = argument3; //Cyro resist
	enemy_def_salt = argument4; //Salt resist
	enemy_def_corr = argument5; //Corrosion resist
	enemy_def_reg = 1; //Regular Resistence/Metal, for obstacles to null damage from unrespected chem
	enemy_def_mult = 1; //Multiplier for enemy defenses when shielding or blocking



	//Booleans
	enemy_freezable = argument6;//Can be frozen
	enemy_shockable = argument7;//Can be shocked
	enemy_combustable = argument8;//Can be combusted


	enemy_state = enemyState.NORMAL;


	enemy_temp = 0;//Temperature;
	enemy_temp_hot = 100;//When enemy reaches heat limit;
	enemy_temp_cold = -100;//When enemy reaches chill limit;

	//Temp values to store animation and speed when enemy is under hitstun or frozen
	enemy_current_image_speed = image_speed;//image_speed
	enemy_current_animation = "";//string
	enemy_current_vx = 0;
	enemy_current_vy = 0;

	//Hit Flash
	enemy_hit_flash = false

	//For playing sounds for spawning enemies upon initiation
	//enemy_soundplay = false;

	//Origin point of hurt box for sticking bullets
	hurt_x = x;
	hurt_y = y;






}
