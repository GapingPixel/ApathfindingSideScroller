/// @description Set up

hazard_triggered = false;
hazard_shot_ready = true;
hazard_shot_delay = 60;
hazard_shot_min_range = 300;
hazard_shot_trap_id = noone;

if (instance_exists(terr_elec_lightning_trigger)) {
    var nearest = instance_nearest(x, y, terr_elec_lightning_trigger);
    if (distance_to_object(nearest) < hazard_shot_min_range) {
        hazard_shot_trap_id = nearest.id;
    }
}