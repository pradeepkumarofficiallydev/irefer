import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jsp/controller/SamanyaBaithakController.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';

class SamanyaBaithakScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {





    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio


    return Scaffold(
      backgroundColor: AppColor.whitecolor,

      body: SafeArea(
        child: SingleChildScrollView(
          child:

        GetBuilder<Samanyabaithakcontroller>(
        init: Samanyabaithakcontroller(),
    builder: (s) =>


    Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              'सामान्य बैठक',
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



              s.  imageFile == null ?

              // Upload Photo Section
              GestureDetector(




                  onTap: () async {

                    Map<Permission, PermissionStatus> statuses =
                    await [Permission.camera, Permission.photos]
                      .request();
                  if (statuses[Permission.photos]!.isGranted &&
                  statuses[Permission.camera]!.isGranted) {
                  s. showImagePicker(context,height);
                  } else {
                  print('no permission provided');
                  }
                  s.showImagePicker(context,height);














                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  height * 2,vertical: height * 1, ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange,width: 4),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding:  EdgeInsets.all(height * .5,),
                    child: Column(
                      children: [
                       Image.asset("assets/images/addition.png",height: height * 2,),

                        SizedBox(height: height * 1),




                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'सामान्य बैठक',
                            style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.7),
                            textAlign: TextAlign.start,
                          ),
                        ),




                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'की फोटो अपलोड करें',
                            style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.6),
                            textAlign: TextAlign.start,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ):




              Container(

                padding: EdgeInsets.symmetric(vertical: height*.2,horizontal:height*.2 ),
                //  width: 120,
                height: height*3,

                //   color: Colors.red,

                alignment: Alignment.center,

                child: Stack(

                  alignment: Alignment.topRight

                  ,

                  children: [




                    Container(
                      alignment: Alignment.center,


                      width: height*3,
                      height: height*3,

                      child:



                      Image.file(
                        s.imageFile!,
                        fit: BoxFit.fill,
                        width: height*3,
                        height: height*3,

                      ),
                    ),





                    InkWell(

                        onTap: ()

                        {

                            s. imageFile=null;


                          s.update();

                          // setState(() {
                          //   s. imageFile=null;
                          // });\


                        },


                        child: Icon(Icons.close,color: Colors.black,)),


                  ],
                ),
              ),











              SizedBox(height: height * .5),


              Padding(
                padding:  EdgeInsets.all( height * .3),
                child: Column(



                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    // const TextField(
                    //   decoration: InputDecoration(
                    //     hintText: 'मुद्दा',
                    //     border: OutlineInputBorder(),
                    //     contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    //   ),
                    // ),




















           Container(


      height: height* 1.9,




      padding: EdgeInsets.symmetric(vertical: height * .1),
      child: TextField(

        controller: s.controller,
        textAlign: TextAlign.left, // Horizontal alignment
        textAlignVertical: TextAlignVertical.center,
   //     maxLength:  textLength != null ? textLength: null,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        style: Newtextstyle.normaNoSpacinglopenSans(Colors.black, height * .5),
        decoration: InputDecoration(

          hintText: "मुद्दा",
          hintStyle: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .5),
        //  prefixIcon: icon != null ? Icon(icon) : null,
          filled: true,
          fillColor: AppColor.grayColor,



          border: OutlineInputBorder(


            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),



                    Container(


                    //  height: height* 45,




                      padding: EdgeInsets.symmetric(vertical: height * .1),
                      child: TextField(
                        maxLines: 5,

                        controller: s.controller1,
                        textAlign: TextAlign.left, // Horizontal alignment
                        textAlignVertical: TextAlignVertical.center,
                        //     maxLength:  textLength != null ? textLength: null,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        style: Newtextstyle.normaNoSpacinglopenSans(Colors.black, height * .5),
                        decoration: InputDecoration(

                          hintText: "लिखिए",
                          hintStyle: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .5),
                          //  prefixIcon: icon != null ? Icon(icon) : null,
                          filled: true,
                          fillColor: AppColor.grayColor,



                          border: OutlineInputBorder(


                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),


                    // Likhein TextField

                    // Images Section
                    // GridView.count(
                    //   shrinkWrap: true,
                    //   crossAxisCount: 2,
                    //   crossAxisSpacing: 8.0,
                    //   mainAxisSpacing: 8.0,
                    //   children: [
                    //     // Dummy images (Replace with actual image widgets)
                    //     Image.asset('assets/image1.png', fit: BoxFit.cover),
                    //     Image.asset('assets/image2.png', fit: BoxFit.cover),
                    //   ],
                    // ),
                    //
                    //



                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(), // Disables scrolling


                        shrinkWrap: true,


                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two columns in the grid
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 3 / 4, // Adjust aspect ratio
                        ),

                        itemCount: (s.samanyabaithakListResponse.value.data?.length??0) > 2 ? 2 : s.samanyabaithakListResponse.value.data?.length??0,

                     //   data.length > 2 ? 2 :
                      //  itemCount: s.samanyabaithakListResponse.value.data?.length??0>2?2,
                        itemBuilder: (context, index) {
                          final item =  s.samanyabaithakListResponse.value.data?[index];
                          return GridTile(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange, width: 2),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  // Image
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8.0),
                                        topRight: Radius.circular(8.0),
                                      ),
                                      child: Image.network(
                                        item?.image??"", // Image URL
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  // Title
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      item?.title??"",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  // Description
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      item?.description??"",
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),








                    const SizedBox(height: 16.0),

                    // Post Button
                    ElevatedButton(
                      onPressed: () {


                        if (s.imageFile == null) {
                        s.  showToastBar("Please select an image first!");
                        }

                        else   if (s.controller.text.isEmpty) {
                         s. showToastBar("Please enter a मुद्दा.");
                        }




                        else   if (s.controller1.text.isEmpty) {
                         s. showToastBar("Please enter the some text in लिखिए field");
                        }

                        else
                          {

                            s.uploadImage();



                          }






                        // Handle post action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child:  Text(
                        'Post',
                        style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.5),
                      ),
                    ),


                  ],
                ),
              )
              // Muddha TextField

            ],
          ),
        ),
      ),

      )

    );
  }
}
