import 'package:app_filmes/applications/ui/loader/loader_mixin.dart';
import 'package:app_filmes/applications/ui/messages/messages_mixin.dart';
import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:app_filmes/services/filme/filme_service.dart';
import 'package:get/get.dart';

class FilmeDetalheController extends GetxController
    with LoaderMixin, MessagesMixin {
  final FilmeService _filmeService;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var filmeDetalhe = Rxn<FilmeDetalheModelo>();

  FilmeDetalheController({required FilmeService filmeService})
      : _filmeService = filmeService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  @override
  void onReady() async {
    super.onReady();
    try {
      final filmeId = Get.arguments;
      loading(true);
      final filmeDetalheData = await _filmeService.getFilmeDetalhe(filmeId);
      filmeDetalhe.value = filmeDetalheData;
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Erro', message: 'Erro ao buscar detalhe do filme'));
    }
  }
}
