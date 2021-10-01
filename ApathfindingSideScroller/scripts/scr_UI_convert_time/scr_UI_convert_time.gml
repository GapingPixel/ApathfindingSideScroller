/// @description Script converts called time to seconds
function scr_UI_convert_time(argument0) {
	var time_max = argument0
	var time_Mins = 0;
	var time_Secs = 0;
	//Formulate time
	for(var i = 0; i < time_max; i+=1)
	{
	    if (time_Secs < 59)//Seconds
	    {time_Secs += 1;}
	    else//Add a Minute
	    {
	    time_Secs -= 59;
	    time_Mins += 1;
	    }
	}
	//show_debug_message("Secs = " + string(time_Secs));
	//show_debug_message("Mins = " + string(time_Mins));


	return time_Mins + ":" + string_replace_all(time_Secs," ","0");
}
