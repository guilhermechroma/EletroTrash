// ==========================================
// DESENHO DA VERSÃO DO JOGO
// ==========================================

// Configura a fonte e o alinhamento para a quina inferior esquerda
draw_set_font(fnt_gui_medium);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

// Define uma margem/offset para o texto não ficar colado na quina da tela
var _margem = 32; 

// Calcula a posição exata para exibir o texto (esquerda inferior)
var _version_x = 0 + _margem;
var _version_y = room_height - _margem;

// Desenha uma sombra preta sutil para o texto ficar legível em qualquer fundo
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_text(_version_x + 2, _version_y + 2, global.game_version);

// Desenha o texto principal em cinza claro ou branco (cores discretas para versão)
draw_set_color(c_ltgray);
draw_set_alpha(0.8);
draw_text(_version_x, _version_y, global.game_version);


// ==========================================
// DESENHO DOS CRÉDITOS DO JOGO
// ==========================================

// Configura a fonte e o alinhamento para a quina inferior esquerda
draw_set_font(fnt_gui_tiny);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

// Calcula a posição exata para exibir o texto (esquerda inferior)
var _credits_x = room_width - _margem;
var _credits_y = room_height - _margem;

// Desenha uma sombra preta sutil para o texto ficar legível em qualquer fundo
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_text(_credits_x + 2, _credits_y + 2, global.game_credits);

// Desenha o texto principal em cinza claro ou branco (cores discretas para versão)
draw_set_color(c_ltgray);
draw_set_alpha(0.8);
draw_text(_credits_x, _credits_y, global.game_credits);


// ==========================================
// LIMPEZA GERAL DE FORMATAÇÃO
// ==========================================
// Reseta sempre para os padrões do GameMaker para não bugar outros textos do menu
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_set_alpha(1);