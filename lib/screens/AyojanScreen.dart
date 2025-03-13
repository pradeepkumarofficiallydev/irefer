import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';

class AyojanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;
    return Scaffold(


      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   title: Text(
      //     'आयोजन',
      //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      //   ),
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),



      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        
        
        
        
              Container(
                padding:  EdgeInsets.symmetric( vertical: height * .5),
                margin:  EdgeInsets.only( bottom: height * .7),
        
        
                decoration:  BoxDecoration(
                  color: AppColor.appColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(height*1.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //SizedBox(height: height * 1.2,width: height * .2 ,),
        
        
        
        
        
                    Container(
        
                      padding: EdgeInsets.symmetric(horizontal: height*.4),
        
        
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
        
        
        
        
        
        
                          Container(
        
                            margin: EdgeInsets.only(left: height*1.5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'आयोजन',
        
                              style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
                              textAlign: TextAlign.start,
                            ),
                          ),
        
        
        
        
                        ],
                      ),
                    ),
        
        
        
        
        
        
        
        
        
        
        
                    //    SizedBox(height: height * .4),
                  ],
                ),
              ),
        
        
        
        
        
        
        
        
        
        
        
              // Upcoming Events Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      'आगामी कार्यक्रम',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    // Carousel Slider
                    Container(
                      height: 200,
                      child: PageView(
                        children: [
                          Image.asset('assets/images/Screenshot 2024-12-26 235328.png', fit: BoxFit.cover),
                          Image.asset('assets/images/Screenshot 2024-12-26 235328.png', fit: BoxFit.cover),
                          Image.asset('assets/images/Screenshot 2024-12-26 235328.png', fit: BoxFit.cover),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // Past Events Section
                    Text(
                      'पूर्व कार्यक्रम',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    // Grid of Posters
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: 4, // Number of posters
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.orange, width: 2),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/Screenshot 2024-12-27 000329.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'श्री सोनू सिंह',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
        
        
        
        
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}

