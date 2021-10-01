function plyr_chemball_draw() {

	//Glow color constants
	//scale
	var sc1 = 1.1;
	var sc2 = 1.2;
	var sc3 = 1.3;
	//opacity
	var op1 = 0.1;
	var op2 = 0.2;
	var op3 = 0.3;


	gpu_set_fog(true, chemball_col2, 50, 1000);
	draw_sprite_ext(spr_chemball_2,image_index,x,y,image_xscale*sc3,image_yscale*sc3,image_angle,chemball_col2,chemball_alph2-op3);
	draw_sprite_ext(spr_chemball_2,image_index,x,y,image_xscale*sc2,image_yscale*sc2,image_angle,chemball_col2,chemball_alph2-op2);
	draw_sprite_ext(spr_chemball_2,image_index,x,y,image_xscale*sc1,image_yscale*sc1,image_angle,chemball_col2,chemball_alph2-op1);
	gpu_set_fog(0, 0, 0, 0);

	draw_sprite_ext(spr_chemball_2,image_index,x,y,image_xscale,image_yscale,image_angle,chemball_col2,chemball_alph2);


	gpu_set_fog(true, chemball_col1, 50, 1000);
	draw_sprite_ext(spr_chemball_1,image_index,x,y,image_xscale*sc3,image_yscale*sc3,image_angle,chemball_col1,chemball_alph1-op3);
	draw_sprite_ext(spr_chemball_1,image_index,x,y,image_xscale*sc2,image_yscale*sc2,image_angle,chemball_col1,chemball_alph1-op2);
	draw_sprite_ext(spr_chemball_1,image_index,x,y,image_xscale*sc1,image_yscale*sc1,image_angle,chemball_col1,chemball_alph1-op1);
	gpu_set_fog(0, 0, 0, 0);
	draw_sprite_ext(spr_chemball_1,image_index,x,y,image_xscale,image_yscale,image_angle,chemball_col1,chemball_alph1);


}
