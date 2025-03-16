
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/AppColors.dart';
import '../controller/TabController.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}
class _TabsScreenState extends State<TabsScreen> {


  @override
  Widget build(BuildContext context) {
    TabsController tabController = Get.put(TabsController());
    return Scaffold(
      body: Obx(() => tabController.getPage(tabController.index.value)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

        },
        icon: Icon(Icons.add,color: AppColor.whitecolor,),  // Add icon
        label: Text('Create New Lead',style: TextStyle(color: AppColor.whitecolor),),  // Add text
        backgroundColor: AppColor.appColor,  // Customize color if needed
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Obx(() => Container(
        decoration: BoxDecoration(
          color: AppColor.whitecolor,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          child: BottomNavigationBar(
            backgroundColor: AppColor.greycolorShade,
            items: [
              BottomNavigationBarItem(
                icon:
                  (tabController.index.value == 0
                      ? Icon(Icons.person,color: AppColor.appColor,)
                      : Icon(Icons.person,color: AppColor.greycolor,)),


                label: "My Account",
              ),
              BottomNavigationBarItem(
                icon:
                  (tabController.index.value == 1
                      ? Icon(Icons.person,color: AppColor.appColor,)
                      : Icon(Icons.person,color: AppColor.greycolor,)),


                label: "My Leads",
              ),

            ],
            selectedLabelStyle: const TextStyle(
              color: AppColor.blackcolor,
              //fontFamily: AppFontStyleTextStrings.regular,
              fontSize: 12,
            ),
            type: BottomNavigationBarType.fixed,
            unselectedLabelStyle: const TextStyle(
              //fontFamily: AppFontStyleTextStrings.regular,
              color: AppColor.blackcolor,
              fontSize: 11,
            ),
            unselectedItemColor: AppColor.greycolor,
            selectedItemColor: AppColor.appColor,
            onTap: (i) {
              // if (i == 0) {
              //   Get.lazyPut<UserHomeController>(
              //         () => UserHomeController(),
              //   );
              // } else if (i == 1) {
              //   Get.lazyPut<UserPastAppointmentsController>(
              //         () => UserPastAppointmentsController(),
              //   );
              // }

              tabController.index.value = i;
            },
            currentIndex: tabController.index.value,
          ),
        ),
      )),
    );
  }
}
