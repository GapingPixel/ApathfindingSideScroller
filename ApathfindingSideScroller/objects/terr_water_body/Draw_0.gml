var watercol1, watercol2, wateralpha

//Draw liquid color according to PH value
if env_ph_value <= 0
{
watercol1 = make_color_rgb(env_ph_value,255-(env_ph_value*10),255);
watercol2 = make_color_rgb(env_ph_value*20,env_ph_value*5,255 - (env_ph_value*15));
wateralpha =  (env_ph_value*-0.01)
}
else
{
wateralpha = 0;
watercol1 = c_aqua
watercol2 = c_blue;
}

liquid_draw(watercol1,watercol2,
0.25 + wateralpha,
0.45 + wateralpha,
false);
