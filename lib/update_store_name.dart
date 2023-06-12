import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_tut/store_controller.dart';

class UpdateStoreName extends StatelessWidget {
   UpdateStoreName({super.key});
  final storeController=Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: storeController.storeNameEditingController,
          decoration: InputDecoration(
            hintText: 'Srore Name',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(onPressed: (){
          storeController.updateStoreName(storeController.storeNameEditingController.text);
          Get.snackbar('Success', 'Store Name Has Been Updated to ${storeController.storeNameEditingController.text}');
        }, child: const Padding(padding: EdgeInsets.all(10),child: Text('Update',style: TextStyle(fontSize: 20),),))
      ],
    );
  }
}