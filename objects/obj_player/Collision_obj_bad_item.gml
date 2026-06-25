// Reduz 1 vida do jogador
global.hearts -= 1;

// Ativa o efeito vermelho por 15 frames (cerca de 1/4 de segundo)
flash_timer = 15;

// Destrói o item ruim para ele não tirar mais vidas no mesmo frame
instance_destroy(other);

// Roda apenas se os efeitos sonoros estiverem ligados
if global.sfx_on
{
	// Toca o áudio de pegar item ruim, com um tom aleatório (para evitar repetitividade)
	audio_play_sound(snd_bad_catch, 0, false, 0.8, 0, random_range(0.8, 1.2));
}