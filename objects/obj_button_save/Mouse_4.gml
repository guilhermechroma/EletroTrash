// --- SISTEMA DE VALIDAÇÃO DE NOME ---
// Se o texto for vazio (ou só espaços), trava o salvamento
if (string_trim(global.player_name) == "" && clicked != true)
{
    // Configura a piscagem neste botão (obj_save)
    flashing_red = true;
    flash_timer = obj_name_input_box.flash_duration; 
    button_text = "Digite seu nome"; // Texto de aviso
    
    // Configura a piscagem na caixa de nome
    with(obj_name_input_box)
    {
        flashing_red = true;
        flash_timer = flash_duration; 
    }
	
	// Roda apenas se os efeitos sonoros estiverem ligados
	if global.sfx_on
	{
		// Reaproveita o áudio de pegar item ruim para indicar erro
		audio_play_sound(snd_bad_catch, 0, false);
	}
	
    // Sai do evento antes de salvar
    exit; 
}


// ==========================================
// SEÇÃO DE SALVAMENTO PADRÃO
// ==========================================
// Checa se não estiver piscando vermelho, pra poder exibir que o salvamento foi feito
if flashing_red != true
{
	if clicked != true
	{
	    y = ystart + 4;
	    alarm[0] = 20;
	}

	clicked = true;

	// Salva o nome do jogador no placar
	save_game()

	// Troca a global de "estar no menu" para limpar o nome no input box
	global.in_menu = true;
	
	// Roda apenas se os efeitos sonoros estiverem ligados
	if global.sfx_on
	{
		// Reaproveita o áudio de pulo para indicar clique efetivo
		audio_play_sound(snd_jump_1, 0, false, 0.6, 0);
	}
}