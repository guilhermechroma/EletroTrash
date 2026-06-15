// === DESENHA O RASTRO ===
var _length = array_length(trail_x);
for (var i = 0; i < _length; i++)
{
    // A transparência diminui gradativamente. Os itens mais velhos da lista ficam mais invisíveis.
    // Multiplicar por 0.5 no final garante que o rastro nunca seja mais forte que 50%
    var _alpha = (1 - (i / trail_size)) * 0.35;
    
    // Desenha o "fantasma" do sprite
    draw_sprite_ext(sprite_index, image_index, trail_x[i], trail_y[i], image_xscale, image_yscale, trail_angle[i], c_white, _alpha);
}

// ==========================================
// SISTEMA DE CONTORNO SÓLIDO (USANDO FOG)
// ==========================================

// Define qual cor será usada
var _cor_contorno = c_white; 

if (is_tutorial == true) 
{
    _cor_contorno = tutorial_color;
} 
else 
{
    if (object_index == obj_good_item) _cor_contorno = c_lime;
    else if (object_index == obj_bad_item) _cor_contorno = c_red;
}

var _espessura = 5; 

// LIGA O FOG (NEBLINA):
// Isso força TUDO que for desenhado a partir de agora a ser uma silhueta sólida da cor escolhida
gpu_set_fog(true, _cor_contorno, 0, 0);

// Desenha as 4 posições do contorno (a cor aqui não importa por conta da cor já definida no fog)
draw_sprite_ext(sprite_index, image_index, x + _espessura, y, image_xscale, image_yscale, image_angle, c_white, 1); // Direita
draw_sprite_ext(sprite_index, image_index, x - _espessura, y, image_xscale, image_yscale, image_angle, c_white, 1); // Esquerda
draw_sprite_ext(sprite_index, image_index, x, y + _espessura, image_xscale, image_yscale, image_angle, c_white, 1); // Baixo
draw_sprite_ext(sprite_index, image_index, x, y - _espessura, image_xscale, image_yscale, image_angle, c_white, 1); // Cima

// DESLIGA O FOG
gpu_set_fog(false, c_white, 0, 0);

// ==========================================
// DESENHA O ITEM ORIGINAL E O TUTORIAL
// ==========================================

// Desenha a sprite do item acima do rastro
draw_self();

// Se for um item de tutorial, desenha o texto acompanhando ele
if (is_tutorial == true)
{
    // Centraliza o texto
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    
	// Define a cor e fonte da "sombra"
	draw_set_color(c_black);
	draw_set_font(fnt_gui_medium)
	
	// Desenha o texto um pouco abaixo de onde o texto principal vai vir
    draw_text(x, y - 48, tutorial_text);
	
    // Define a cor do texto principal
    draw_set_color(tutorial_color);
    
    // Desenha o texto um pouco acima do item
    draw_text(x, y - 50, tutorial_text);
    
    // Reseta o alinhamento e a cor para não afetar outros desenhos do jogo
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
	draw_set_color(c_white);
}