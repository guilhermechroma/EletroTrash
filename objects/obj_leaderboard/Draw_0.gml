draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_gui_medium);

// Posição Y inicial do primeiro colocado
var _start_y = 100;
// Distância vertical entre um jogador e outro
var _spacing = 40;

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
    
	// Define a cor da sombra do texto
	draw_set_colour(c_black);

    // Desenha a sombra do texto, com uma pequena diferença do Y do principal
    draw_text(room_width / 2, _start_y + (i * _spacing) + 5, _str) ;
	
	// Define a cor do texto
	draw_set_colour(c_white);

    // Desenha o texto, aumentando o Y com base no espaçamento e na posição 'i'
    draw_text(room_width / 2, _start_y + (i * _spacing), _str);
}

// Reseta alinhamento padrão para próximos elementos a desenhar
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);