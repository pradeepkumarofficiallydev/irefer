
import 'package:get/get.dart';
import 'package:jsp/screens/MyLeadsScreen.dart';

import '../screens/DashboardScreen.dart';

class TabsController extends GetxController {

  String checkIndex = Get.arguments?['coming_from']??"";

  RxInt index = 0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


  }



  getPage(int page) {
    switch (page) {
      case 0:
        return DashboardScreen();
      case 1:
        return MyLeadsscreen();
    }
  }


}
