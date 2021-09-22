import 'package:app_filmes/models/genero_modelo.dart';
import 'package:app_filmes/repositories/genero/genero_repository.dart';

abstract class GeneroService {
  Future<List<GeneroModelo>> getGenero();
}
