debugger_on = false;//Main switch for turning debugger on or off
if global.debugger_enabled == true
{
show_debug_overlay(global.debugger_enable_overlay);
}
else
{
show_debug_overlay(false)
instance_destroy();
}

