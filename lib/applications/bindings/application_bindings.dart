import 'package:app_filmes/applications/auth/auth_service.dart';
import 'package:app_filmes/applications/rest_client/rest_client.dart';
import 'package:app_filmes/repositories/login/login_repository.dart';
import 'package:app_filmes/repositories/login/login_repository_impl.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:app_filmes/services/login/login_service_impl.dart';
import 'package:get/get.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    //fenix permite que a instancia do fique ativa
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
    Get.lazyPut(() => RestClient());
    Get.put(AuthService(), permanent: true).init();
  }
}
