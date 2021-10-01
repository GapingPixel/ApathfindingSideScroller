if !ini
{
ini = true;
enemy_var_slimemold_droplet_grav = 0
enemy_var_slimemold_droplet_decay = 10
}
enemy_var_slimemold_droplet_decay -= 1;

image_angle = direction;

if enemy_var_slimemold_droplet_decay < 0
{
	gravity = 0.5;
}

var onGround = place_meeting(x, y + 1, parSolid) || place_meeting(x, y + 1, parJumpThru);

if onGround || enemy_hp <= 0
{
    instance_destroy();
}


