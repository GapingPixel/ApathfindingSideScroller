/// @description Disable Overlay
if global.debugger_enable_overlay == true
	global.debugger_enable_overlay = false
else
	global.debugger_enable_overlay = true;


show_debug_overlay(global.debugger_enable_overlay)