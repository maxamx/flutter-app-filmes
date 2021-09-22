import 'package:app_filmes/models/genero_modelo.dart';

abstract class GeneroRepository {
  Future<List<GeneroModelo>> getGenero();
}
