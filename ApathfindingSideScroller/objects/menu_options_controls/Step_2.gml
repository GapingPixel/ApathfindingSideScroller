/// @description Mouse input moved to draw GUI
/*var mds = 10
var camX = global.cam_x;
var camY = global.cam_y;

var button_done = point_in_rectangle(mouse_x,mouse_y,
camX + 160 - mds, 
camY + 40 - mds,
camX + 160 + mds, 
camY + 40 + mds);

if button_done
{
	menu_pos[0] = 0; menu_pos[1] = 0;	
}

var button_plyr = point_in_rectangle(mouse_x,mouse_y,
camX + 160 - mds, 
camY + 80 - mds,
camX + 160 + mds, 
camY + 80 + mds);

if button_plyr
{
	menu_pos[0] = 1; menu_pos[1] = 0;	
}

var button_vib = point_in_rectangle(mouse_x,mouse_y,
camX + 512 - mds, 
camY + 80 - mds,
camX + 512 + mds, 
camY + 80 + mds);

if button_vib
{
	menu_pos[0] = 1; menu_pos[1] = 1;	
}

var button_res = point_in_rectangle(mouse_x, mouse_y,
camX + 992 - mds, 
camY + 80 - mds,
camX + 992 + mds, 
camY + 80 + mds);

if button_res
{
	menu_pos[0] = 1; menu_pos[1] = 2;	
}

/*for(var a = 0; a < 2; a++) 
for(var b = 0; b <= 12; b++)
{
	var button_binds = point_in_rectangle(mouse_x,mouse_y,
	camX + (512+(a*480)) - mds*1.5, 
	camY + (176+(b*40)) - mds,
	camX + (512+(a*480)) + mds*1.5, 
	camY + (176+(b*40)) + mds);
	
	
	if button_binds and b > 1
	{
		menu_pos[b] = b+2; menu_pos[a] = a;	
	}
}