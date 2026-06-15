// Aplica rotação para a imagem
image_angle += rot_speed;

// Conta o temporizador regressivamente
if (trail_timer > 0)
{
    trail_timer -= 1;
}
// Quando o temporizador zerar, salvamos a posição
else
{
    // Reseta o temporizador para o valor de espaçamento
    trail_timer = trail_spacing;

    // Salva a posição e o ângulo atual no início (índice 0) da lista
    array_insert(trail_x, 0, x);
    array_insert(trail_y, 0, y);
	array_insert(trail_angle, 0, image_angle);

    // Se a lista de rastros ficou maior que o limite (trail_size), apaga a última
    if (array_length(trail_x) > trail_size)
    {
        array_pop(trail_x);
        array_pop(trail_y);
		array_pop(trail_angle);
    }
}

// ==========================================
// COLISÃO COM O CHÃO E DESTRUIÇÃO (CORRIGIDO)
// ==========================================

// Verifica a colisão com o chão olhando para o próximo frame
var _chao = instance_place(x, y + vspeed, obj_floor);

if (_chao != noone)
{
    if (vspeed >= 0)
    {
        // Define uma cor padrão (caso não seja nenhum dos abaixo)
        var _cor_do_efeito = c_white; 
        
        if (is_tutorial == true) 
        {
            _cor_do_efeito = tutorial_color; // Cor verde ou vermelha do tutorial
        } 
        else 
        {
            // Para garantir 100% de precisão, checamos se o objeto atual é o bom ou o ruim:
            if (object_index == obj_good_item) _cor_do_efeito = c_lime;
            else if (object_index == obj_bad_item) _cor_do_efeito = c_red;
            else _cor_do_efeito = c_yellow; // Se não for nenhum, o efeito fica amarelo
        }
        
        // Posição vertical exata do topo do chão para o efeito não ficar flutuando ou enterrado
        var _impact_y = _chao.bbox_top;
        
        // Cria o objeto de efeito exatamente na superfície do chão
        var _efeito = instance_create_layer(x, _impact_y, "Instances", obj_impact);
        
        // Aplica a cor ao sprite do efeito
        _efeito.image_blend = _cor_do_efeito;
        
        // Destrói o item imediatamente (desocupando a memória)
        instance_destroy();
    }
}