// ==========================================
// CONFIGURAÇÕES GERAIS E ANIMAÇÃO BASE
// ==========================================
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Relógio do jogo para criar a animação contínua
var _tempo = current_time / 250; 
// Pulso de transparência para o brilho neon
var _brilho_alfa = 0.5 + (sin(_tempo) * 0.1); 


// ==========================================
// TÍTULO DO PLACAR
// ==========================================
// Define uma fonte maior para o título
draw_set_font(fnt_gui_extra_large); 

var _titulo_str = "TOP 15 MELHORES";

var _titulo_y = 100; 

// Efeito de bater coração no título (bem sutil)
var _escala_titulo = 1 + (sin(_tempo * 1.5) * 0.008); 

// Sombra do Título
draw_set_color(c_black);
draw_text_transformed(room_width / 2 + 3, _titulo_y + 3, _titulo_str, _escala_titulo, _escala_titulo, 0);

// Brilho Neon Verde para combinar com o tema Electro Trash
gpu_set_blendmode(bm_add);
draw_set_color(c_green);
draw_set_alpha(_brilho_alfa);
draw_text_transformed(room_width / 2 - 2, _titulo_y, _titulo_str, _escala_titulo, _escala_titulo, 0);
draw_text_transformed(room_width / 2 + 2, _titulo_y, _titulo_str, _escala_titulo, _escala_titulo, 0);
draw_text_transformed(room_width / 2, _titulo_y - 2, _titulo_str, _escala_titulo, _escala_titulo, 0);
draw_text_transformed(room_width / 2, _titulo_y + 2, _titulo_str, _escala_titulo, _escala_titulo, 0);

// Miolo Sólido do Título
gpu_set_blendmode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1);
draw_text_transformed(room_width / 2, _titulo_y, _titulo_str, _escala_titulo, _escala_titulo, 0);


// ==========================================
// LISTA DE JOGADORES
// ==========================================
draw_set_font(fnt_gui_medium);

var _start_y = 185;

// Distância vertical entre um jogador e outro 
var _spacing = 35; 

// Loop que passa por cada posição da array do placar
for (var i = 0; i < array_length(leaderboard_data); i++)
{
    // Pega o struct do jogador na posição 'i' da array
    var _player = leaderboard_data[i];
    
    // Acessa os dados de dentro do struct
    var _name = string(_player.player_name);
    var _score = string(_player.player_score);
    // "1. Nome - Pontuação", "2. Nome - Pontuação"..
    var _str = string(i + 1) + ". " + _name + " - " + _score;
    
    // --- ANIMAÇÃO DE ONDA ---
    // Deslocamento máximo de apenas 4 pixels para as laterais
    var _onda_x = sin(_tempo + (i * 0.15)) * 4; 
    
    var _x_atual = (room_width / 2) + _onda_x;
    var _y_atual = _start_y + (i * _spacing);

    // --- CORES DO PÓDIO ---
    // Define cores diferentes para os 3 primeiros colocados
    var _cor_brilho = c_green; // Padrão: Brilho Verde
    var _cor_texto = c_white; // Padrão: Texto Branco
    
    if (i == 0) {
        _cor_brilho = c_orange;
        _cor_texto = c_yellow; // 1º Lugar: Ouro
    } else if (i == 1) {
        _cor_brilho = c_gray;
        _cor_texto = c_ltgray; // 2º Lugar: Prata
    } else if (i == 2) {
        _cor_brilho = c_red;
        _cor_texto = make_color_rgb(255, 140, 0); // 3º Lugar: Bronze/Laranja
    }

    // Desenha a sombra do texto
    draw_set_colour(c_black);
    draw_set_alpha(0.8);
    draw_text(_x_atual + 3, _y_atual + 3, _str);
    
    // Desenha o Brilho Neon ao redor do texto
    gpu_set_blendmode(bm_add);
    draw_set_color(_cor_brilho);
    // As linhas de baixo têm um brilho um pouco mais fraco que os 3 primeiros
    draw_set_alpha(i < 3 ? _brilho_alfa : _brilho_alfa * 0.5); 
    
    draw_text(_x_atual - 2, _y_atual, _str);
    draw_text(_x_atual + 2, _y_atual, _str);
    draw_text(_x_atual, _y_atual - 2, _str);
    draw_text(_x_atual, _y_atual + 2, _str);
    
    // Desenha o miolo do texto com a cor definida
    gpu_set_blendmode(bm_normal);
    draw_set_color(_cor_texto);
    draw_set_alpha(1);
    draw_text(_x_atual, _y_atual, _str);
}


// ==========================================
// LIMPEZA GERAL DE FORMATAÇÃO
// ==========================================
// Reseta alinhamento padrão para próximos elementos a desenhar não quebrarem
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);