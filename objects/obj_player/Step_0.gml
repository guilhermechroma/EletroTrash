// TECLAS
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _jump = keyboard_check(vk_up) or keyboard_check(ord("W"));

// Movimento lateral do jogador
move_x = (_right - _left) * move_speed;

// Pulo do jogador
if place_meeting(x, y + 2, obj_floor)
{
    move_y = 0;
    
    if (_jump)
    {
        move_y = -jump_speed;
        
        // === GATILHO DA ANIMAÇÃO DO MASCOTE ===
        mascot_animando = true;
        mascot_frame = 0;
        mascot_timer = 0;
    }
}
// Gravidade do jogador
else if move_y < 10
{
	move_y += 1;
}

// Função para movimento do jogador e colisão com o chão,
// feita de forma separada para evitar vetor diagonal
move_and_collide(move_x, 0, obj_floor);
move_and_collide(0, move_y, obj_floor);

// ==========================================
// LÓGICA DE ANIMAÇÃO DO MASCOTE
// ==========================================
if (mascot_animando == true)
{
    // O cronômetro roda a cada frame
    mascot_timer += 1;
    
    // Quando o cronômetro atingir o tempo que definimos (mascot_anim_speed)
    if (mascot_timer >= mascot_anim_speed)
    {
        mascot_timer = 0; // Zera o relógio
        mascot_frame += 1; // Avança para o próximo sprite da lista
        
        // Verifica se a animação chegou ao fim da lista
        if (mascot_frame >= array_length(mascot_sequencia))
        {
            mascot_animando = false;
            mascot_sprite_atual = spr_mascot_5; // Garante que volte ao padrão
        }
        else
        {
            // Atualiza o visual para o sprite atual da sequência
            mascot_sprite_atual = mascot_sequencia[mascot_frame];
        }
    }
}
else
{
    // Se não estiver animando o pulo, mantém o sprite padrão
    mascot_sprite_atual = spr_mascot_5;
}

// CONDIÇÃO DE DERROTA (GAME OVER)
if global.hearts <= 0
{
	room_goto(rm_game_over)
}