
if alarm_get(0) > 0
{
if env_dur > 0.1
draw_sprite_shake(1)
else
draw_sprite_shake(5)
}
else
draw_self();

scr_env_material_drawElectrify();