// ==========================================
// CONTORNO DO JOGADOR
// ==========================================
var _thickness = 5; // Espessura do contorno em pixels

// Liga o fog para forçar a cor branca sólida na silhueta do player
gpu_set_fog(true, c_white, 0, 0);

// Desenha o sprite do jogador deslocado nas 4 direções principais
draw_sprite_ext(sprite_index, image_index, x + _thickness, y, image_xscale, image_yscale, image_angle, c_white, 1); // Direita
draw_sprite_ext(sprite_index, image_index, x - _thickness, y, image_xscale, image_yscale, image_angle, c_white, 1); // Esquerda
draw_sprite_ext(sprite_index, image_index, x, y + _thickness, image_xscale, image_yscale, image_angle, c_white, 1); // Baixo
draw_sprite_ext(sprite_index, image_index, x, y - _thickness, image_xscale, image_yscale, image_angle, c_white, 1); // Cima

// Desliga o fog imediatamente para que o mascote e o player normal não fiquem brancos
gpu_set_fog(false, c_white, 0, 0);


// ==========================================
// DESENHO DO JOGADOR ORIGINAL
// ==========================================
// Desenha o próprio jogador por cima do contorno branco
draw_self();

// Se o jogador acabou de tomar dano, desenha uma camada vermelha transparente por cima dele
if (flash_timer > 0)
{
    // Liga o fog vermelho sólido
    gpu_set_fog(true, c_red, 0, 0);
    
    // Desenha o sprite na mesma posição, mas com o argumento de alpha/transparência (0.4 = 40%)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, 0.4);
    
    // Desliga o fog imediatamente
    gpu_set_fog(false, c_white, 0, 0);
}

// ==========================================
// DESENHO DO MASCOTE
// ==========================================
// O X continua grudado na direita do jogador normalmente
var _mascot_x = bbox_right + mascot_overlap_x;

// Para o Y, calculamos a distância entre a origem (y) e o pé do personagem (bbox_bottom)
var _bottom_distance = bbox_bottom - y;

// Fixamos o mascote usando o Y fixo + a distância do pé + o seu ajuste fino
var _mascot_y = y_fixo + _bottom_distance + mascot_overlap_y;

// Desenha o mascote
draw_sprite_ext(mascot_current_sprite, 0, _mascot_x, _mascot_y, mascot_scale, mascot_scale, 0, c_white, 1);

// ==========================================
// DESENHO DO TUTORIAL DE TECLAS
// ==========================================
if (tutorial_timer > 0)
{
	// Aplica a transparência do fade out
    draw_set_alpha(tutorial_alpha);
	draw_set_font(fnt_gui_extra_large);
    
    // Centraliza o ponto de escrita do texto
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Configurações de espaçamento (Formato de Teclado)
    var _side_distance = 150; // Distância entre o jogador e o centro das teclas
    var _horizontal_space = 50;  // Distância entre as teclas de baixo (A e D)
    var _vertical_space = 50;    // Altura da tecla de pulo (W e seta acima)
    
    // Altura base onde as teclas de baixo vão assentar (alinhadas ao chão)
    var _floor_pixel = y_fixo - 60;

    var _shadow_height = 3;

    // --- LADO ESQUERDO (W, A, D) ---
    var _left_x = x - _side_distance;
    
    // Desenha a sombra
    draw_set_color(c_black);

    draw_text(_left_x, _floor_pixel - _vertical_space + _shadow_height, "W");
    draw_text(_left_x - _horizontal_space, _floor_pixel + _shadow_height, "A");
    draw_text(_left_x + _horizontal_space, _floor_pixel + _shadow_height, "D");

    // Desenha o texto
    draw_set_color(c_white);

    draw_text(_left_x, _floor_pixel - _vertical_space, "W");
    draw_text(_left_x - _horizontal_space, _floor_pixel, "A");
    draw_text(_left_x + _horizontal_space, _floor_pixel, "D");

    // --- LADO DIREITO (Setas) ---
    var _right_x = x + _side_distance;
    
    // Desenha a sombra
    draw_set_color(c_black);

    draw_text(_right_x, _floor_pixel - _vertical_space + _shadow_height, "^");
    draw_text(_right_x - _horizontal_space, _floor_pixel + _shadow_height, "<");
    draw_text(_right_x + _horizontal_space, _floor_pixel + _shadow_height, ">");

    // Desenha o texto
    draw_set_color(c_white);

    draw_text(_right_x, _floor_pixel - _vertical_space, "^");
    draw_text(_right_x - _horizontal_space, _floor_pixel, "<");
    draw_text(_right_x + _horizontal_space, _floor_pixel, ">");

    // --- LIMPEZA DE FORMATAÇÃO ---
    // Reseta sempre para os padrões do GameMaker para não quebrar outros textos
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}