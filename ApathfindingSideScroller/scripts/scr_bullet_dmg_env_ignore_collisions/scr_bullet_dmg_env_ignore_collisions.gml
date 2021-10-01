/// @description Scipt Specifically made for bullets to ignore being destroyed by solids and platforms
function scr_bullet_dmg_env_ignore_collisions(dmgType) {
	scr_bullet_dmg_env(bullet_dmg,dmgType,false);
	scr_bullet_dmg_env_solids(bullet_dmg,dmgType,false);
	scr_bullet_dmg_env_platforms(bullet_dmg,dmgType,false);



}
