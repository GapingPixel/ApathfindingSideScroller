// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_IK_system_create(ArmLength,Pinned,Inverse_Value){

// Arm properties
arm_length = ArmLength;//Max length of arm
arm_pinned = Pinned;//Determines if IK is pinned to target or not

// Segment properties
seg_amount = 2;
seg_length = arm_length/seg_amount;

seg_x = [];
seg_y = [];

IK_value = sign(Inverse_Value)//Determines to make IK positive or negative

for(var i = 0; i < seg_amount; i++) {
	seg_x[i] = x + i*seg_length;
	seg_y[i] = y;
}
}