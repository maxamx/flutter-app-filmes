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

  final _filmesPopulares = <FilmeModel>[].obs;
  final _filmesTops = <FilmeModel>[].obs;

  final _filmesPopularesOriginal = <FilmeModel>[];
  final _filmesTopsOriginal = <FilmeModel>[];

  FilmesController({
    required GeneroService generoService,
    required FilmeService filmeService,
  })  : _generoService = generoService,
        _filmeService = filmeService;

  List<GeneroModelo> get generos => _generos.toList();

  List<FilmeModel> get filmesPopulares => _filmesPopulares.toList();

  List<FilmeModel> get filmesTops => _filmesTops.toList();

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

      _filmesPopulares.assignAll(filmesPopularesData);

      _filmesTops.assignAll(filmesTopsData);
    } catch (e, s) {
      print(e);
      print(s);
      _message(MessageModel.error(
          title: 'Error',
          message: 'Error ao carregar dados de genero ou filmes'));
    }
  }
}
