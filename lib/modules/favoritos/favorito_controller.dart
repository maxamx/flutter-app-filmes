import 'package:app_filmes/models/filme_model.dart';
import 'package:get/get.dart';

import 'package:app_filmes/applications/auth/auth_service.dart';
import 'package:app_filmes/services/filme/filme_service.dart';

class FavoritoController extends GetxController {
  final FilmeService _filmeService;
  final AuthService _authService;

  var filmes = <FilmeModel>[].obs;

  FavoritoController({
    required FilmeService filmeService,
    required AuthService authService,
  })  : _filmeService = filmeService,
        _authService = authService;

  @override
  Future<void> onReady() async {
    super.onReady();
    await _getFavoritos();
  }

  Future<void> _getFavoritos() async {
    var user = _authService.user;
    if (user != null) {
      var favoritos = await _filmeService.getFilmesFavoritos(user.uid);
      filmes.assignAll(favoritos);
    }
  }

  Future<void> removeFavoritos(FilmeModel filme) async {
    var user = _authService.user;
    if (user != null) {
      await _filmeService.adicionaOuRemoveFavorito(
          user.uid, filme.copyWith(favorito: false));
      filmes.remove(filme);
    }
  }
}
