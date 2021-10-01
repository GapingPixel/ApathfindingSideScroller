/// @description Selection switch case

switch(menu_pos)
{

case 0://Retry
    plyr_initialize();
    room_restart();
break;


case 1://Return to Map
    if fps >= 55
	room_goto(global.game_map_room);
	else
	alarm[2] = 120;
break;


}



