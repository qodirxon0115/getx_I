import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/model/post_model.dart';
import 'package:getx/services/http_service.dart';

class CreateController extends GetxController {
  var isLoading = false.obs;
  var titleTextEditingController = TextEditingController().obs;
  var bodyTextEditingController = TextEditingController().obs;
  final _homeController = Get.put(HomeController());

  apiPostCreate(BuildContext context)  async {
    isLoading(true);

    Post post = Post(title: titleTextEditingController().text, body: bodyTextEditingController().text, userId:1, id: 1);

    var response = await Network.POST(Network.BASE + Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      Navigator.of(context).pop();
      _homeController.apiPostList();
      titleTextEditingController().text = '';
      bodyTextEditingController().text = '';

    }

    isLoading(false);
  }
}