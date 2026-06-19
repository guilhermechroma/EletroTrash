// ==========================================
// CONFIGURAÇÕES VISUAIS
// ==========================================

// Salvamos desde o início o Y do objeto, para manter o Y do mascote fixo
y_fixo = y;

// Pega a altura atual do sprite em alta resolução
var _original_height = sprite_get_height(sprite_index);

// Calcula qual deve ser o multiplicador para a altura chegar a X pixels
var _scale = 150 / _original_height;

// Aplica essa escala tanto no visual quanto na colisão
image_xscale = _scale;
image_yscale = _scale;

// Controla quantos frames o jogador ficará piscando em vermelho após o dano
flash_timer = 0;

// ==========================================
// CONFIGURAÇÕES DO MASCOTE
// ==========================================

// Escala do mascote (2 = dobro do tamanho, 3 = triplo, etc)
mascot_scale = 2.5;

// Posição do mascote em relação ao jogador
mascot_overlap_x = -200; 
mascot_overlap_y = -100;

// Variáveis de controle da animação
mascot_current_sprite = spr_mascot_5;
mascot_animation = false;
mascot_frame = 0;
mascot_timer = 0;
mascot_anim_speed = 5; // Velocidade da animação (quanto menor, mais rápido ele troca de sprite)

// Array com a sequência exata do pulo
mascot_sequencia = [
    spr_mascot_4, 
    spr_mascot_3, 
    spr_mascot_2, 
    spr_mascot_1, 
    spr_mascot_2, 
    spr_mascot_3, 
    spr_mascot_4, 
    spr_mascot_5
];

// ==========================================
// VARIÁVEIS DE JOGABILIDADE
// ==========================================

// Variáveis de velocidade de andar e pular do jogador
move_speed = 10;
jump_speed = 16;

// Variáveis de movimento do jogador
move_x = 0;
move_y = 0;

// Variáveis de vida e pontuação do jogador
global.hearts = 3;
global.player_score = 0;

// ==========================================
// SISTEMA DE TUTORIAL INICIAL
// ==========================================

// Multiplica os frames por 5 para ter exatamente 5 segundos
tutorial_timer = game_get_speed(gamespeed_fps) * 5; 
tutorial_alpha = 1; // 1 = totalmente visível, 0 = invisível