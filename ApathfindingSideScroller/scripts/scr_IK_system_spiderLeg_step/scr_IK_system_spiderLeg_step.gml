// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_IK_system_spiderLeg_step(legSpeed,legSound){

if instance_exists(spider_leg_parent)
{
seg_x[seg_amount] = spider_leg_parent.x;
seg_y[seg_amount] = spider_leg_parent.y;

for (var i = seg_amount-1; i >= 0; i--) {
	
	var dir = point_direction(seg_x[i],seg_y[i],seg_x[i+1],seg_y[i+1]);
	
	var ldx = lengthdir_x(seg_length, dir);
	var ldy = lengthdir_y(seg_length, dir);
	
	seg_x[i] = seg_x[i+1] - ldx;
	seg_y[i] = seg_y[i+1] - ldy;
} 

//Find a nearest black
var blck = instance_nearest(x,y,parCollision);

//Playing Sounds
var foundaBlock = collision_circle(seg_x[0],seg_y[0],seg_length,blck,false,true)

if foundaBlock
{
	if spider_leg_sound = true
	{
	if legSound != 0
		scr_play_sound(legSound,0,0.9,1.1)
		
	spider_leg_sound = false;
	}
}
else
{
	spider_leg_sound = true;
}

var ldx = lengthdir_x(seg_length, spider_leg_direction);
var ldy = lengthdir_y(seg_length, spider_leg_direction);
	
x = Approach(x,spider_leg_parent.x + ldx,16);
y = Approach(y,spider_leg_parent.y + ldy,16);



if (arm_pinned) {
	
	seg_x[0] = Approach(seg_x[0],blck.x,legSpeed);
	seg_y[0] = Approach(seg_y[0],blck.y,legSpeed);
	
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