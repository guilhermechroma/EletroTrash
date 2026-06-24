// ==========================================
// LÓGICA DE BALANÇO (SWING/SWAY)
// ==========================================

// Cria uma variável de tempo fluida
var _tempo = current_time / velocidade_balanco;

// Aplica a rotação de pêndulo ao ângulo do sprite
image_angle = sin(_tempo) * angulo_maximo;