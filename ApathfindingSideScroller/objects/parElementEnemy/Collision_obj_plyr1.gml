switch(enemy_state)
{
	case enemyState.NORMAL:
	plyr_parry(atom,1,0,dmg);
	break;
	
	default:
	plyr_parry(atom,1,0,0);
	break;
}