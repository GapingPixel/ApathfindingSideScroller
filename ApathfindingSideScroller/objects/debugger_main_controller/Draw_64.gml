//show_debug_overlay(true);
if debugger_on == true
{
draw_set_alpha(0.5);
draw_rectangle_colour(0,160,240,640,
c_black,c_black,c_black,c_black,0);


draw_set_font(fnt_debug);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_alpha(1);

draw_text(0,160,"Game Debugger Menu");
draw_text(160,160,"- = Restart Room");
draw_text(160,120,"* = Disable Debug Overlay");
draw_text(0,0+160+16,"1 - Game Variables");
draw_text(0,0+160+32,"2 - Player Values Data");
draw_text(0,0+160+48,"3 - Player Input Data");
draw_text(0,0+160+80,"5 - Frame Skip Data");
draw_text(160,0+160+16,"6 - Change Rooms");
draw_text(160,0+160+48,"8 - Spawn Object");
}

