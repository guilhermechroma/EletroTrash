// ==========================================
// FUNÇÃO DE SALVAMENTO
// ==========================================
function save_game()
{
    var _array = [];
    
    // Carrega os dados antigos do placar (se o arquivo existir)
    if (file_exists("leaderboard.txt"))
    {
        var _file = file_text_open_read("leaderboard.txt");
        var _json = file_text_read_string(_file);
        file_text_close(_file);
        
        // Só tenta converter se o texto não estiver vazio
        if (_json != "")
        {
            try {
                // Transforma o JSON de volta em array
                _array = json_parse(_json); 
            } 
            catch (e) {
                // Se o arquivo corromper, cria uma nova array limpa para não crashar
                _array = [];
            }
        }
    }
    
    // Cria o struct do jogador atual
    var _struct =
    {
        player_name: global.player_name,
        player_score: global.player_score
    };
    
    // Adiciona os dados do jogador atual no placar
    array_push(_array, _struct);
    
    // Ordena a array da maior para a menor pontuação
    array_sort(_array, function(a, b) {
        return b.player_score - a.player_score;
    });
    
    // Se a array passar de 15 elementos, corta o último
    if (array_length(_array) > 15)
    {
        array_resize(_array, 15);
    }
    
    // Converte a array blindada de volta para texto JSON
    var _str = json_stringify(_array);
    
    // Salva o texto sem limite de caracteres no arquivo TXT
    var _file_write = file_text_open_write("leaderboard.txt");
    file_text_write_string(_file_write, _str);
    file_text_close(_file_write);
}

// ==========================================
// FUNÇÃO DE CARREGAMENTO
// ==========================================
function load_game()
{
    // Cria uma array vazia por padrão
    var _array = [];
    
    // Verifica se o arquivo físico (Windows) ou virtual (HTML5) existe
    if (file_exists("leaderboard.txt"))
    {
        // Abre o arquivo em modo de leitura
        var _file = file_text_open_read("leaderboard.txt");
        
        // Lê todo o texto como string JSON e salva lá dentro
        var _json = file_text_read_string(_file);
        
        // Fecha o arquivo imediatamente para liberar a memória
        file_text_close(_file);
        
        // Checa se o texto lido não está vazio
        if (_json != "")
        {
            try {
                // Tenta converter a string JSON de volta para uma Array utilizável pelo jogo
                _array = json_parse(_json);
            } 
            catch (e) {
                // Se a conversão falhar (arquivo corrompido ou modificado errado),
                // o jogo ignora o erro e zera o placar
                _array = [];
            }
        }
    }
    
    // Devolve a array pronta (com os dados ou vazia) para o objeto que pediu
    return _array;
}