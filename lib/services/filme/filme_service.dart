import 'package:app_filmes/models/filme_model.dart';

abstract class FilmeService {
  Future<List<FilmeModel>> getFilmesPopulares();
  Future<List<FilmeModel>> getFilmesTops();
}
