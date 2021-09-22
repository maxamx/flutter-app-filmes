import 'package:app_filmes/modules/filmes/filmes_controller.dart';
import 'package:app_filmes/repositories/genero/genero_repository.dart';
import 'package:app_filmes/repositories/genero/genero_repository_impl.dart';
import 'package:app_filmes/services/genero/genero_service.dart';
import 'package:app_filmes/services/genero/genero_service_impl.dart';
import 'package:get/get.dart';

class FilmesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeneroRepository>(
      () => GeneroRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut<GeneroService>(
      () => GeneroServiceImpl(generoRepository: Get.find()),
    );

    Get.lazyPut(() => FilmesController(generoService: Get.find()));
  }
}
