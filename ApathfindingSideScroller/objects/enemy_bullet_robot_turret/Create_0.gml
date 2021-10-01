/// @description Call paritcles and set motion
event_inherited();
atom = atom_f;
dmg = 3;
spd = 10;

switch(atom)
{
case atom_f :image_blend = c_red; break;
default: image_blend = c_white; break;
}


motion_set(image_angle,spd);


