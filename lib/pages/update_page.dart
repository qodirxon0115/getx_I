import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/update_controller.dart';
import 'package:getx/model/post_model.dart';

class UpdatePage extends StatefulWidget {
  static const String id = 'update_page';

  Post post;
  UpdatePage({required this.post, Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final _controller = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update post'),
      ),
      body: Obx(
            () => Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Title
                    Container(
                      height: 100,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Center(
                        child: TextField(
                          controller: _controller.titleTextEditingController(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          decoration: const InputDecoration(
                            labelText: 'Title',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    // Body
                    Container(
                      height: 300,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: TextField(
                        controller: _controller.bodyTextEditingController(),
                        style: const TextStyle(fontSize: 18),
                        maxLines: 30,
                        decoration: const InputDecoration(
                          labelText: 'Body',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        _controller.apiPostUpdate(context, widget.post);
                      },
                      child: const Text("update"),
                    ),
                  ],
                ),
              ),
            ),
            _controller.isLoading()
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}