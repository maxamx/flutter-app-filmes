import 'package:app_filmes/applications/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/genero_modelo.dart';
import 'package:app_filmes/services/genero/genero_service.dart';
import 'package:get/get.dart';

class FilmesController extends GetxController with MessagesMixin {
  final GeneroService _generoService;
  final _message = Rxn<MessageModel>();
  final _generos = <GeneroModelo>[].obs;

  FilmesController({required GeneroService generoService})
      : _generoService = generoService;

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
      final generos = await _generoService.getGenero();
      _generos.assignAll(generos);
    } catch (e) {
      _message(MessageModel.error(
          title: 'Error', message: 'Error ao buscar Generos'));
    }
  }
}
