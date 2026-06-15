// Pega o nome da sala atual
current_room = room_get_name(room)

// Apenas recebe o input se estiver na sala de game over
if current_room == "rm_game_over"
{
	// Checa se o comprimento do nome é menor que o limite declarado
	if string_length(keyboard_string) < limit
	{
		// Muda o texto da caixa pelo input do teclado do jogador
		button_text = keyboard_string;
	}
	else 
	{
		// O input do teclado recebe o valor atual do texto da caixa, assim não adiciona mais nada
		keyboard_string = button_text;
	}
	
	global.player_name = button_text;
}