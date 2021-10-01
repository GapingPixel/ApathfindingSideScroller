/// @description Selection switch case

switch(menu_pos)
{
case 0:
    //Volume
break;

case 1:
    //SFX
break;


case 2:
	instance_create_layer(x,y,"Menu",menu_options);
	instance_destroy();
break;

}
//Kill Music
if audio_is_playing(msc_test)
    audio_stop_sound(msc_test);


