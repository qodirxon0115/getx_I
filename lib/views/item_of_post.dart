import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:getx/controller/home_controller.dart';
import 'package:getx/model/post_model.dart';

Widget itemOfPost(HomeController viewModel, Post post, Post item){
  return Slidable(
      startActionPane: ActionPane(
        motion:const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){},
        ),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){},
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: "Update",
          )
        ],
      ),
      endActionPane: ActionPane(
        motion:const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: (){},
        ),
        children: [
          SlidableAction(
            onPressed: (BuildContext context){
              viewModel.apiPostDelete(post).then((value) => {
                if(value) viewModel.apiPostList(),
              });
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title.toUpperCase()),
            const SizedBox(height: 5,),
            Text(post.body),
          ],
        ),
      )
  );
}