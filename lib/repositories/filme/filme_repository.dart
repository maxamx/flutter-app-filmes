import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:app_filmes/models/filme_model.dart';

abstract class FilmeRepository {
  Future<List<FilmeModel>> getFilmesPopulares();
  Future<List<FilmeModel>> getFilmesTops();
  Future<FilmeDetalheModelo?> getFilmeDetalhe(int id);
  Future<void> adicionaOuRemoveFavorito(String userId, FilmeModel filmeModel);
  Future<List<FilmeModel>> getFilmesFavoritos(String userId);
}
