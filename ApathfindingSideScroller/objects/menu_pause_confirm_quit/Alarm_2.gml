/// @description Selection switch case

switch(menu_pos)
{
case 0://Yes
    game_end();
break;

case 1://No
    instance_create_layer(x,y,"Menu",menu_pause);
    instance_destroy();
break;
}



