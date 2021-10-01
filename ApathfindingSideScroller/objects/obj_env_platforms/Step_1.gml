/// @description Maintain heat and Ph values when over limits

if env_heat_value > 10
    env_heat_value = 10
if env_heat_value < -10
    env_heat_value = -10

    
if env_ph_value > 10
    env_ph_value = 10
if env_ph_value < -10
    env_ph_value = -10

