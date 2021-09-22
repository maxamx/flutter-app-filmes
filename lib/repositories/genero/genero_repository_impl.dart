import 'package:app_filmes/applications/rest_client/rest_client.dart';
import 'package:app_filmes/models/genero_modelo.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './genero_repository.dart';

class GeneroRepositoryImpl implements GeneroRepository {
  final RestClient _restClient;

  GeneroRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<GeneroModelo>> getGenero() async {
    final result = await _restClient
        .get<List<GeneroModelo>>('/genre/movie/list', query: {
      'api_key': RemoteConfig.instance.getString('api_token'),
      'language': 'pt-br'
    }, decoder: (data) {
      final resultData = data['genres'];
      if (resultData != null) {
        return resultData
            .map<GeneroModelo>((g) => GeneroModelo.fromMap(g))
            .toList();
      }
      return <GeneroModelo>[];
    });

    if (result.hasError) {
      print(result.statusText);
      throw Exception('Error ao buscar Generos');
    }

    return result.body ?? <GeneroModelo>[];
  }
}
