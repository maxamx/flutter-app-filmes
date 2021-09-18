import 'package:get/get.dart';

class SplashController extends GetxController {

  
  void onReady() {
    super.onReady();
    Get.offAllNamed('/login');
  }

}