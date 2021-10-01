event_inherited();

if !ini
    ini = true
else
    CastShadow();


//Find waving parent
if (!parentInit) {
    if (parent) {
        dx = x - parent.x;
        dy = y - parent.y;
    } else {
        dx = 0;
        dy = 0;
    }
    parentInit = true;
}

