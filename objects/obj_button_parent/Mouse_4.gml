y = ystart + 4;

alarm[0] = 10;

// Roda apenas se os efeitos sonoros estiverem ligados
if global.sfx_on
{
	// Reaproveita o áudio de pulo para indicar clique efetivo
	audio_play_sound(snd_jump_1, 0, false, 0.6, 0);
}