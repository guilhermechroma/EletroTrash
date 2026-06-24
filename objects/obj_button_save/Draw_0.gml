draw_self();

// ==========================================
// SEÇÃO DE SUCESSO
// ==========================================
// Checa se foi clicado com sucesso antes de desenhar o texto
if (clicked == true)
{
    button_text = "Placar Enviado!";
    sprite_index = spr_button_success;
}

// ==========================================
// DESENHO DO TEXTO COM MUDANÇA DE COR
// ==========================================
// Configura o alinhamento centralizado
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_gui_large); // Caso seus botões usem outra fonte (como medium), basta ajustar aqui!

// A mágica da sincronia: se o botão estiver usando o sprite de erro, pinta a fonte de vermelho
if (sprite_index == spr_button_fail) 
{
    draw_set_color(c_red);
}
else 
{
    // Caso contrário (sprite normal ou de sucesso), mantém branco
    draw_set_color(c_white);
}

// Desenha o texto ("Salvar", "Digite seu nome acima" ou "Placar Salvo!")
draw_text(x, y, button_text);

// ==========================================
// LIMPEZA GERAL
// ==========================================
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);