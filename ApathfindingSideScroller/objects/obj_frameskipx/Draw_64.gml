/// @description OPTIONAL - Draw Stats Onscreen

if(ONSCREEN_Stats){
draw_set_font(fnt_debug);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_set_colour(c_white); //SET Onscreen Text Color to WHITE
var STATUS = "FPS Real: " + string(fps_real) + "#Array Average: " + string(FPS) + " / " + string(room_speed);
STATUS += "#Array Index: " + string(FSKIP_Index) + "#"+"Skip Every: "; var S1="DISABLED (user setting) #";
if(SKIPEvery<0 && SKIP_Frames){S1="No Skip" + "#"} else {if(SKIP_Frames){S1=string(SKIPEvery) + "#"}}; 
STATUS += S1+"FrameSkipX v1.04 - BlackOpzFX.com"; draw_text(800,160,string_hash_to_newline(STATUS));}


