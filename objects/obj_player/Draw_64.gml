// ==========================================
// DESENHA A VIDA/CORAÇÕES COM CONTORNO PRETO
// ==========================================
var _ui_thickness = 4; // Espessura do contorno dos corações

for(i = 0; i < global.hearts; i++)
{
    var _hx = 32 + (sprite_get_width(spr_heart) + 10)*i;
    var _hy = 32;
    
    // 1. LIGA O FOG PRETO para fazer o contorno do coração
    gpu_set_fog(true, c_black, 0, 0);
    draw_sprite(spr_heart, 0, _hx + _ui_thickness, _hy); // Direita
    draw_sprite(spr_heart, 0, _hx - _ui_thickness, _hy); // Esquerda
    draw_sprite(spr_heart, 0, _hx, _hy + _ui_thickness); // Baixo
    draw_sprite(spr_heart, 0, _hx, _hy - _ui_thickness); // Cima
    gpu_set_fog(false, c_white, 0, 0); // DESLIGA O FOG
    
    // 2. Desenha o coração original com suas cores normais por cima
    draw_sprite(spr_heart, 0, _hx, _hy);
}

// ==========================================
// DESENHA A PONTUAÇÃO
// ==========================================
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