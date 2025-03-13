import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import 'PosterCreationScreen.dart';

class PosterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio



    return Scaffold(
      // appBar:
      //
      //
      // AppBar(
      //   backgroundColor: Colors.orange,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back, color: Colors.black),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Text(
      //     "पोस्टर बनाएं",
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.orange,
      //   child: Icon(Icons.add, color: Colors.white),
      //   onPressed: () {
      //     // Add functionality
      //   },
      // ),




      body: SafeArea(
        child: Column(
        
        
        
        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
        
        
        
        
        
            Container(
              padding:  EdgeInsets.symmetric(horizontal: height * .2 , vertical: height * .7),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
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

                          margin: EdgeInsets.only(right: height*2),
                          alignment: Alignment.center,
                          child: Text(
                            'पोस्टर बनाएं',
        
                            style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.7),
                            textAlign: TextAlign.start,
                          ),
                        ),
        
        
        
        
        
        
        
        
        
                        GestureDetector(
                          onTap: ()
                          {
        
        
        
        
                            Get.to(PosterCreationScreen());
        
                          },
                          child: Container(
                            height: height*1,
                            alignment: Alignment.center,
                            child: Image.asset(
        
                          "assets/images/addition.png"
        
        
                          ),
                          ),
                        )
        
        
                      ],
                    ),
                  ),
        
        
        
        
        
        
        
        
        
        
        
              //    SizedBox(height: height * .4),
                ],
              ),
            ),
        
        
        
        
        
        
            // Category Chips Section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: height*.2, vertical: height*.2),
              child: Row(
                children: [
                  _buildCategoryChip("सभी",height),
                  _buildCategoryChip("रक्षाबंधन",height),
                  _buildCategoryChip("राजनीतिक",height),
                  _buildCategoryChip("धार्मिक",height),
                  _buildCategoryChip("प्रेरक",height),
                  _buildCategoryChip("होली",height),
                  _buildCategoryChip("दीपावली",height),
                ],
              ),
            ),
            // Poster Grid Section
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 4, // Change as per data
                itemBuilder: (context, index) {
                  return _buildPosterCard(height);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Category Chip Builder
  Widget _buildCategoryChip(String label, double height) {
    return Padding(
      padding:  EdgeInsets.only(right: height*.2),
      child: Chip(
        label: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange[100],
      ),
    );
  }

  // Poster Card Builder
  Widget _buildPosterCard(double height) {
    return Container(



      height: height*9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange, width: 1),
      ),
      child: Stack(
       // crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,



        children: [
          // Image Section
          Container(


            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Container(

                height: height*4.5,
                  child: Image.asset("assets/images/first_image.jpg",fit: BoxFit.fill,))


              // network(
              //   "https://via.placeholder.com/150",
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              // ),





            ),
          ),
          // Text Section
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         "श्री सोनू सिंह",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //           fontSize: 14,
          //         ),
          //       ),
          //       SizedBox(height: 4),
          //       Text(
          //         "जन सहमति पार्टी",
          //         style: TextStyle(fontSize: 12),
          //       ),
          //     ],
          //   ),
          // ),



          Positioned(
            top: height*1.3,
            left: height*2.5,

            child:

            Image.asset("assets/images/kunal.png",fit: BoxFit.fill,height: height*3.4,)

          ),

          // Action Buttons
          Positioned(
            top: height*4.5,

            child: Container(

             // margin: EdgeInsets.only(bottom: 40),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  IconButton(
                    icon: Icon(Icons.download, color: Colors.green),
                    onPressed: () {
                      // Download action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.share, color: Colors.blue),
                    onPressed: () {
                      // Share action
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {


                      Get.to(PosterCreationScreen());



                      // Edit action
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
