/// @description Creating Chemical Ball
switch(char_id)
{
	case 0:
	instance_create_depth(x,y,depth+1,chemball_p1);
	break;

	case 1:
	instance_create_depth(x,y,depth+1,chemball_p2);
	break;
}
