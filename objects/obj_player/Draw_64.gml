// Desenha a vida/corações do jogador
for(i = 0; i < global.hearts; i++)
{
    draw_sprite(spr_heart, 0, 32 + (sprite_get_width(spr_heart) + 10)*i, 32);
}

// Desenha a pontuação do jogador
draw_set_font(fnt_gui_small);
draw_set_halign(fa_left);
draw_set_colour(c_yellow);
draw_text(room_width - 150, 30, "PONTUAÇÃO");

draw_set_font(fnt_gui_medium);
draw_set_colour(c_white);
var _str = string(global.player_score);
draw_text(room_width - 150, 50, _str);

// Reseta o alinhamento e a cor para não afetar outros desenhos do jogo
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);