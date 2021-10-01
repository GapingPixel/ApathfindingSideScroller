/// @description Particles and Damage
uc_shake(15);

if image_xscale < 3
{
image_xscale += 0.1;
image_yscale += 0.1;
}

//Destroy instance when done
if image_alpha > 0
    image_alpha -= 0.05;
else
    instance_destroy();


