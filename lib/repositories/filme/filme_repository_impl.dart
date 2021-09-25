import 'package:app_filmes/applications/rest_client/rest_client.dart';
import 'package:app_filmes/models/filme_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './filme_repository.dart';

class FilmeRepositoryImpl implements FilmeRepository {
  final RestClient _restClient;

  FilmeRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<FilmeModel>> getFilmesPopulares() =>
      _getFilmes('/movies/popular');
  @override
  Future<List<FilmeModel>> getFilmesTops() => _getFilmes('/movie/top_rated');

  Future<List<FilmeModel>> _getFilmes(String url) async {
    final resultado = await _restClient.get(
      url,
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': 1
      },
      decoder: (data) {
        final resultado = data['results'];
        if (resultado != null) {
          return resultado
              .map<FilmeModel>((f) => FilmeModel.fromMap(f))
              .toList();
        }

        return <FilmeModel>[];
      },
    );
    if (resultado.hasError) {
      print('Erro ao buscar filmes [$url] [${resultado.statusText}]');
      throw Exception('Erro ao buscar filmes  [$url]');
    }

    return resultado.body ?? <FilmeModel>[];
  }
}
