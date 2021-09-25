import 'package:app_filmes/models/genero_modelo.dart';

abstract class GeneroService {
  Future<List<GeneroModelo>> getGenero();
}
