/// @description Lightning Trigger
if (hazard_triggered == true && hazard_shot_ready == true && alarm[0] == -1) 
{
	uc_flash();
	scr_play_sound(snd_common_electric_spark_3,0,0.8,1.2);
	alarm[0] = hazard_shot_delay;
}