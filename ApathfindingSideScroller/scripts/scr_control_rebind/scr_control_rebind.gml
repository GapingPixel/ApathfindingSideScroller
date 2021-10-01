
function scr_control_rebind(){

for(var i = 0; i < 15; i++)
{
if gamepad_button_check_pressed(i, gp_face1) return gp_face1;
if gamepad_button_check_pressed(i, gp_face2) return gp_face2;
if gamepad_button_check_pressed(i, gp_face3) return gp_face3;
if gamepad_button_check_pressed(i, gp_face4) return gp_face4;

if gamepad_button_check_pressed(i, gp_shoulderl) return gp_shoulderl;
if gamepad_button_check_pressed(i, gp_shoulderlb) return gp_shoulderlb;
if gamepad_button_check_pressed(i, gp_shoulderr) return gp_shoulderr;
if gamepad_button_check_pressed(i, gp_shoulderrb) return gp_shoulderrb;

if gamepad_button_check_pressed(i, gp_padl) return gp_padl;
if gamepad_button_check_pressed(i, gp_padr) return gp_padr;
if gamepad_button_check_pressed(i, gp_padu) return gp_padu;
if gamepad_button_check_pressed(i, gp_padd) return gp_padd;

if gamepad_button_check_pressed(i, gp_stickl) return gp_stickl;
if gamepad_button_check_pressed(i, gp_stickr) return gp_stickr;
}



//Null return if we don't receive anything
return -1;

}