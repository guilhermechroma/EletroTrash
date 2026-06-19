// Reduz 1 vida do jogador
global.hearts -= 1;

// Ativa o efeito vermelho por 15 frames (cerca de 1/4 de segundo)
flash_timer = 15;

// Destrói o item ruim para ele não tirar mais vidas no mesmo frame
instance_destroy(other);