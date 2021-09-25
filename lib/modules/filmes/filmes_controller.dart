import 'package:app_filmes/applications/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/filme_model.dart';
import 'package:app_filmes/models/genero_modelo.dart';
import 'package:app_filmes/services/filme/filme_service.dart';
import 'package:app_filmes/services/genero/genero_service.dart';
import 'package:get/get.dart';

class FilmesController extends GetxController with MessagesMixin {
  final FilmeService _filmeService;
  final GeneroService _generoService;
  final _message = Rxn<MessageModel>();
  final _generos = <GeneroModelo>[].obs;

  final filmesPopulares = <FilmeModel>[].obs;
  final filmesTops = <FilmeModel>[].obs;

  var _filmesPopularesOriginal = <FilmeModel>[];
  var _filmesTopsOriginal = <FilmeModel>[];

  final generoSelecionado = Rxn<GeneroModelo>();

  FilmesController({
    required GeneroService generoService,
    required FilmeService filmeService,
  })  : _generoService = generoService,
        _filmeService = filmeService;

  List<GeneroModelo> get generos => _generos.toList();

  @override
  void onInit() {
    super.onInit();
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final generosData = await _generoService.getGenero();

      _generos.assignAll(generosData);

      final filmesPopularesData = await _filmeService.getFilmesPopulares();

      final filmesTopsData = await _filmeService.getFilmesTops();

      filmesPopulares.assignAll(filmesPopularesData);
      _filmesPopularesOriginal = filmesPopularesData;

      filmesTops.assignAll(filmesTopsData);
      _filmesTopsOriginal = filmesTopsData;
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Error',
          message: 'Error ao carregar dados de genero ou filmes'));
    }
  }

  void filterByName(String titulo) {
    if (titulo.isNotEmpty) {
      var novaFilmesPopulares = _filmesPopularesOriginal.where((filme) {
        return filme.titulo.toLowerCase().contains(titulo.toLowerCase());
      });

      var novaFilmesTops = _filmesTopsOriginal.where((filme) {
        return filme.titulo.toLowerCase().contains(titulo.toLowerCase());
      });

      filmesPopulares.assignAll(novaFilmesPopulares);
      filmesTops.assignAll(novaFilmesTops);
    } else {
      filmesPopulares.assignAll(_filmesPopularesOriginal);
      filmesTops.assignAll(_filmesTopsOriginal);
    }
  }

  void filtroFilmesPorGenero(GeneroModelo? generoModelo) {
    var generoFiltro = generoModelo;

    if (generoFiltro?.id == generoSelecionado.value?.id) {
      generoFiltro = null;
    }

    generoSelecionado.value = generoFiltro;

    if (generoFiltro != null) {
      var novaFilmesPopulares = _filmesPopularesOriginal.where((filme) {
        return filme.generos.contains(generoFiltro?.id);
      });

      var novaFilmesTops = _filmesTopsOriginal.where((filme) {
        return filme.generos.contains(generoFiltro?.id);
      });

      filmesPopulares.assignAll(novaFilmesPopulares);
      filmesTops.assignAll(novaFilmesTops);
    } else {
      filmesPopulares.assignAll(_filmesPopularesOriginal);
      filmesTops.assignAll(_filmesTopsOriginal);
    }
  }
}
