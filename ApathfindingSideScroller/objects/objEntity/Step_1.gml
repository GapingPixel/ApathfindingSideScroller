//Shadow Casting
if !ini
{
ini = true;
}

if ini
CastShadow();

//Splashing
liquid_contact();

//Squash and Stretch
if stretch_x > 1
	stretch_x -= 0.1;
	
if stretch_x < 1
	stretch_x += 0.1;
	
if stretch_y > 1
	stretch_y -= 0.1;
	
if stretch_y < 1
	stretch_y += 0.1;