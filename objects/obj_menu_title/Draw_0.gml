// ==========================================
// SOMBRA PROJETADA (DROP SHADOW)
// ==========================================

// Desenha uma sombra escura e deslocada para baixo e direita.
draw_sprite_ext(sprite_index, image_index, x + 8, y + 8, image_xscale, image_yscale, image_angle, c_black, 0.5);

// Desenha o letreiro limpo e com suas cores reais por cima de tudo
draw_self();