// Destrói o item coletado
instance_destroy(other);

// Aumenta a pontuação do jogador
global.player_score += 1;

// Roda apenas se os efeitos sonoros estiverem ligados
if global.sfx_on
{
	// Toca o áudio de pegar item ruim, com um tom aleatório (para evitar repetitividade)
	audio_play_sound(snd_good_catch, 0, false, 0.8, 0, random_range(0.8, 1.2));
}