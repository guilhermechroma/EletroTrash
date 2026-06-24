// ==========================================
// CAMADA DA GRADE EM MOVIMENTO
// ==========================================
// Aplica a cor personalizada e a transparência sutil que definimos no Create para as linhas
draw_set_color(grid_color);
draw_set_alpha(grid_alpha);

// Loop para desenhar as linhas horizontais. 
for (var _y = -grid_size + grid_scroll_y; _y <= room_height + grid_size; _y += grid_size)
{
    draw_line(0, _y, room_width, _y);
}

// Loop para desenhar as linhas verticais aplicando o deslocamento horizontal do scroll
for (var _x = -grid_size + grid_scroll_x; _x <= room_width + grid_size; _x += grid_size)
{
    draw_line(_x, 0, _x, room_height);
}

// LIMPEZA OBRIGATÓRIA: Reseta o alpha e a cor para o padrão (100% branco)
draw_set_alpha(1);
draw_set_color(c_white);


// ==========================================
// CAMADA DO MASCOTE E LIXEIRA
// ==========================================
// Variáveis para a animação de balanço suave usando senóide baseada no tempo
var _animation_time = current_time / 800; // Controla a velocidade do balanço
var _trash_swing = sin(_animation_time) * 4; // Balança entre -4 e +4 graus
var _carty_swing = cos(_animation_time * 0.8) * 3; // Balanço do Carty assíncrono e mais leve

// --- LIXEIRA ---
var _trash_x = 100;
var _trash_y = room_height - 100;
var _trash_scale = 0.8;
// Desenha a lixeira usando a nova escala reduzida e a rotação de -15 graus + animação
draw_sprite_ext(spr_trash_menu, 0, _trash_x, _trash_y, _trash_scale, _trash_scale, -15 + _trash_swing, c_white, 1);


// --- MASCOTE (CARTY) ---
var _carty_x = room_width - 150;
var _carty_y = room_height / 2 + 100;
var _carty_scale = 1.3; // REDUZIDO: Caiu de 2.5 para 1.3 (ajuste aqui se ainda achar muito grande ou muito pequeno)
// Desenha o Carty usando a escala reduzida e a animação
draw_sprite_ext(spr_carty_menu, 0, _carty_x, _carty_y, _carty_scale, _carty_scale, _carty_swing, c_white, 1);


// ==========================================
// 2. CAMADA DE EFEITO: DEGRADÊ PRETO (FADE)
// ==========================================
// Desenha o degradê escuro por cima dos itens e da grade para escurecer as bordas
// CORREÇÃO: Como a origem é "Top Left", desenhamos exatamente na coordenada 0, 0.
// Usamos draw_sprite_stretched para garantir que o fade cubra a tela toda mesmo se a room mudar de tamanho
draw_sprite_stretched(spr_fade, 0, 0, 0, room_width, room_height);


// ==========================================
// 3. CAMADA DA FRENTE: INTERFACE E TEXTOS BRILHANTES
// ==========================================
// Modifica o ponto de pivô/âncora da escrita dos textos para o centro absoluto
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Variáveis matemáticas baseadas no tempo real para criar animações de pulso
var _time = current_time / 200;
var _glow_alpha = 0.3 + (sin(_time) * 0.3); // Cria uma oscilação suave de transparência (de 0.0 a 0.6) para o neon pulsar
var _text_scale = 1 + (sin(_time * 1.5) * 0.03); // Cria um efeito de "bater coração" que faz o texto crescer e encolher levemente

// --- TEXTO: FIM DE JOGO (VERMELHO NEON) ---
draw_set_font(fnt_gui_extra_large);
var _x1 = room_width / 2;
var _y1 = 125;

// Desenha a sombra projetada escura atrás do letreiro
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_text_transformed(_x1 + 4, _y1 + 4, "FIM DE JOGO", _text_scale, _text_scale, 0);

// ATIVA O BLENDMODE ADITIVO: Faz com que as cores somem luz aos pixels do fundo
gpu_set_blendmode(bm_add);
draw_set_color(c_red);
draw_set_alpha(_glow_alpha);
draw_text_transformed(_x1 - 3, _y1, "FIM DE JOGO", _text_scale, _text_scale, 0);
draw_text_transformed(_x1 + 3, _y1, "FIM DE JOGO", _text_scale, _text_scale, 0);
draw_text_transformed(_x1, _y1 - 3, "FIM DE JOGO", _text_scale, _text_scale, 0);
draw_text_transformed(_x1, _y1 + 3, "FIM DE JOGO", _text_scale, _text_scale, 0);

// DESATIVA O BLENDMODE: Retorna ao modo normal para o miolo sólido
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_red); 
draw_text_transformed(_x1, _y1, "FIM DE JOGO", _text_scale, _text_scale, 0);


// --- TEXTO: PONTUAÇÃO (AMARELO NEON) ---
draw_set_font(fnt_gui_medium);
var _x2 = room_width / 2;
var _y2 = room_height / 2 - 200;

// Sombra do título da pontuação
draw_set_color(c_black);
draw_text(_x2 + 3, _y2 + 3, "PONTUAÇÃO");

// Brilho difuso amarelo (Blendmode aditivo)
gpu_set_blendmode(bm_add);
draw_set_color(c_yellow);
draw_set_alpha(_glow_alpha * 0.7); 
draw_text(_x2 - 2, _y2, "PONTUAÇÃO");
draw_text(_x2 + 2, _y2, "PONTUAÇÃO");
draw_text(_x2, _y2 - 2, "PONTUAÇÃO");
draw_text(_x2, _y2 + 2, "PONTUAÇÃO");

// Miolo sólido amarelo
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_yellow);
draw_text(_x2, _y2, "PONTUAÇÃO");


// --- VALOR DA PONTUAÇÃO (NUMERAÇÃO CYAN/TECH) ---
draw_set_font(fnt_gui_extra_large);
var _x3 = _x2;
var _y3 = _y2 + 75;
var _str = string(global.player_score);

// Sombra do número
draw_set_color(c_black);
draw_text(_x3 + 4, _y3 + 4, _str);

// Brilho Aditivo Ciano
gpu_set_blendmode(bm_add);
draw_set_color(c_lime); 
draw_set_alpha(_glow_alpha);
draw_text(_x3 - 3, _y3, _str);
draw_text(_x3 + 3, _y3, _str);
draw_text(_x3, _y3 - 3, _str);
draw_text(_x3, _y3 + 3, _str);

// Miolo sólido branco pura luz
gpu_set_blendmode(bm_normal);
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(_x3, _y3, _str);


// ==========================================
// LIMPEZA GERAL DE FORMATAÇÃO (BOAS PRÁTICAS)
// ==========================================
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);