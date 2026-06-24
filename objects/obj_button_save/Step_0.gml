// --- LÓGICA DE PISCAR TROCANDO O SPRITE E TEXTO ---
if (flashing_red == true)
{
    flash_timer -= 1;
    
    if (flash_timer <= 0)
    {
        // Retorna tudo ao normal
        flashing_red = false;
        sprite_index = spr_button;
        button_text = "Salvar e Voltar";
    }
    else
    {
        // Pisca usando os mesmos tempos da caixa de nome
        if ((flash_timer % 30) > 15)
        {
            sprite_index = spr_button_fail;
        }
        else
        {
            sprite_index = spr_button;
        }
    }
}