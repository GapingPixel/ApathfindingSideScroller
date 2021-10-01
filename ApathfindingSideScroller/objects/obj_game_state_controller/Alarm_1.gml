/// @description Scoring Timer Tick
if global.game_state = GameState.play
    global.scoring_time += 1;

alarm[1] = room_speed;