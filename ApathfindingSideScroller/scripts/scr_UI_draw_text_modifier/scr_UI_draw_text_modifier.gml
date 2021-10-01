function scr_UI_draw_text_modifier(argument0) {


	var tX, tY;
	var charWid = 16;//Width of font
	var lineEnd = 45; //How many characters will be in a single line before breaking
	var line = 0; //line count
	var lineSpace = 24; //vertical spacing b/w lines
	var space = 0;//Character count in words
	var i = 1;//for loop
	tX = x;
	tY = y;
	var str = argument0;

	/*
	Modifier Reference

	Format
	“|0Hello |1World|0!”

	Effect codes
	0 - N/A
	1 - Shake
	2 - Wave, Slow
	3 - Wave, Fast
	4 - Gradient
	5 - Slow Text (not Used here)
	6 - Cyan
	7 - Lime
	8 - Yellow
	9 - Orange
	*/


	while(i <= string_length(str))
		{	
			//Checking for Modifiers with |
			if (string_char_at(str, i) = "|" )
			{
				//detect character to modifier			
				modifier = real(string_char_at(str, ++i));
				++i;
			}	
	
			//Next line
			var length = 0;
			//Check if current word fits inside the text box, and if not we go to the next line
			while(string_char_at(str, i) !=  " "
			&& i <= string_length(str))
			{
				i++;
				length++;
			}

			if(space + length > lineEnd)
			{
				space = 0;
				line++;
			}

			i -= length;


			//Draw Text
			///Modifier Switch Case
			switch(modifier)
			{
				//Normal
				case 0: 
				{
					draw_set_color(c_white);
					draw_text_shadow(tX + (space*charWid),
					tY + (lineSpace*line),
					string_char_at(str, i),
					c_white,
					c_gray,
					1);
					break;
				}

				//Shaky
				case 1:
				{
					draw_set_color(c_white);
					draw_text_shadow(tX + (space*charWid) + random_range(-3,3),
					tY + (lineSpace*line)  + random_range(-3,3),
					string_char_at(str, i),
					c_white,
					c_gray,
					1);
					break;
				}

				//Wavy, Sine
				case 2:
				{
					var so = t + i;
					var shift = sin(so * pi * freq/30 * amp);
					draw_text_shadow(tX + (space*charWid),
					tY + (lineSpace*line) + shift*2,
					string_char_at(str, i),
					c_white,
					c_gray,
					1);
					break;
				}

				//Wavy, Fast
				case 3:
				{
					//draw_set_color(c_white);
					var so = t + i;
					var shift = sin(so * pi * freq/30 * amp);
					draw_text_shadow(tX + (space*charWid),
					tY + (lineSpace*line) + shift*5,
					string_char_at(str, i),
					c_white,
					c_gray,
					1);
					break;
				}
			
				//Slow Shake
				case 4:
				{
					draw_text_shadow(tX + (space*charWid) + random_range(-3,3),
					tY + (lineSpace*line)  + random_range(-3,3),
					string_char_at(str, i),
					c_white,
					c_gray,
					1);
					break;
				}

				// Text
				/*case 5:
				{
					draw_set_color(c_white);
					draw_text_shadow(tX + (space*charWid),
					tY + (lineSpace*line),
					string_char_at(str, i),
					c_white,
					c_white,
					1);
					break;
				}*/
			
				//Color Yellow
				case 6:
				{
					draw_text_shadow(tX + (space*charWid),
					tY + (lineSpace*line),
					string_char_at(str, i),
					c_yellow,
					c_gray,
					1);
					break;
				}

				//Color Cyan
				case 7:
				{
					draw_text_shadow(tX + (space*charWid),
					tY + (lineSpace*line),
					string_char_at(str, i),
					c_aqua,
					c_gray,
					1);
					break;
				}

				//Color Lime
				case 8:
				{
					draw_text_shadow(tX + (space*charWid),
					tY + (lineSpace*line),
					string_char_at(str, i),
					c_lime,
					c_gray,
					1);
					break;
				}

				//Color Orange
				case 9:
				{
					draw_text_shadow(tX + (space*charWid),
					tY + (lineSpace*line),
					string_char_at(str, i),
					c_orange,
					c_gray,
					1);
					break;
				}
			
			}
			//Move to next character
			space++;
			i++;
		}



}
