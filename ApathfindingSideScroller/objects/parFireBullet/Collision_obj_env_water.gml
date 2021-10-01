/// @description Reduce damage when underwater
if !ini || bullet_dmg < (bullet_dmg/2)
bullet_dmg /= 2;
bullet_wet = true;
image_blend = c_black;

