/// @description scr_after_image()
/// @param length: max sprites in after image
/// @param spacing: steps between update
/// @param fade length: how quicly the after image fades out
/// @param colour: c_white for default
/// @param fog: boolean for having it be a gpu fog set or not
function scr_image_trail(length, spacing, fadeLength, color, setFog,scale) {
	//check to see if trail_x exists VARIABLE INSTANCE EXISTS ONLY WORKS WITH GMS2

	if !variable_instance_exists(id, "effect_var_imgTrail_trail_x")
	{
		//because we ignore teh 0 position if you enter the number 5 you will have 4 after images
		//whatever number you enter minus 1 from it and that will be the amount you will have as a draw sprite
		 effect_var_imgTrail_number_of_after_images = length
		 effect_var_imgTrail_spacing = spacing
		//take care with fade length if your length is slow and you have only 4 images the image that is 4th will not fade out before it is deleted
		//fade_length of 0.05 and number_of_after_images of 5 is a good setting
		 effect_var_imgTrail_fade_length = fadeLength
		 effect_var_imgTrail_color = color
		//trail_x keeps track of the x position for each position of the array
		//each position of a ds list is a after image
		 effect_var_imgTrail_trail_x = array_create(effect_var_imgTrail_number_of_after_images, undefined)
		//trail_y keeps track of the y position
		 effect_var_imgTrail_trail_y = array_create(effect_var_imgTrail_number_of_after_images, undefined)
		//alpha keeps track of t he alpha for each image
		//this will update independitly but will match the array length
		//this means that even if a after image is generated every 4 steps the alpha of each after image is updated every step
		 effect_var_imgTrail_alpha = array_create(effect_var_imgTrail_number_of_after_images, 0.5)
		//temp values for array copy later in code
		//we use these with array copy to shift the values down by 1 entry
		 effect_var_imgTrail_temp_x = array_create(effect_var_imgTrail_number_of_after_images, undefined)
		 effect_var_imgTrail_temp_y = array_create(effect_var_imgTrail_number_of_after_images, undefined)
		 effect_var_imgTrail_temp_alpha = array_create(effect_var_imgTrail_number_of_after_images, undefined)
	}
	
	if fadeLength == undefined
	{
		fadeLength = c_white
	}
	//draw the after image trail with for loop
	//Start i at 1 as the math for the after image length would equal 0 if we start i at 0
	//that means we are not drawing the first entry of the array as its alpha would be 0
	//1 through whatever the argument number is is all that is drawn
	for(var i=1; i<effect_var_imgTrail_number_of_after_images; i++)
	{
		//dont draw directly beneacth us if we are not moving
		//if effect_var_imgTrail_trail_x[i] != x || effect_var_imgTrail_trail_y[i] != y
		{
			//make sure the entry has a value
		    if effect_var_imgTrail_trail_x[i] != undefined
		    {
			    //draw sprite for each psoition in the array
				switch(setFog)
				{
					case true:
					gpu_set_fog(true, effect_var_imgTrail_color, 50, 1000);
					draw_sprite_ext(sprite_index, image_index-1, effect_var_imgTrail_trail_x[i], effect_var_imgTrail_trail_y[i], image_xscale * scale, image_yscale * scale, image_angle, effect_var_imgTrail_color, effect_var_imgTrail_alpha[i]);
					gpu_set_fog(0,0,0,0);
					break;
			
					case false:
					draw_sprite_ext(sprite_index, image_index-1, effect_var_imgTrail_trail_x[i], effect_var_imgTrail_trail_y[i], image_xscale * scale, image_yscale * scale, image_angle, effect_var_imgTrail_color, effect_var_imgTrail_alpha[i]);
					break;
				}
				//draw_sprite_shadow_ext(0,trail_x[i], trail_y[i], image_xscale, image_yscale, color, alpha[i])
		    }
		}
	}
	//Update alpha values every step for each array entry
	for (var i = 1; i<effect_var_imgTrail_number_of_after_images; i++)
	{
		//make sure the array entry contains a value
		if effect_var_imgTrail_alpha[i] != undefined
		{
	    effect_var_imgTrail_alpha[i] = effect_var_imgTrail_alpha[i] - effect_var_imgTrail_fade_length
		}
	}
	
	//This is our spacing
	//If spacing is == 0 then we update a new x and y position to the ds list and set spacing back to the value provided in the argument
	if effect_var_imgTrail_spacing <= 0
	{
		//add x and y to ds list
		effect_var_imgTrail_trail_x[effect_var_imgTrail_number_of_after_images] = x
		effect_var_imgTrail_trail_y[effect_var_imgTrail_number_of_after_images] = y
		effect_var_imgTrail_alpha[effect_var_imgTrail_number_of_after_images] = 1
		//set spacing to argument
		effect_var_imgTrail_spacing = spacing
		//update the information contained in the arrays
		//shift the information down by 1
		//on the next update position 4 will be position 3 and so on.
		array_copy(effect_var_imgTrail_temp_x, 0, effect_var_imgTrail_trail_x, 1, array_length(effect_var_imgTrail_trail_x))
		array_copy(effect_var_imgTrail_trail_x, 0, effect_var_imgTrail_temp_x, 0, array_length(effect_var_imgTrail_temp_x))
		array_copy(effect_var_imgTrail_temp_y, 0, effect_var_imgTrail_trail_y, 1, array_length(effect_var_imgTrail_trail_y))
		array_copy(effect_var_imgTrail_trail_y, 0, effect_var_imgTrail_temp_y, 0, array_length(effect_var_imgTrail_temp_y))
		array_copy(effect_var_imgTrail_temp_alpha, 0, effect_var_imgTrail_alpha, 1, array_length(effect_var_imgTrail_alpha))
		array_copy(effect_var_imgTrail_alpha, 0, effect_var_imgTrail_temp_alpha, 0, array_length(effect_var_imgTrail_temp_alpha))

	}
	//minus one from spacing
	else
	{
		effect_var_imgTrail_spacing --
	}


}
