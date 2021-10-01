var coyote_timer = !Grounded() 
&& (var_coyote_jump_frame < var_coyote_jump_frame_max) 
&& var_jumping = 0 && var_wallgrab = 0 && var_wallslide = 0
&& !place_meeting(x,y,parJumpThru)

#region Manage Coyote Timer
if !Grounded()
{
	if var_coyote_jump_frame < var_coyote_jump_frame_max
		var_coyote_jump_frame++;
}
else
{
	var_coyote_jump_frame = 0;
}
#endregion


onGround = Grounded() || (coyote_timer);

cLeft  = place_meeting(x - 1, y, solid_wj) || place_meeting(x - 1, y, obj_env_solids_wj); 
cRight = place_meeting(x + 1, y, solid_wj) || place_meeting(x + 1, y, obj_env_solids_wj);

///Meet with wall jump target
if (cLeft) 
    wallTarget = instance_place(x - 1, y, solid_wj);

if (cRight) 
    wallTarget = instance_place(x + 1, y, solid_wj);

#region Camera Shake when hit
if (var_hit = 1)
{
    uc_shake(3);
}
#endregion

#region For shot switching visual cue
shot_alpha -= 0.01;
if shot_alpha < 0
    shot_alpha = 0;
    
chem_alpha -= 0.01;
if chem_alpha < 0
    chem_alpha = 0;
    
chem_grow += 0.01
if chem_grow > 2
    chem_grow = 2;
    
shot_pulse_elem -= 0.1
shot_pulse_mix -= 0.1

if shot_pulse_elem < 1.5
    shot_pulse_elem = 1.5

if shot_pulse_mix < 1.5
    shot_pulse_mix = 1.5
#endregion

#region Squash and Stretch
if stretch_x < 1
    stretch_x += 0.05;
    
if stretch_x > 1
    stretch_x -= 0.05;
    
if stretch_y < 1
    stretch_y += 0.05;
    
if stretch_y > 1
    stretch_y -= 0.05;    
#endregion

#region Bubbles when underwater
if lqd != 0
{
	if var_bubble_timer <= 0
	{
		//var offset_x = image_xscale;
		var offset_y;
		
		if var_crouching = 0
		offset_y = -(sprite_height/4)
		else
		offset_y = 0;;
		
		instance_create_depth(x + 16*image_xscale,y + offset_y,depth-1,obj_effect_airBubble);
		
		var_bubble_timer = choose(30,60,90);
	}
		
	var_bubble_timer--;
}
#endregion


#region//I Frames management when breaking out of Ailments and Doing actions

var_i_frame_count -= 1;

if var_i_frame_count < 0
	var_i_frame_count = 0;
	
#endregion

///Temperature Environment
if var_inv = 0
	plyr_temp_change();

CastShadow();

liquid_contact();


