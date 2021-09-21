import 'package:app_filmes/applications/ui/loader/loader_mixin.dart';
import 'package:app_filmes/applications/ui/messages/messages_mixin.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(loading);
    messageListener(message);
  }

  Future<void> login() async {
    loading(true);
    await 2.seconds.delay();
    // await Future.delayed(Duration(seconds: 2));
    loading(false);
    message(MessageModel.error(
        title: 'Titulo de error', message: 'Messagem de error'));
    await 2.seconds.delay();
    message(MessageModel.info(
        title: 'Titulo de info', message: 'Messagem de info'));
  }
}
