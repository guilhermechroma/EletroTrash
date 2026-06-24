// ==========================================
// MOVIMENTAÇÃO INFINITA DA GRADE
// ==========================================
// Aumenta o deslocamento horizontal e vertical somando a velocidade declarada a cada frame.
// O operador de resto da divisão (%) faz com que, no exato frame em que o número passar de 32 (grid_size),
// ele volte instantaneamente para 0. Isso cria uma ilusão de movimento infinito e impede travamentos por números gigantes.
grid_scroll_x = (grid_scroll_x + grid_speed_x) % grid_size;
grid_scroll_y = (grid_scroll_y + grid_speed_y) % grid_size;