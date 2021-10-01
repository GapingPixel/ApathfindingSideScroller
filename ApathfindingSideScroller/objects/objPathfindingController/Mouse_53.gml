

with(enemy_elem_bat) {
	target_x = get_snapped(mouse_x, CELL_SIZE) + CELL_SIZE / 2;
	target_y = get_snapped(mouse_y, CELL_SIZE) + CELL_SIZE / 2;
	target = instance_position(target_x, target_y, CLICKABLE_CELL);
	event_user(0); 
}
