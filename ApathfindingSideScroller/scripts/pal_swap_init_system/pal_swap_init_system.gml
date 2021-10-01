/// @description pal_swap_init_system(shader)
/// @function pal_swap_init_system
/// @param Shader
/// @param <HTML5_Sprite_Shader>
/// @param <HTML5_Surface_Shader>
function pal_swap_init_system() {

	//Initiates the palette system.  Call once at the beginning of your game somewhere.
	//IMPORTANT: if you plan on using this for HTML5, you need to specify your two HTML5 
	//versions of the shader.  

	//globalvar Pal_Shader,Pal_Texel_Size, Pal_UVs, Pal_Index, Pal_Texture, Pal_Shader_Is_Set, 
						//Pal_Layer_Priority, Pal_Layer_Temp_Priority, Pal_Layer_Map, 
						///Pal_HTML5,Pal_HTML5_Sprite, Pal_HTML5_Surface;
					
	enum Pal_Shader_Type{Standard,HTML_Sprite,HTML_Surface}
	global.Pal_HTML5 = os_browser != browser_not_a_browser;
	if(!global.Pal_HTML5)
	{
		global.Pal_Shader = argument[0];

		global.Pal_Texel_Size[Pal_Shader_Type.Standard] = shader_get_uniform(global.Pal_Shader, "u_pixelSize");
		global.Pal_UVs[Pal_Shader_Type.Standard] = shader_get_uniform(global.Pal_Shader, "u_Uvs");
		global.Pal_Index[Pal_Shader_Type.Standard] = shader_get_uniform(global.Pal_Shader, "u_paletteId");
		global.Pal_Texture[Pal_Shader_Type.Standard] = shader_get_sampler_index(global.Pal_Shader, "u_palTexture");

		global.Pal_Shader_Is_Set = false;
	}
	else
	{
		if(argument_count<3)
		{
			show_message("Must provide pal_swap_init_system() with 2 additional arguments for HTML5 Compatible Sprite and Surface Shaders");
			game_end();
		}
		global.Pal_HTML5 = true;
		global.Pal_HTML5_Sprite  = argument[1];
		global.Pal_HTML5_Surface = argument[2];
	
		global.Pal_Texel_Size[Pal_Shader_Type.HTML_Sprite] = shader_get_uniform(global.Pal_HTML5_Sprite, "u_pixelSize");
		global.Pal_UVs[Pal_Shader_Type.HTML_Sprite] = shader_get_uniform(global.Pal_HTML5_Sprite, "u_Uvs");
		global.Pal_Index[Pal_Shader_Type.HTML_Sprite] = shader_get_uniform(global.Pal_HTML5_Sprite, "u_paletteId");
		global.Pal_Texture[Pal_Shader_Type.HTML_Sprite] = shader_get_sampler_index(global.Pal_HTML5_Sprite, "u_palTexture");
	
		global.Pal_Texel_Size[Pal_Shader_Type.HTML_Surface] = shader_get_uniform(global.Pal_HTML5_Surface, "u_pixelSize");
		global.Pal_UVs[Pal_Shader_Type.HTML_Surface] = shader_get_uniform(global.Pal_HTML5_Surface, "u_Uvs");
		global.Pal_Index[Pal_Shader_Type.HTML_Surface] = shader_get_uniform(global.Pal_HTML5_Surface, "u_paletteId");
		global.Pal_Texture[Pal_Shader_Type.HTML_Surface] = shader_get_sampler_index(global.Pal_HTML5_Surface, "u_palTexture");
	}

	global.Pal_Layer_Priority = ds_priority_create();
	global.Pal_Layer_Temp_Priority = ds_priority_create();
	global.Pal_Layer_Map = ds_map_create();



}
