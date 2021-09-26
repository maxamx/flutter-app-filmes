import 'package:app_filmes/applications/rest_client/rest_client.dart';
import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:app_filmes/models/filme_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
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

  @override
  Future<FilmeDetalheModelo?> getFilmeDetalhe(int id) async {
    final resultado = await _restClient.get<FilmeDetalheModelo?>(
      '/movie/$id',
      query: {
        'api_key': RemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'append_to_response': 'images,credits',
        'include_image_language': 'en,pt-br'
      },
      decoder: (data) {
        return FilmeDetalheModelo.fromMap(data);
      },
    );
    if (resultado.hasError) {
      print('Erro ao buscar detalhe do filme [${resultado.statusText}]');
      throw Exception('Erro ao buscar detalhe do filme [$id]');
    }

    return resultado.body;
  }

  @override
  Future<void> adicionaOuRemoveFavorito(
      String userId, FilmeModel filmeModel) async {
    try {
      var favoritoColecao = FirebaseFirestore.instance
          .collection('favoritos')
          .doc(userId)
          .collection('filmes');

      if (filmeModel.favorito) {
        favoritoColecao.add(filmeModel.toMap());
      } else {
        var favoritoData = await favoritoColecao
            .where('id', isEqualTo: filmeModel.id)
            .limit(1)
            .get();
        favoritoData.docs.first.reference.delete();
      }
    } catch (e) {
      print('Erro ao favoritar um filme');
      rethrow;
    }
  }
}
