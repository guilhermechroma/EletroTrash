draw_set_font(fnt_gui_extra_large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_colour(c_red);
draw_text(room_width/2, 100, "FIM DE JOGO");

draw_set_font(fnt_gui_medium);
draw_set_colour(c_yellow);
draw_text(room_width/2, room_height/2 - 175, "PONTUAÇÃO");

draw_set_font(fnt_gui_extra_large);
draw_set_colour(c_white);
var _str = string(global.player_score);
draw_text(room_width/2, room_height/2 - 100, _str);

// Reseta alinhamento padrão para próximos elementos a desenhar
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);