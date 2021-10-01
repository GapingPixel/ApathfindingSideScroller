/// @description Fire Super

switch(char_id)
{
case 0:
if var_super = 0
plyr_shoot_chem_source(chem_source_p1);
else
plyr_megaSuper_fire(char_id);
break;

case 1:
if var_super = 0
plyr_shoot_chem_source(chem_source_p2);
else
plyr_megaSuper_fire(char_id);
break;
}
