/// @description 


#region//Behavior
if playerAngel_var_hold_delay <= 0
{
if !playerAngel_var_revive
y -= 1 + global.raw_death_count

if y < global.cam_y - 128
	instance_destroy();
}
else
{
	playerAngel_var_hold_delay--;
	
	if (playerAngel_var_hold_delay = 0)
	for(var i = 0; i < 12; i++)//Halo Pieces
	{
	part_type_direction(part_var_playerAngel_smoke_poof,i*30,0,0,0)
	part_particles_create(global.parsys,x,y,part_var_playerAngel_smoke_poof,1);
	}
}

if global.game_state = GameState.dead
{
	instance_destroy();
}
#endregion

#region//Effects
switch(playerAngel_var_revive)
{
	case false://Fading Effect
	
	if (playerAngel_var_glow_fade)//Fade out glow
	{
	playerAngel_var_glow_alpha -= 0.0175;

	if playerAngel_var_glow_alpha <= 0.1
		playerAngel_var_glow_fade = false
	}
	else//Fade in glow
	{
	playerAngel_var_glow_alpha += 0.0175;

	if playerAngel_var_glow_alpha >= 1
		playerAngel_var_glow_fade = true;	
	}
	
	//Particles
	if playerAngel_var_hold_delay <= 0
	part_particles_create(global.parsys_below,x,y,part_var_playerAngel_sparkles,1);//Sparkles Trail Going up
	else
	part_particles_create(global.parsys_below,x,y,part_var_playerAngel_smoke,5);//Smoke Position
	
	break;
	
	case true://Don't fade when we are reviving
		playerAngel_var_glow_alpha = 1;
		
		if image_index > 18
			part_particles_create(global.parsys,x,y,part_var_playerAngel_smoke,5);//Smoke Position
			
	break;
}
#endregion