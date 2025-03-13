import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import '../Utils/custom_widgets.dart';
import '../controller/ContactUsPageController.dart';




class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(



backgroundColor: AppColor.whitecolor,
      body: SafeArea(
        child: SingleChildScrollView(
          child:


        GetBuilder<Contactuspagecontroller>(
        init: Contactuspagecontroller(),
    builder: (s) =>

    Column(
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
                              'संपर्क करें',
        
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







               SizedBox(height: height*.4),


              _buildTextField('नाम', null, height,null,TextInputType.text,s.name_controller),


              _buildTextField('+91 मोबाइल नंबर दर्ज करें',null, height,null,TextInputType.number,s.mobileno_controller),



              _buildTextField('विषय', null, height,null,TextInputType.text,s.subject_controller),


              _buildTextField('डिस्क्रिपशन', null, height,null,TextInputType.text,s.dec_controller,maxLines: 5),






              s.isLoading.value?
              Center(
                child: CustomWidgets.showCircularIndicator1(
                    context, height * .9, AppColor.appColor),
              )
                  :
              Container(
                padding:  EdgeInsets.symmetric(horizontal: height*1, vertical: height*.2),


                alignment: Alignment.centerRight,


                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding:  EdgeInsets.symmetric(horizontal: height*1, vertical: height*.2),
                  ),
                  onPressed: () {






                 if(s.isInputValid(s.name_controller.text,s.mobileno_controller.text,s.subject_controller.text,s.dec_controller.text )){


                   s.   ContactusFun();


                   //
                   // Navigator.push(
                   //
                   //   context,
                   //   MaterialPageRoute(builder: (context) => MembershipSelectionScreen( ),
                   //
                   //     settings: RouteSettings(arguments: {"name": s.name_controller.text, "mobile": s.mobileno_controller.text,"date":s.selectedDate,"state":selectedState?.id,"District":selectedDistrict?.id,"nirvachan":s.nirvachan_controller.text,"panchayt":s.panchayt_controller.text,"village":s.village_controller.text,"pincode":s.pincode_controller.text,"address":s.address_controller.text,"selectedGender":s.selectedGender}),
                   //
                   //
                   //   ),
                   // );







                 }





                 else{


                   s. showInputError( s.name_controller.text,s.mobileno_controller.text,s.subject_controller.text,s.dec_controller.text  );




                 }















                  },
                  child:  Text(
                    'Post',
                    style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white, height * .4),




                  ),
                ),
              ),







              _buildContactDetail(
                height:height,
                icon: Icons.location_on,
                title: 'एड्रेस',
                details:
                'Plot No C-203, C Block Rd, Block C,\nSector 63, Noida,\nUttar Pradesh 201301',



              ),
              SizedBox(height: height*.4),
              _buildContactDetail(
                height:height,

                icon: Icons.email,
                title: 'ई-मेल एड्रेस',
                details: 'contact@example.com\ninfo@example.com',
              ),
              SizedBox(height: height*.4),
              _buildContactDetail(
                height:height,

                icon: Icons.phone,
                title: 'मोबाइल नंबर',
                details: '+91 9899884818\n+91 9899884818',
              ),


              SizedBox(height: height*.8),

            ],
          ),

        )
        ),
      ),
    );
  }

  // Widget _buildTextField(String hint, {int maxLines = 1}) {
  //   return TextField(
  //     maxLines: maxLines,
  //     decoration: InputDecoration(
  //       hintText: hint,
  //       hintStyle: const TextStyle(color: Colors.black54),
  //       filled: true,
  //       fillColor: Colors.grey.shade300,
  //       border: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(8),
  //         borderSide: BorderSide.none,
  //       ),
  //     ),
  //   );
  // }










  Widget _buildTextField(String hintText, IconData? icon, double height, int? textLength, TextInputType number, TextEditingController controller,{int maxLines = 1}) {
    return Container(


      height: height* 1.9,



      padding: EdgeInsets.symmetric(vertical: height * .2,horizontal:height * .2 ),
      child: TextField(

        controller: controller,
        textAlign: TextAlign.left, // Horizontal alignment
        textAlignVertical: TextAlignVertical.center,
        maxLength:  textLength != null ? textLength: null,
        cursorColor: Colors.black,
        keyboardType: number,
        style: Newtextstyle.normaNoSpacinglopenSans(Colors.black, height * .5),
        decoration: InputDecoration(

          hintText: hintText,
          hintStyle: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .5),
          prefixIcon: icon != null ? Icon(icon) : null,
          filled: true,
          fillColor: AppColor.grayColor,



          border: OutlineInputBorder(


            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }


  Widget _buildContactDetail({required IconData icon, required String title, required String details, required double height}) {
    return Container(


      padding:  EdgeInsets.all(height*.2),
      margin:  EdgeInsets.symmetric(horizontal: height*1),

      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 24, color: Colors.black),


          SizedBox(width: height*.4),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black, height * .5),
                ),


                SizedBox(height: height*.4),

                Text(details,


                  style: Newtextstyle.normaNoSpacinglopenSans(Colors.black54, height * .4),



                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
