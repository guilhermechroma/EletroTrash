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
    
    // Salva o nome atual do jogador na variável global
    global.player_name = button_text;
}

// Reseta o texto do input, caso o jogador saia para o menu
if global.in_menu
{
    keyboard_string = ""; 
    button_text = "";     
    global.player_name = ""; 
    
    // Retorna o global para falso, evitando loop infinito
    global.in_menu = false;
}

// --- LÓGICA DE PISCAR TROCANDO O SPRITE ---
if (flashing_red == true)
{
    flash_timer -= 1;
    
    if (flash_timer <= 0)
    {
        // Acabou o tempo, desliga o piscar e garante o sprite original
        flashing_red = false;
        sprite_index = spr_button; 
    }
    else
    {
        // A matemática mágica: a cada 15 frames, ele alterna entre verdadeiro e falso
        if ((flash_timer % 30) > 15)
        {
            sprite_index = spr_button_fail; // Borda vermelha
        }
        else
        {
            sprite_index = spr_button; // Borda normal
        }
    }
}