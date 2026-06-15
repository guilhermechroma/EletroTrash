/// @description TUTORIAL

// Checa se é a primeira vez que o alarme está rodando
if counter == 0
{
	// Define uma posição horizontal aleatória para o item ser criado
	var _x_pos = random_range(50, room_width - 50);

	// Cria o primeiro item "bom" para o tutorial
	item = obj_good_item;

	// Cria o item um pouco acima da tela, dando tempo para o jogador o ver antes de cair
	var _tutorial_item = instance_create_layer(_x_pos, -32, "Instances", item);
	
	// Ativa as variáveis do tutorial avisando para pegar o item
    _tutorial_item.is_tutorial = true;
    _tutorial_item.tutorial_text = "PEGUE!";
    _tutorial_item.tutorial_color = c_lime;
	
	// Aumenta o contador
	counter += 1;
	
	// Reinicia esse loop
	alarm[0] = 60;
}
// Checa se o alarme já passou por mais de 1 loop
else if counter > 0
{
	// Repete o mesmo, agora com um novo item ruim
	var _x_pos = random_range(50, room_width - 50);

	item = obj_bad_item;

	var _tutorial_item = instance_create_layer(_x_pos, -32, "Instances", item);
	
	// Ativa as variáveis do tutorial avisando para desviar do item
    _tutorial_item.is_tutorial = true;
    _tutorial_item.tutorial_text = "DESVIE!";
    _tutorial_item.tutorial_color = c_red;

	// Começa o próximo loop, com ciclo real do jogo de itens aleatórios
	alarm[1] = 60;
}