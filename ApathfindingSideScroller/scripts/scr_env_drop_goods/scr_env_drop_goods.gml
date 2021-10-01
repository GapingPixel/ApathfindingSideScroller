/// @description Drop from environments
function scr_env_drop_goods() {
	var dpth = -2;
	var inst;
	var i;

	switch(env_goodies)
	{
	default:
	//nothing
	break

	case 0: 
	//nothing
	break;

	//Health Pickups
	case 1://Minor health pack
	inst = instance_create_depth(x,y-30,dpth,obj_health_minor)
	inst.vy = -20;
	break;

	case 2://Minor health pack bundle
	for(i = -3; i <= 3; i += 3)
	{
	inst = instance_create_depth(x+(i*2),y-30,dpth,obj_health_minor)
	inst.image_yscale = 1;
	with(inst)
	{
	 vy -= 20+random(5);
	 vx += i;
	}
 
	}
	break;

	case 3://Major health pack drop
	break;

	//Elements
	case 4: inst = instance_create_depth(x,y-20,dpth,atom_h) break;
	case 5: inst = instance_create_depth(x,y-20,dpth,atom_na) inst.vy = -20; inst.gravity_active = true; break;
	case 6: inst = instance_create_depth(x,y-20,dpth,atom_k) inst.vy = -20; inst.gravity_active = true; break;
	case 7: inst = instance_create_depth(x,y-20,dpth,atom_cs) inst.vy = -20; inst.gravity_active = true; break;
	case 8: inst = instance_create_depth(x,y-20,dpth,atom_ho) inst.vy = -20; inst.gravity_active = true; break;
	case 9: inst = instance_create_depth(x,y-20,dpth,atom_c) inst.vy = -20; inst.gravity_active = true; break;
	case 10: inst = instance_create_depth(x,y-20,dpth,atom_n)  break;
	case 11: inst = instance_create_depth(x,y-20,dpth,atom_o)  break;
	case 12: inst = instance_create_depth(x,y-20,dpth,atom_f)  break;
	case 13: inst = instance_create_depth(x,y-20,dpth,atom_cl)  break;
	case 14: inst = instance_create_depth(x,y-20,dpth,atom_br)  break;
	case 15: inst = instance_create_depth(x,y-20,dpth,atom_i)  break;

	}

	///Atom spawn sfx
	if env_goodies >= 4 && env_goodies <= 15
	    scr_play_sound(snd_common_collectable_spawn,100,1,1);




}
