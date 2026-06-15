// Desenha o próprio jogador
draw_self();

// ==========================================
// DESENHO DO MASCOTE
// ==========================================
// O X continua grudado na direita do jogador normalmente
var _mascot_x = bbox_right + mascot_overlap_x;

// Para o Y, calculamos a distância entre a origem (y) e o pé do personagem (bbox_bottom)
var _distancia_do_pe = bbox_bottom - y;

// Fixamos o mascote usando o Y da sombra (chão) + a distância do pé + o seu ajuste fino
var _mascot_y = y_da_sombra + _distancia_do_pe + mascot_overlap_y;

// Desenha o mascote
draw_sprite_ext(mascot_sprite_atual, 0, _mascot_x, _mascot_y, mascot_escala, mascot_escala, 0, c_white, 1);