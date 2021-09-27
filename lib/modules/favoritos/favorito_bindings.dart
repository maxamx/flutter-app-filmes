import 'package:app_filmes/modules/favoritos/favorito_controller.dart';
import 'package:get/get.dart';

class FavoritoBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      FavoritoController(
        authService: Get.find(),
        filmeService: Get.find(),
      ),
    );
  }
}
