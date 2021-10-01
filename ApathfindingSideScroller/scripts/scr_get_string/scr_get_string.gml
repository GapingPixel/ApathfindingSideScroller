///scr_get_string(String_Numerical)
function scr_get_string(argument0) {
	//@param String_Numerical

	//search string from ini file
	var search = argument0;
	var ini_to_read;//ini file set up
	var l = global.settings_language;
	switch(l)//Determine which ini file to log through
	{
	
		default: ini_to_read = "lang_english.ini"; break;
		case 1: ini_to_read = "lang_spanish.ini"; break;
		case 2: ini_to_read = "lang_italian.ini"; break;
		case 3: ini_to_read = "lang_french.ini"; break;
		case 4: ini_to_read = "lang_german.ini"; break;
		//Languages to consider
		/*
		0 English
		1 Spanish
		2 Italian
		3 French
		4 German
		5 Russian
		6 Japanese
		7 Chinese
		*/
	}

	ini_open(ini_to_read);

	var find_string = ini_read_string("lang",string(search),"I AM ERROR");

	ini_close();

	find_string = string_replace_all(find_string,"*","#");//Replace astericks with hashes to break lines if needed

	return find_string;


}
