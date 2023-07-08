

import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';

class DIService{
  static Future<void> init() async {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}