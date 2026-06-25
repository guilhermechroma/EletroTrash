// ==========================================
// LIGA/DESLIGA DE MÚSICAS POR SALA
// ==========================================
var _sala_atual = room_get_name(room);

if _sala_atual == "rm_menu" || _sala_atual == "rm_leaderboard"
{   
    // Só pausa se a música estiver desligada MAS ainda não foi pausada
    if !global.music_on && !audio_is_paused(snd_menu_music)
    {
        audio_pause_sound(snd_menu_music);
    }
    // Só despausa se a música estiver ligada E estiver pausada
    else if global.music_on && audio_is_paused(snd_menu_music)
    {
        audio_resume_sound(snd_menu_music);
    }
}
else if _sala_atual == "rm_game"
{
    if !global.music_on && !audio_is_paused(snd_game_music)
    {
        audio_pause_sound(snd_game_music);
    }
    else if global.music_on && audio_is_paused(snd_game_music)
    {
        audio_resume_sound(snd_game_music);
    }
}

// ==========================================
// REDIMENSIONAMENTO PARA HTML5
// ==========================================

// Verifica se o jogo está rodando em um navegador
if (os_browser != os_unknown) 
{
    // Verifica se o navegador mudou de tamanho desde a última vez que foi checado
    if (browser_width != last_browser_w || browser_height != last_browser_h)
    {
        // Atualiza a memória com o novo tamanho do navegador para impedir que este código rode novamente
        last_browser_w = browser_width;
        last_browser_h = browser_height;
        
        // A resolução base original do jogo
        var _base_w = 1000;
        var _base_h = 1000;
        
        // Descobre qual lado da tela é menor para travar o limite
        var _scale = min(browser_width / _base_w, browser_height / _base_h);
        
        // Calcula o novo tamanho do jogo, mantendo quadrado
        var _new_w = floor(_base_w * _scale);
        var _new_h = floor(_base_h * _scale);
        
        // Aplica o tamanho novo no Canvas do HTML5 (apenas 1 vez)
        window_set_size(_new_w, _new_h);
		
		// Trava a resolução interna da arte do jogo e da UI
		surface_resize(application_surface, _base_w, _base_h);
        display_set_gui_size(_base_w, _base_h);
        
        // Centraliza criando as barras pretas nas laterais
        window_center(); 
    }
}