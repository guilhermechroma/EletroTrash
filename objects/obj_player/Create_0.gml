// ==========================================
// CONFIGURAÇÕES VISUAIS
// ==========================================

// Salva a altura (Y) exata onde o jogador nasceu para a sombra não subir
y_da_sombra = y;

// Pega a altura atual do sprite em alta resolução
var _altura_original = sprite_get_height(sprite_index);

// Calcula qual deve ser o multiplicador para a altura chegar a X pixels
var _escala = 150 / _altura_original;

// Aplica essa escala tanto no visual quanto na colisão
image_xscale = _escala;
image_yscale = _escala;

// ==========================================
// CONFIGURAÇÕES DO MASCOTE
// ==========================================

// Escala do mascote (2 = dobro do tamanho, 3 = triplo, etc)
mascot_escala = 2.5;

// Posição do mascote em relação ao jogador
mascot_overlap_x = -200; 
mascot_overlap_y = -100;

// Variáveis de controle da animação
mascot_sprite_atual = spr_mascot_5;
mascot_animando = false;
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