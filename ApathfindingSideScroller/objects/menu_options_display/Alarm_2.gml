/// @description Selection switch case

switch(menu_pos)
{
default://Display Option selected
break;

case 5:
    instance_create_layer(x,y,"Menu",menu_options);
    instance_destroy();
break;

}


