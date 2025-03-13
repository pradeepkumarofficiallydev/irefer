import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart' as http;
import 'package:jsp/Utils/AppColors.dart';

import '../Utils/NewTextstyle.dart';
import '../controller/TaskListScreenController.dart';
import 'AgendaSingleDataScreen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio



    return Scaffold(


      body:

    SafeArea(
      child: SingleChildScrollView(


        child: Column(
          children: [
        
        
        
        
        
        
        
        
        
        
        
            Container(
              padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
              decoration:  BoxDecoration(
                color: AppColor.appColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(height*1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //SizedBox(height: height * 1.2,width: height * .2 ,),
        
        
        
        
        
                  Container(
        
                    padding: EdgeInsets.symmetric(horizontal: height*.2),
        
        
                    child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
        
                      children: [
        
        
        
        
                        GestureDetector(onTap: (){
        
                          Get.back();
        
        
        
        
        
        
                        },
        
        
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(Icons.arrow_back_ios_rounded)
        
        
        
        
        
        
        
        
                          ),
                        ),
        
                        SizedBox(width: height * 1),
        
        
        
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'कार्यसूची',
        
                            style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
                            textAlign: TextAlign.start,
                          ),
                        ),
        
        
        
        
        
        
        
                        //
                        //
                        // GestureDetector(
                        //   onTap: ()
                        //   {
                        //
                        //
                        //
                        //
                        //     Get.to(PosterCreationScreen());
                        //
                        //   },
                        //   child: Container(
                        //     height: height*1,
                        //     alignment: Alignment.center,
                        //     child: Image.asset(
                        //
                        //         "assets/images/addition.png"
                        //
                        //
                        //     ),
                        //   ),
                        // )
        
        
                      ],
                    ),
                  ),
        
        
        
        
        
        
        
        
        
        
        
                  //    SizedBox(height: height * .4),
                ],
              ),
            ),
        
        
        
        
            GetBuilder<AgendaScreenController>(
            init: AgendaScreenController(),
            builder: (s) =>
        
        
        
        
        
              s.  isLoading.value?
                   Center(child: CircularProgressIndicator())
                  : ListView.builder(
                shrinkWrap: true,

                physics: NeverScrollableScrollPhysics(), // Disables scrolling

                padding: EdgeInsets.all(16),
                itemCount: s.getTaskListRespnse.value.data?.length??0,
                itemBuilder: (context, index) {
                  final task = s.getTaskListRespnse.value.data?[index];
        
                  return GestureDetector(
                    onTap: ()
                    {
        
        
        
                      Get.to(Agendasingledatascreen(data: task,));
        
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${index + 1}.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                         SizedBox(width: height * .5),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        task?.image??"",
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            task?.title??"",
                                            style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.6),
        
                                          ),
                                          SizedBox(width: height * .5),
                                          Text(
                                            task?.description??"",
                                            style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.38),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ),
          ],
        ),
      ),
    )
    );

  }
}

