import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tut/add_flower_count.dart';
import 'package:getx_tut/store_controller.dart';
import 'package:getx_tut/store_status.dart';
import 'package:getx_tut/theme.dart';
import 'package:getx_tut/theme_controller.dart';
import 'package:getx_tut/update_store_name.dart';

void main() {
 Get.put(StoreController());
 Get.put(ThemeController());
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

final themeController=Get.find<ThemeController>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx',
      theme:Themes.lightTheme,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
final storeController=Get.find<StoreController>();
final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.cyanAccent,

      appBar: AppBar(
        
        title: Text('GetX Store'),
        actions: [
IconButton(
           onPressed: () {
             if (Get.isDarkMode) {
               themeController.changeTheme(Themes.lightTheme);
               themeController.saveTheme(false);
             } else {
               themeController.changeTheme(Themes.darkTheme);
               themeController.saveTheme(true); }},
           icon: Get.isDarkMode
               ? const Icon(Icons.light_mode_outlined)
               : const Icon(Icons.dark_mode_outlined),)
        ],
      ),
      body:Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(child: Column(
          children: [
            Text('Store Info'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(child: Text('Store Name',style: TextStyle(fontSize: 20),),fit: FlexFit.tight,),
                const SizedBox(width: 20,),
                Obx(()=>Flexible(child: Text(storeController.storeName.value.toString(),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),fit: FlexFit.tight,))
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(child: Text('Store Flowers',style: TextStyle(fontSize: 20),),fit: FlexFit.tight,)
                ,SizedBox(width: 20,),
                Obx(()=>Flexible(child: Text(storeController.flowerCount.value.toString(),textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),fit: FlexFit.tight,))
              ],
            ),const SizedBox(height: 20,),Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(child: Text('status',style: TextStyle(fontSize: 20),),fit: FlexFit.tight,),
                SizedBox(width: 20,),
                Obx(()=>Flexible(child: Text(storeController.storeStatus.value?'open':'Closed',textAlign: TextAlign.start,style: TextStyle(color: storeController.storeStatus.value?Colors.green:Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),fit: FlexFit.tight,))
              ],
            ),

            Container(
              child:
              UpdateStoreName()
            ),
            Container(
              child: StoreStatus(),
            ),
             Container(
              child: AddFlowerCount(),
            )
          ],
        )),
      )

    );
  }
}
