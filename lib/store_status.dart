import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_tut/store_controller.dart';

class StoreStatus extends StatelessWidget {
   StoreStatus({super.key});

final storeController=Get.find<StoreController>();


  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Is The Store Open?',style: TextStyle(fontSize: 22),),
              SizedBox(height: 16,),
              Obx(()=>Switch(onChanged: (value) => storeController.storeStatus(value),
              activeColor: Colors.green,value: storeController.storeStatus.value,))
            ],
          ),
        )
    );
      
    
  }
}