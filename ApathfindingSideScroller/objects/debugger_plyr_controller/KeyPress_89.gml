/// @description Invisbile Players
if instance_exists(parPlyr)
with(parPlyr)
{
	if visible == true
	visible = false
	else
	visible = true
}