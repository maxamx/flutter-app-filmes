import 'package:app_filmes/models/filme_model.dart';
import 'package:app_filmes/repositories/filme/filme_repository.dart';

import './filme_service.dart';

class FilmeServiceImpl implements FilmeService {
  FilmeRepository _filmeRepository;

  FilmeServiceImpl({required FilmeRepository filmeRepository})
      : _filmeRepository = filmeRepository;

  @override
  Future<List<FilmeModel>> getFilmesPopulares() =>
      _filmeRepository.getFilmesPopulares();
  @override
  Future<List<FilmeModel>> getFilmesTops() => _filmeRepository.getFilmesTops();
}
