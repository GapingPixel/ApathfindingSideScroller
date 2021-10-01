scr_bullet_destroy();
if !ini
{
motion_set(image_angle, 8);
ini = true;
}

if image_yscale > 1
image_yscale -= 0.5

 if place_meeting(x+lengthdir_x((sprite_width/2),image_angle),y+lengthdir_y((sprite_width/2),image_angle), parSolid)
 {
        
        if enemyBullet_var_stick = 0
		{
        alarm[0] = 120;
		image_index = 1;
		image_yscale = 2;
		scr_play_sound(snd_common_metal_tink,10,0.5,0.6);
		}
        
        enemyBullet_var_stick = 1;
 }
 else
 {
        if enemyBullet_var_stick = 1
			instance_destroy();
 }
 
        
 if enemyBullet_var_stick = 1
 {
    motion_set(image_angle,0);
    //part_particles_create(global.parsys_below,x,y,na_impact,50);
 }
    
 

