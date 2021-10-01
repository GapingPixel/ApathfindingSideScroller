/// @description Initiate gravity
gravity = 0.6;

// Stop Rumbling if gamepad connected
if gamepad_is_connected(DeadPlayerHeads_var_pCon)
    {
        gamepad_set_vibration(DeadPlayerHeads_var_pCon,0,0);
    }
