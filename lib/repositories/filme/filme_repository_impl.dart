import 'package:app_filmes/applications/rest_client/rest_client.dart';
import 'package:app_filmes/models/filme_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './filme_repository.dart';

class FilmeRepositoryImpl implements FilmeRepository {
  final RestClient _restClient;

  FilmeRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<FilmeModel>> getFilmesPopulares() async {
    final resultado = await _restClient.get<List<FilmeModel>>(
      '/movie/popular',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final resultadosData = data['results'];
        if (resultadosData != null) {
          return resultadosData
              .map<FilmeModel>((f) => FilmeModel.fromMap(f))
              .toList();
        }
        return <FilmeModel>[];
      },
    );
    if (resultado.hasError) {
      print('Erro ao buscar filmes populares [${resultado.statusText}]');
      throw Exception('Erro ao buscar filmes populares');
    }

    return resultado.body ?? <FilmeModel>[];
  }

  @override
  Future<List<FilmeModel>> getFilmesTops() async {
    final resultado = await _restClient.get<List<FilmeModel>>(
      '/movie/top_rated',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
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
      print('Erro ao buscar filmes tops [${resultado.statusText}]');
      throw Exception('Erro ao buscar filmes tops');
    }

    return resultado.body ?? <FilmeModel>[];
  }
}
