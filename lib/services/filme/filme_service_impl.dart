import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:app_filmes/models/filme_model.dart';
import 'package:app_filmes/repositories/filme/filme_repository.dart';
import 'package:app_filmes/services/filme/filme_service.dart';

class FilmeServiceImpl implements FilmeService {
  FilmeRepository _filmeRepository;

  FilmeServiceImpl({required FilmeRepository filmeRepository})
      : _filmeRepository = filmeRepository;

  @override
  Future<List<FilmeModel>> getFilmesPopulares() =>
      _filmeRepository.getFilmesPopulares();
  @override
  Future<List<FilmeModel>> getFilmesTops() => _filmeRepository.getFilmesTops();

  @override
  Future<FilmeDetalheModelo?> getFilmeDetalhe(int id) =>
      _filmeRepository.getFilmeDetalhe(id);

  @override
  Future<void> adicionaOuRemoveFavorito(String userId, FilmeModel filmeModel) =>
      _filmeRepository.adicionaOuRemoveFavorito(userId, filmeModel);
}
