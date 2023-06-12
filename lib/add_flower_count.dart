import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_tut/store_controller.dart';

class AddFlowerCount extends StatelessWidget {
   AddFlowerCount({super.key});

final storeController=Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(


            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
        storeController.updateFlowerCount();
      },child: const Icon(Icons.add),),
            const Text('You have add these many flowers to your store!'),
            const SizedBox(height: 40,),
            Obx(()=>Text(storeController.flowerCount.value.toString(),style: TextStyle(fontSize: 48),))
          ]),
        ),
      );
  }
}