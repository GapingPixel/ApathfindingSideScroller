switch(enemy_state)
{
	case enemyState.NORMAL:
	plyr_parry(atom,2,1,dmg);
	break;
	
	default:
	plyr_parry(atom,2,1,0);
	break;
}