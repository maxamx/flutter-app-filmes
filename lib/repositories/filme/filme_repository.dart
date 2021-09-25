import 'package:app_filmes/models/filme_model.dart';

abstract class FilmeRepository {
  Future<List<FilmeModel>> getFilmesPopulares();
  Future<List<FilmeModel>> getFilmesTops();
}
