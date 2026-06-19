/// @description CICLO REAL DO JOGO

// Define uma posição horizontal aleatória para o item ser criado
var _x_pos = random_range(margin, room_width - margin);

// Escolhe um dos itens para ser criado
var _item_chance = random_range(0, 3)

if _item_chance > 2
{
	item = obj_good_item;
}
else
{
	item = obj_bad_item;
}

// Cria o item um pouco acima da tela, dando tempo para o jogador o ver antes de cair
var _new_item = instance_create_layer(_x_pos, -32, "Instances", item);

// Define sua velocidade pela velocidade atual dos itens na fase
_new_item.vspeed = item_speed;

// Aumenta o indicador de dificuldade todo loop
difficulty += .5;

// Quando a dificuldade sobe 5 a mais (múltiplo de 5), os objetos começam a cair mais rápido
if difficulty > 1 && difficulty % 5 == 0
{
	// Aumenta a velocidade dos itens caindo
	item_speed += 1;
	
    // A função 'with' aplica a alteração a todas as instâncias dos itens na tela
    with (obj_falling_item)
    {
        vspeed = other.item_speed;
    }
}

// Checa se a dificuldade passou de 10
if difficulty > 30
{
	// Reinicia o loop do alarme, com maior frequência
	alarm[1] = random_range(10, 25);
}
else if difficulty > 10
{
	// Reinicia o loop do alarme, com maior frequência
	alarm[1] = random_range(25, 50);
}
else
{
	// Reinicia o loop padrão do alarme
	alarm[1] = random_range(50, 100);
}