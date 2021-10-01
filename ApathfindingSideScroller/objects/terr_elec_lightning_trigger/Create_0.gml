/// @description Create values

lightning_spot_min_range = 900;
lightning_spot_trap_id = noone;

if (instance_exists(terr_elec_lightning_shooter)) {
    var nearest = instance_nearest(x, y, terr_elec_lightning_shooter);
    if (distance_to_object(nearest) < lightning_spot_min_range) {
        lightning_spot_trap_id = nearest.id;
    }
}