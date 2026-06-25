// ==========================================
// GERENCIADOR DE MÚSICAS POR SALA
// ==========================================
var _sala_atual = room_get_name(room);

if _sala_atual == "rm_menu" || _sala_atual == "rm_leaderboard"
{
    // Para a música do jogo e game over
    audio_stop_sound(snd_game_music);
	audio_stop_sound(snd_game_over);
    
    // Só dá play se a música do menu já não estiver tocando
    if !audio_is_playing(snd_menu_music)
    {
        // audio_play_sound(som, prioridade, loop)
        audio_play_sound(snd_menu_music, 1, true, 0.5, 0);
		
		if (!global.music_on) audio_pause_sound(snd_menu_music);
    }
}
else if _sala_atual == "rm_game"
{
    // Para a música do menu e game over
    audio_stop_sound(snd_menu_music);
	audio_stop_sound(snd_game_over);
    
    // Toca a música do jogo em loop
    if !audio_is_playing(snd_game_music)
    {
        audio_play_sound(snd_game_music, 1, true, 0.5, 0);
		
		if (!global.music_on) audio_pause_sound(snd_game_music);
    }
}
else if _sala_atual == "rm_game_over"
{
    // Para todas as músicas
    audio_stop_sound(snd_game_music);
	audio_stop_sound(snd_menu_music);
    
    // Toca o som de game over apenas uma vez
    if !audio_is_playing(snd_game_over)
    {
        audio_play_sound(snd_game_over, 1, false);
		
		if (!global.sfx_on) audio_pause_sound(snd_game_over);
    }
}