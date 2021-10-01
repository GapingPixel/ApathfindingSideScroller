/// @description Damage from Fire
scr_env_damage(0.05,1,false);
scr_bullet_dmg_env(0.05,1,false);
scr_bullet_dmg_env_solids(0.05,1,false);
scr_bullet_dmg_env_platforms(0.05,1,false);

if env_dur <= 0
	instance_destroy();
