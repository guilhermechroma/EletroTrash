function save_game()
{
	var _array = [];
	
	// Carrega os dados antigos do placar
    if (file_exists("leaderboard.txt"))
    {
        var _file = file_text_open_read("leaderboard.txt");
        var _json = file_text_read_string(_file);
        file_text_close(_file);
        
        // Transforma o JSON de volta em array para não perder o histórico
        _array = json_parse(_json); 
    }
	
	// Cria o struct do jogador atual
	var _struct =
    {
        player_name: global.player_name,
        player_score: global.player_score
    };
	
	// Adiciona os dados do jogador atual no placar existente
	array_push(_array, _struct);
	
	// Ordena a array do maior para o menor pontuação
    array_sort(_array, function(a, b) {
        return b.player_score - a.player_score;
    });
	
	// Se a array passar de 15 elementos, corta o último/menor placar
	if (array_length(_array) > 15)
    {
        array_resize(_array, 15);
    }
	
	// Salva a array completa de volta no arquivo
    var _str = json_stringify(_array);
    var _file_write = file_text_open_write("leaderboard.txt");
    file_text_write_string(_file_write, _str);
    file_text_close(_file_write);
}

function load_game()
{
	// Array vazia, caso não tenha placar salvo
	var _array = [];
	
	// Checa se o arquivo de texto existe
	if file_exists("leaderboard.txt")
	{
		// Abre, lê o arquivo e fecha
        var _file = file_text_open_read("leaderboard.txt");
        var _json = file_text_read_string(_file);
        file_text_close(_file);
        
        // Converte a String JSON em uma Array com os Structs
        _array = json_parse(_json);
	}
	
	return _array;
}