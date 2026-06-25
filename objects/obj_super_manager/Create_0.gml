// ==========================================
// PREVENÇÃO DE CLONES (SINGLETON)
// ==========================================
// Se já existir mais de 1 cópia deste objeto no jogo, esta nova cópia se auto destrói
if (instance_number(object_index) > 1)
{
    instance_destroy();
    exit; // O 'exit' cancela a leitura do resto do código deste evento
}

// ==========================================
// VARIÁVEIS DE CONTROLE DE TELA (HTML5)
// ==========================================
// Começam em -1 para forçar o redimensionamento a rodar pelo menos uma vez ao iniciar o jogo
last_browser_w = -1;
last_browser_h = -1;

// ==========================================
// VARIÁVEIS GERAIS DO JOGO
// ==========================================
// Global controlador da música do jogo
global.music_on = true;
// Global controlador dos efeitos sonoros do jogo
global.sfx_on = true;