// ==========================================
// CONFIGURAÇÕES DA GRADE (GRID MOVIMENTADO)
// ==========================================
grid_size = 32;  // Define o tamanho de cada quadrado da grade em pixels (largura e altura)
grid_alpha = 0.25; // Controla a opacidade da grade (25% visível para não atrapalhar os elementos principais)

// Cria uma cor verde bem escura usando o padrão RGB para dar a pegada de monitor tecnológico antigo
grid_color = make_color_rgb(0, 45, 0); 

// Variáveis que vão armazenar a posição atual de rolagem da grade na tela
grid_scroll_x = 0; 
grid_scroll_y = 0; 

// Velocidade de movimento da grade por frame (pixels por segundo divididos pela taxa de quadros)
// Valores positivos movem a grade para a direita/baixo. Valores negativos moveriam para a esquerda/cima.
grid_speed_x = 0.5; 
grid_speed_y = 0.5;