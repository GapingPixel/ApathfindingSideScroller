/// @description - - INITIALIZE THE CAMERA

// ==============================================================
// ------------------------------------	CAMERA MAIN PARAMETERS	-------------------------------
// ==============================================================
#region Set all the camera main parameters

window_set_fullscreen(global.settings_fullscreen);
view_height = 540; // Height of the portion of the room we will be seeing
view_width = 960; // Width of the portion of room we will be seeing

aspect_ratio = view_width/view_height; // Relation between the windows size and screen size
port_height = global.settings_res_H; // Height of the window where the game will be drawn
port_width = port_height*aspect_ratio; // Width of the window where the game will be drawn

//display_set_gui_size(port_width, port_height); //  < ------------------------ THIS LINE IS TOTALLY OPTIONAL

primitive_view_x = x-view_width/2; // Calculate the x position of the view relative to the camera object position
primitive_view_y = y-view_height/2; // Calculate the y position of the view relative to the camera object position

// Here we apply the size of the window and the surface where we will be drawing the game.
window_set_size(port_width, port_height);
surface_resize(application_surface, port_width, port_height);
//uc_window_center();

// Here we are saying all the values we are setting in this code
// are thought for a 60FPS running game, other frequencies will
// be adapted with time factor using delta time.
time_factor = delta_time * BASE_FPS / 1000000;

#endregion

// ==============================================================
// -------------------------------------	CAMERA STATE MACHINE	----------------------------------
// ==============================================================
#region Initialize the camera state machine

// Here we define the different modes the camera can take.
// Every different camera mode is stored in this enum.
enum CMODE {
	STATIC,
	OBJECT_FOLLOWING_H,//Lock Camera for Horizontal movement
	OBJECT_FOLLOWING_V,//Lock Camera for Vertical movement
	OBJECT_FOLLOWING_BOX,//Lock Camera within a box for dyanmic following
	OBJECT_FOLLOWING,
	OBJECT_BORDERS,
	MOUSE_BORDERS,
	MOUSE_SHOOTER,
	MOUSE_DRAG,
	CMODE_SIZE
}

// This string list is made to have the name of the mode in text.
cam_mode_string_list = ["STATIC", "OBJECT_FOLLOWING_HORI", "OBJECT_FOLLOWING_VERT", "OBJECT_BORDERS",
							"MOUSE_BORDERS", "MOUSE_SHOOTER", "MOUSE_DRAG"];

// This is the mode the camera will start with.
uc_set_mode(CMODE.OBJECT_FOLLOWING_H);


#endregion

// ==============================================================
// -----------------------------------------	CAMERA MODES	-----------------------------------------
// ==============================================================
#region Set all the camera modes variables

// General variables
uc_set_target_x(x);
uc_set_target_y(y);

// ---------------------------------------- Static Variables ---------------------------------------
uc_init_static(0.1);

// ----------------------------------- Object Following Variables --------------------------------------
//instance_create_depth(x,y,0,obj_camera_controller)
cam_following_list = ds_list_create();

{
	ds_list_add(cam_following_list, obj_plyr1);//P1
	ds_list_add(cam_following_list, obj_plyr2);//P2
}

uc_init_object_following(0.15);


//Id value to keep camera within a set box for camera shifting
cam_box_id = 0;

#region Camera Walling

cam_walling_L = instance_create_depth(global.cam_x, global.cam_y + global.cam_height,0,solid_inv_wall);
	
with(cam_walling_L)
	image_yscale *= 20;

cam_walling_R = instance_create_depth(global.cam_x + global.cam_width, global.cam_y + global.cam_height,0,solid_inv_wall)
	
with(cam_walling_R)
	image_yscale *= 20;
#endregion

// ----------------------------------- Object Border Variables --------------------------------------------
uc_init_object_borders(100, 75, 0.1);

// ----------------------------------- Mouse Border Variables ----------------------------------
/*cam_mouse_borders_movdir = 0;
cam_mouse_borders_hspd = 0;
cam_mouse_borders_vspd = 0;

uc_init_mouse_borders( 10, 10, 0.1);*/

