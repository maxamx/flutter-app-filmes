import 'package:app_filmes/applications/auth/auth_service.dart';
import 'package:app_filmes/applications/ui/loader/loader_mixin.dart';
import 'package:app_filmes/applications/ui/messages/messages_mixin.dart';
import 'package:app_filmes/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final LoginService _loginService;
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  LoginController({
    required LoginService loginService,
  }) : _loginService = loginService;

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    try {
      loading(true);
      await _loginService.login();
      loading(false);
      message(MessageModel.info(
          title: 'Sucesso', message: 'Login realizado com sucesso'));
      // await Future.delayed(Duration(seconds: 2));
      await 1.seconds.delay();
      Get.offNamed('/home');
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Login Error', message: 'Error ao realizar login'));
    }
  }
}
