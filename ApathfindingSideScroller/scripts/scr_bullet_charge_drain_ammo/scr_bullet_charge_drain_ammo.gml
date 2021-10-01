// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_bullet_charge_drain_ammo(cost,killwhenOut){


if bullet_controller != 0
{
	if instance_exists(bullet_controller)
	{
		with(bullet_controller)
		{
			var mix_id = global.player_active_mixture[char_id];
			var plyr_id = char_id;

				global.player_weapon_slot[char_id][mix_id][4] -= cost;
				if global.player_weapon_slot[char_id][mix_id][4] <= 0
				{
				plyr_flush_elements(char_id)
				}
			
		}
		
		if killwhenOut && global.player_weapon_slot[plyr_id][mix_id][2] = "null"
			instance_destroy();
	}
	else
		instance_destroy();
	
}


}