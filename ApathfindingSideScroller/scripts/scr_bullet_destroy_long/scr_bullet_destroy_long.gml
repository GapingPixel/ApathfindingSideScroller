function scr_bullet_destroy_long() {
	//Destroys bullet when outside view (Longer Range)
	//Put in "end step event" for bullets

	//Destroys bullet when outside view
	//Put in "end step event" for bullets

	var offset = 128;
	var sprW, sprH;
	sprW = sprite_get_width(sprite_index);
	sprH = sprite_get_height(sprite_index);

	//Room view
	rx1 = -offset;
	rx2 = -offset;
	ry1 = room_width + offset;
	ry2 = room_height + offset;


	//Camera view
	vx1 = global.cam_x - offset*3 - sprW//Left of view
	vy1 = global.cam_y - offset*3 - sprH//Top of view
	vx2 = global.cam_x + global.cam_width + offset*3 + sprW//Right of view
	vy2 = global.cam_y + global.cam_height + offset*3 + sprH//Bottom of view


	if ((x<rx1) or (x<vx1))
	or ((x>rx2) and (x>vx2))
	or ((y<ry1) and (y<vy1))
	or ((y>ry2) and (y>vy2))
	    instance_destroy();



}
