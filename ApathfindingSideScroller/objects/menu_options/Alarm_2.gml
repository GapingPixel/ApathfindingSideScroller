/// @description Selection switch case

switch(menu_pos)
{
case 0://Audio
    instance_create_layer(x,y,"Menu",menu_options_volume);
    instance_destroy();
break;

case 1://Visual
    instance_create_layer(x,y,"Menu",menu_options_display);
    instance_destroy();
break;

case 2://Language
    instance_create_layer(x,y,"Menu",menu_options_language);
    instance_destroy();
break;

case 3://Controls
	instance_create_layer(x,y,"Menu",menu_options_controls);
    instance_destroy();
break;

case 4://Back
	
	switch(room)
	{
	default:
	instance_create_layer(x,y,"Menu",menu_pause);
	break;
	
	case room_file_select:
	instance_create_layer(x,y,"Menu",menu_main);
	break;
	}
    instance_destroy();
break;

}



