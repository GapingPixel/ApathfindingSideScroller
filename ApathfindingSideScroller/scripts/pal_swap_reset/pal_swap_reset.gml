/// @description pal_swap_reset();
/// @function pal_swap_reset
function pal_swap_reset() {
	//Resets the shader
	if(global.Pal_Shader_Is_Set)
	{
		shader_reset();
	}
	global.Pal_Shader_Is_Set=false;


}