// ----------------------------------- Shooter Variables --------------------------------------------
//uc_init_mouse_shooter(1/3, 0.1);

// ----------------------------------- Drag Variables --------------------------------------------
/*cam_mouse_drag_xdis = 0;
cam_mouse_drag_ydis = 0;
cam_mouse_drag_x = 0;
cam_mouse_drag_y = 0;
cam_mouse_drag_hspd = 0;
cam_mouse_drag_vspd = 0;

saved_mx = 0;
saved_my = 0;
saved_cx = 0;
saved_cy = 0;

uc_init_mouse_drag(0.1);
uc_set_mouse_drag_button(mb_middle);*/

#endregion

// ==============================================================
// -----------------------------------------	CAMERA EFFECTS	-----------------------------------------
// ==============================================================
#region Set all the camera effects variables

//  -------------------------------------- Scaling Variables --------------------------------------
// The scale will be a factor which we will be multipliying the view_width and
// view height with. The scale limits are set in order to not crash the game.
// I highly recommend keeping the maximum limit in a reasonable size.
view_scale_min_limit = 0.1;
view_scale_max_limit = 10;

view_scale = 1;
view_scale_target = view_scale;
view_scale_acceleration = 0.1;

//  ------------------------------------ Auto Scaling Variables ------------------------------------
// The auto scaling is in charge of automatically scalling the viewby the average
// distance between all the instances in the following list and the center point.
avg_dis_to_center = 0;

view_auto_scale = 1;
view_auto_scale_enabled = false;
view_auto_scale_factor = 0.004;

view_total_scale = view_scale*view_auto_scale;

//  ------------------------------------ Inclination Variables ------------------------------------
// The inclination of the camera is the camera angle. I called this variable as
// view_inclination because view_angle is already a built in variable.

view_inclination = 0;
view_inclination_target = view_inclination;
view_inclination_acceleration = 0.1;

//  ------------------------------------ Shaking Variables ------------------------------------
// The shaking will set the camera position at a shake_intensity distance within a
// random angle. The shake amplitude will approach to 0  every step by shake_acceleration.
// You can set the shake speed at 0 and the shake will persist on time.
shake_current = 0;
bounce_current = 0;
wiggle_current = 0;

shake_enable = false;//General Shake
shake_intensity = 5;
bounce_enable = false;//Vertical Shake
bounce_intensity = 5;
wiggle_enable = false;//Horizontal Shake
wiggle_intensity = 5;

shake_acceleration = 0.1;

//  ------------------------------------- Hit Variables ---------------------------------------
// The hit effect is like the jump in a platformer but it can be displayed in any direction.
// Once the hit is triggered it will make a knockback effect that can be cool to enfasize
// an attack like people do in some turn-based games.
hit_length = 0;

hit_intensity = 0;
hit_direction = 0;
hit_recovery = 0.2;

// ----------------------------------------- Bars variables -----------------------------------------
// The bars are just two rectangles filled with the desired color drawn in the GUI.
// The bars will appear or not deppending of the bars_enabled variable. The speed
// of the bars hidding or showing is defined by bars_acceleration and the amount of screen
// taken by the bars is defined by bars_percentage.
bars_position = 0;

bars_enabled = false;
bars_percentage = 0.35;
bars_acceleration = 0.3;
bars_color = c_black;

// -------------------------------------------- Flash variables ----------------------------------------
// The flash is a rectangle drawn in the GUI in the desired color. The speed of 
// the flash is separated by two different parameters, one for introduction and
// one for dissappearing.
flash_alpha= 0;
flash_threshold = 0.01;

flash_enable = false;
flash_color = c_white;
flash_in_speed = 0.8;
flash_out_speed = 0.1;
flash_max_alpha = 1;

#endregion

// ==============================================================
// ---------------------------------------------	MISCELLANY	--------------------------------------------
// ==============================================================
#region Debugging and drawing variables

// Debbuging variables
uc_set_debug_mode(false);
error_list = [];

// Drawing Variables
image_alpha = 0; // Make sure to not show the sprite of the Camera

#endregion

rx = 0;
ry = 0;