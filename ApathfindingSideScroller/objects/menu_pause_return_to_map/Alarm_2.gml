/// @description Selection switch case

switch(menu_pos)
{
case 0://Yes
    //room_goto(room_overworld_alpha);
	/*
	We need switch case depending on overworld map
	*/
break;

case 1://No
    instance_create_layer(x,y,"Menu",menu_pause);
    instance_destroy();
break;
}



