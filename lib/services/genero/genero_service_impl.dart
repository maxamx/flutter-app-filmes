import 'package:app_filmes/models/genero_modelo.dart';
import 'package:app_filmes/repositories/genero/genero_repository.dart';

import './genero_service.dart';

class GeneroServiceImpl implements GeneroService {
  final GeneroRepository _generoRepository;

  GeneroServiceImpl({required GeneroRepository generoRepository})
      : _generoRepository = generoRepository;

  @override
  Future<List<GeneroModelo>> getGenero() => _generoRepository.getGenero();
}
