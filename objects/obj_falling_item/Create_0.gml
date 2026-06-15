vspeed = 5;

// Variáveis para o tutorial
is_tutorial = false;
tutorial_text = "";
tutorial_color = c_white;

// Variáveis para efeito de rastro
trail_size = 5; // Tamanho do rastro (quantos frames antigos serão desenhados)
trail_x = array_create(0); // Memória do eixo X
trail_y = array_create(0); // Memória do eixo Y
trail_angle = array_create(0); // Ângulo do rastro
trail_spacing = 4; // Salva a posição a cada 4 frames. Aumente esse número para afastar mais!
trail_timer = 0;   // O cronômetro que vai contar esses frames

// Define quantos graus o objeto gira por frame.
// 1 é bem lento. 5 é moderado. Use números negativos (-1) para girar pro outro lado.
rot_speed = 1;

// ==========================================
// ESCALA E TAMANHO DOS ITENS
// ==========================================

// Tamanho desejado do item em pixels (ajuste para o que ficar melhor na tela)
var _tamanho_desejado = 100; 

// Descobre o tamanho original do sprite e calcula a porcentagem de redução
var _altura_original = sprite_get_height(sprite_index);
var _escala = _tamanho_desejado / _altura_original;

// Aplica a escala para diminuir o visual e a caixa de colisão
image_xscale = _escala;
image_yscale = _escala;