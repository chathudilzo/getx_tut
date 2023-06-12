import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StoreController extends GetxController{
  final storeName='Thick Shake'.obs;
  final flowerCount=0.obs;
  final storeStatus=true.obs;
  final flowerList=[].obs;
  //final reviews=<StoreReviews>[].obs;

  final storeNameEditingController=TextEditingController();
  final reviewEditingController=TextEditingController();
  final followerController=TextEditingController();
  final reviewNameController=TextEditingController();

  updateStoreName(String name){
    storeName(name);
  }

  updateFlowerCount(){
    flowerCount(flowerCount.value+1);
  }

  void storeStatusOpen(bool isOpen){
    storeStatus(isOpen);
  }

}