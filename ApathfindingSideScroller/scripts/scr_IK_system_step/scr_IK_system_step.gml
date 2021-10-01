// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_IK_system_step(target){
//Need to create system in Create Event first!!!

if instance_exists(target)
{
	///Target Values
	var target_x = target.x;
	var target_y = target.y;

	seg_x[seg_amount] = target_x;
	seg_y[seg_amount] = target_y;

	for (var i = seg_amount-1; i >= 0; i--) {
	
		var dir = point_direction(seg_x[i],seg_y[i],seg_x[i+1],seg_y[i+1]);
	
		var ldx = lengthdir_x(seg_length, dir);
		var ldy = lengthdir_y(seg_length, dir);
	
		seg_x[i] = seg_x[i+1] - ldx;
		seg_y[i] = seg_y[i+1] - ldy;
	} 




	if (arm_pinned) {
	
		seg_x[0] = x;
		seg_y[0] = y;
	
		for (var i = 1; i <= seg_amount; i++) {
			var dir = point_direction(seg_x[i-1], seg_y[i-1], seg_x[i], seg_y[i]);
		
			var ldx = IK_value * lengthdir_x(seg_length, dir);
			var ldy = lengthdir_y(seg_length, dir);
		
			seg_x[i] = seg_x[i-1] + ldx;
			seg_y[i] = seg_y[i-1] + ldy;
		}
	}
}

}