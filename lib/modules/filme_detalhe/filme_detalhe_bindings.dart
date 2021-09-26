import 'package:get/get.dart';
import './filme_detalhe_controller.dart';

class FilmeDetalheBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(FilmeDetalheController(filmeService: Get.find()));
  }
}
