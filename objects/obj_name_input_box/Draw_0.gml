draw_self(); 

draw_set_font(fnt_gui_large);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Muda a cor do texto para vermelho junto com a borda
if (sprite_index == spr_button_fail) draw_set_color(c_red);
else draw_set_color(c_white);

// Desenha o texto do input
draw_text(x, y, button_text + cursor);

// Reseta alinhamento e cor padrão
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);