/// @description Spawn firing Arcs

if (fire_arc_spawn_count < fire_arc_max_spawn) {   
	
	var ball;
	
	if fire_arc_spawn_count = (fire_arc_max_spawn - 2)
	ball = enemy_bullet_fire_arc_ball
	else
	ball = terr_fire_arc_ball
	
    var child = instance_create_layer(x, y, layer, ball);
    with (child) {
        fire_arc_angle = other.fire_arc_angle
        fire_arc_distance = other.fire_arc_distance;
        fire_arc_orbit_x = other.fire_arc_orbit_x;
        fire_arc_orbit_y = other.fire_arc_orbit_y;
        fire_arc_orbit_speed = other.fire_arc_orbit_speed;
    }
    fire_arc_spawn_count += 1;
    alarm[0] = 10;
} else {
    fire_arc_spawn_count = 0;
}
