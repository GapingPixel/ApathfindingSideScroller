/// @description Animation Effects
CastShadow();
var anim = skeleton_animation_get();
var plyr = parPlyr;
var detect_plyr = collision_line(x,y,x,y-1000,plyr,false,true);

#region AI
image_xscale = facing;
switch(enemy_state)
{
	case enemyState.NORMAL:
		
		
		switch(enemy_behavior)
		{
			case enemy_PATROL:
			Gravity();
			vx = vxMax * facing;
			
			if onGround
			{
			var detect_edge = (!position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+8, parSolid)
				&& !position_meeting(x+(sprite_get_width(sprite_index)/2)*facing, y+(sprite_height/2)+4, parJumpThru))
				
			 if detect_edge || (place_meeting(x+facing,y,solid_block))
		        {
				  facing *= -1;
				  if anim != "1_turn"
					scr_skeleton_animation_setAnim("1_turn")
		        }
				
				if detect_plyr
				{
					if alarm_get(1) < 0
						alarm[1] = 1;
				}
			}
			
			break;
			
			case enemy_WAIT:
			case enemy_RISE:
			vx = 0;
			vy = 0;
			break;
			
			
			case enemy_JUMP:
			case enemy_FALL:
			Gravity();
			if onGround
			{
				if anim = "5_fall" and anim != "6_land"
				{
					scr_skeleton_animation_setAnim("6_land");
				}
			}
			break;
		}
	
	break;
	
	
	case enemyState.FROZEN:
	vx = 0
	vy = 0
	scr_enemy_freeze_check();
	break;
	
	case enemyState.HITSTUN:
	vx = 0;
	vy = 0;
	break;
	
}
#endregion

#region Animation End
if (image_index > image_number - 1)
{

switch(anim)
{
	case "6_land":
		scr_skeleton_animation_setAnim("0_move");
		enemy_behavior = enemy_PATROL;
	break;
	
	case "1_turn":
		scr_skeleton_animation_setAnim("0_move");
	break;
	
	case "2_jump":
		scr_skeleton_animation_setAnim("3_fly");
		enemy_behavior = enemy_JUMP;
		vy -= jumpHeight;
	break;
	
	case "3_fly":
		scr_skeleton_animation_setAnim("4_tip");
	break;
	
	case "4_tip":
		scr_skeleton_animation_setAnim("5_fall");
		enemy_behavior = enemy_FALL;
	break;
}

}
#endregion

#region Death
if enemy_hp <= 0
{
    //audio_sound_pitch(snd_boom,random_range(1.5,2));
    //audio_play_sound(snd_boom,0,0);
	particle_scr_eff_boom(0.5);
    //part_particles_create(global.parsys,x,y,part_var_enemy_slime_boom,30);
	instance_destroy();
}
#endregion

