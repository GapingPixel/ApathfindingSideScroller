
																																										
#macro CELL_SIZE 32
enum INSTANCE_FAMILY {
	 BLOCK = 0,
	 RESOURCE = 1
}

enum UNIT_STATE {
	IDLE = 0,
	MOVE = 1,
	GATHER = 3
}


#macro CLICKABLE_CELL objClickableCell 

/// @function pathfinding_engine(grid_width, grid_height);
/// @description Initializes pathfinding engine, you should call this one first.
/// @param {real} grid_w The width of pathfinding grid
/// @param {real}  grid_h  The height of pathfinding grid
function pathfinding_engine(grid_w, grid_h)		{
	
	//global.game_grid, global.movement_grid;

	global.game_grid = ds_grid_create(grid_w, grid_h);
	global.movement_grid = mp_grid_create(0,0,grid_w, grid_h, CELL_SIZE, CELL_SIZE);
	mp_grid_add_instances(global.movement_grid, CLICKABLE_CELL, 0);
	mp_grid_to_ds_grid(global.game_grid, global.movement_grid);
}
/// @function path_closest_free_cell(start_x, start_y, pos_x, pos_y);
/// @description Findinds a closest path to a desired value and checks for free cell
/// @param {real} start_x x value from which path starts
/// @param {real}  start_y y value from which path starts
/// @param {real}  pos_x x value at which path ends
/// @param {real}  pos_y y value at which path ends
function path_closest_free_cell(start_x, start_y, pos_x, pos_y)		{
	
	var counter = 1; //counters how many loops needs to be done to find a free cell
	var temp_cells = ds_list_create(); //Create a ds_list for temporary free cells
	var cell_pos_x = (pos_x div CELL_SIZE); // get the x position and divide it by size of the cell 
	var cell_pos_y = (pos_y div CELL_SIZE);// get the y position and divide it by size of the cell 
	
	if(global.game_grid[# cell_pos_x, cell_pos_y] == 0) { //if the value is actually free, there's no need to do the stuff bellow!
	
		var path = path_add();
		path_set_precision(path,4) 
		path_set_kind(path,2);
		
		if(mp_grid_path(global.movement_grid, path, start_x, start_y, cell_pos_x * CELL_SIZE + CELL_SIZE/2, cell_pos_y * CELL_SIZE+ CELL_SIZE/2 , 1)) { //If the path can actually be created
			return path;	//We return created path on grid
		}
	} else { //Otherwise we will loop trough the cells around, to check which path is the closest one
	
	for(var i=-counter; i<= counter; i++) { 
		for(var j=-counter; j <= counter; j++) { 
			var x_cell = cell_pos_x + i; 
			var y_cell = cell_pos_y + j; 
	
			if(i== 0 or j == 0) { 
					if(cell_on_grid(global.game_grid, x_cell, y_cell)) {
						var cell_val = global.game_grid[# x_cell, y_cell]; 
						if(cell_val == 0) { 
							var cell_map = cell_map_create(x_cell, y_cell); 
							ds_list_add(temp_cells, cell_map); 
							ds_list_mark_as_map(temp_cells, ds_list_size(temp_cells)-1);
							}
						}
					}
				}
			}
		}
	//Now loop through the list of cells and find the smallest one
	var shortest_length = 10000; //Large number, so the first one in the loop is set to be the lower
	var shortest_path = noone; //init shortest path variable and set it to -4
	for(var i=0; i < ds_list_size(temp_cells); i++) { //Loops through the list of free cells
			var cell_map = temp_cells[| i]; //gets a map id of the cell
			var goal_x = cell_map[? "x"] * CELL_SIZE + (CELL_SIZE/2); //sets goal x position
			var goal_y = cell_map[? "y"]* CELL_SIZE	+ (CELL_SIZE/2); //sets goal y position
			var path = path_add(); //add new path
			
			if(mp_grid_path(global.movement_grid, path, start_x, start_y, goal_x, goal_y, false)) { //If the path is runnable
				var path_points = path_get_number(path); //Count number of points
					if(path_points < shortest_length) { //If current points are smaller than the smallest ammount
						shortest_length = path_points; //set smallest points to current
						shortest_path = path; //set shortest path to path	
					}
				}
			}
		if(path_exists(shortest_path)) { 
			return path_duplicate(shortest_path);	
			} else {
				return noone;
		}
	if(ds_exists(temp_cells, ds_type_list)) {
		ds_list_destroy(temp_cells); //Clear out the temporary cells that we created
	}
}
/// @function cell_on_grid(grid_index, cell_h, cell_w);
/// @dscription Checks whether cell is on grid and is not larger than size of the room. Returns true or false whether the condition has been met.
/// @param {real} id of the grid to check 
/// @param {real}  horizontal cell on the grid
/// @param {real}  vertical cell on the grid

function cell_on_grid(grid_index, cell_h, cell_w) { //whether the grid is within room boundaries
	var gw = ds_grid_width(grid_index);
	var gh = ds_grid_height(grid_index);

	if(cell_h > 0 && cell_h < gw -1 && cell_w > 0 && cell_w < gh -1)	{
		return true;
	} else {
		return false;
	}	
}
/// @function cell_map_create(x_cell, y_cell);
/// @description Creates an empty cell ds_map value and returns it.
/// @param {real} x_cell
/// @param {real} y_cell

function cell_map_create(x_cell, y_cell) {
		var cell_dsmap = ds_map_create();
		cell_dsmap[? "x"] = x_cell;
		cell_dsmap[? "y"] = y_cell;
		return cell_dsmap;
}
/// @function instance_in_cell_range(x, y, other_ins, _range);
/// @description Checks whether instance is in cell range
/// @param {real} x x position to check
/// @param {real} y y position to check
/// @param {real} id  index of other instance
/// @param {real} range maximum distance in cells

function instance_in_cell_range(my_x, my_y, other_ins, _range) {
	var range = _range;
	if(other_ins != noone) {
	for(var i=-range; i<= range; i++) { //check a cell around for free space
		for(var j=-range; j <= range; j++) { 
			var x_cell = (my_x div CELL_SIZE) + i; 
			var y_cell = (my_y div CELL_SIZE) + j; 
	
			if(i== 0 or j == 0) { 
					if(cell_on_grid(global.movement_grid, x_cell, y_cell)) { //check if cell is on the grid
						if(point_in_rectangle(get_snapped(other_ins.x, CELL_SIZE),get_snapped(other_ins.y, CELL_SIZE), x_cell*CELL_SIZE, y_cell*CELL_SIZE, x_cell*CELL_SIZE+CELL_SIZE, y_cell*CELL_SIZE+CELL_SIZE)) { //and if instance is in rectangle
							show_debug_message("Found it, yes");
							return true;	
							}
						}
					}
				}
			}
	   return false;
	}
}
/// @function get_snapped(value, snap_size);
/// @param {real} value value to snap
/// @param {real} size size to snap the value with
function get_snapped(value, snap_size) { //Returns a value, but snapped by the size of the cell
	return (value div snap_size) * snap_size;
}