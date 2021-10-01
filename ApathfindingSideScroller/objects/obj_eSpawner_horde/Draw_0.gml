/// @description Debug, Draw lines

if global.debugger_enable_detect_show == true
{
	draw_set_font(fnt_debug);
	draw_set_color(c_white);
	switch(edge_spawn_type)
	{
		case enemyEdgeSpawner_horizontal:
			draw_line_color(x,y-540,x,y+540,c_red,c_red)
			draw_text(x,y,string_hash_to_newline("Edge#Hori#Spawner"));
		break;
	
		case enemyEdgeSpawner_vertical:
			if edge_spawn_vertical_trigger == true
				draw_line_color(x-540,y,x+540,y,c_red,c_red)
			else
				draw_line_color(x,y-540,x,y+540,c_red,c_red)
				
			draw_text(x,y,string_hash_to_newline("Edge#Vert#Spawner"));
			
		break;
	}
	
	if edge_spawn_enemy_object != 0
	draw_text(x,y-64,object_get_name(edge_spawn_enemy_object));
	
	draw_rectangle(edge_spawn_deactivation_point[0],
			edge_spawn_deactivation_point[2],
			edge_spawn_deactivation_point[1],
			edge_spawn_deactivation_point[3],
			true)
}