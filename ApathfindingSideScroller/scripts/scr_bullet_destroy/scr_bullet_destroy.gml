function scr_bullet_destroy() {
	//Destroys bullet when outside view
	//Put in "end step event" for bullets

	var offset = 64*3;
	var sprW, sprH;
	sprW = sprite_get_width(sprite_index);
	sprH = sprite_get_height(sprite_index);

	//Room view
	var rx1 = -offset;
	var rx2 = -offset;
	var ry1 = room_width + offset;
	var ry2 = room_height + offset;


	//Camera view
	var vx1 = global.cam_x - offset - sprW//Left of view
	var vy1 = global.cam_y - offset - sprH//Top of view
	var vx2 = global.cam_x + global.cam_width + offset + sprW//Right of view
	var vy2 = global.cam_y + global.cam_height + offset + sprH//Bottom of view


	if ((x<rx1) or (x<vx1))
	or ((x>rx2) and (x>vx2))
	or ((y<ry1) and (y<vy1))
	or ((y>ry2) and (y>vy2))
	    instance_destroy();



}
