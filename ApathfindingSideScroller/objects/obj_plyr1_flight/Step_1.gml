///Camera Shake when hit
if (var_hit = 1)
{
        uc_shake(5)
}

///For shot switching visual cue
shot_alpha -= 0.01;
if shot_alpha < 0
    shot_alpha = 0;
    
chem_alpha -= 0.01;
if chem_alpha < 0
    chem_alpha = 0;
    
chem_grow += 0.05
if chem_grow > 1
    chem_grow = 1;
    
shot_pulse_elem -= 0.1
shot_pulse_mix -= 0.1

if shot_pulse_elem < 1
    shot_pulse_elem = 1

if shot_pulse_mix < 1
    shot_pulse_mix = 1


//Squash and Stretch
if stretch_x < 1
    stretch_x += 0.05;
    
if stretch_x > 1
    stretch_x -= 0.05;
    
if stretch_y < 1
    stretch_y += 0.05;
    
if stretch_y > 1
    stretch_y -= 0.05;         


///Temperature Environment
plyr_temp_change();

CastShadow();