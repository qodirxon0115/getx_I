import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/model/post_model.dart';
import 'package:getx/services/http_service.dart';

class UpdateController extends GetxController {
  var isLoading = false.obs;
  var titleTextEditingController = TextEditingController().obs;
  var bodyTextEditingController = TextEditingController().obs;
  final _homeController = Get.put(HomeController());

  apiPostUpdate(BuildContext context, Post post) async {
    isLoading(true);

    var response = await Network.PUT(
        Network.BASE + Network.API_UPDATE + post.id.toString(),
        Network.paramsUpdate(Post(
            userId: post.userId,
            id: post.id,
            title: titleTextEditingController().text,
            body: bodyTextEditingController().text)));

    if (response != null) {
      Navigator.of(context).pop();
      _homeController.apiPostList();
    }

    isLoading(false);
  }
}