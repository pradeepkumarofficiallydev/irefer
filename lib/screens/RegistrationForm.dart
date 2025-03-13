
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/controller/AuthController.dart';

import '../Utils/AppColors.dart';
import '../Utils/NewTextstyle.dart';
import 'LoginScreen.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}


class _CreateAccountScreenState extends State<RegistrationForm> {














  @override
  void dispose() {


    // _nameController.dispose();
    // _mobileController.dispose();
    // _emailController.dispose();
    // _panController.dispose();
    // _addressController.dispose();
    // _pinController.dispose();
    // _referralController.dispose();
    // _gstinController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body:




      GetBuilder<Authcontroller>(
        init: Authcontroller(),
    builder: (s) =>



    Column(
        children: [


          Stack(
            children: [
              Container(
                //  color:Colors.pink,

                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child:

                  Container(
                    height: height*6,
                    // Adjust the height to fit your design

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColor.appColor, Colors.purple],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      // borderRadius: BorderRadius.vertical(
                      //   bottom: Radius.circular(30),
                      // ),
                    ),


                  ),
                ),



              ),

              Positioned(child:


              Container(

                //margin: EdgeInsets.only(top: height*.4),

                  child: Image.asset('assets/images/app_icon.png',height: 100,)),

                top: height*2.9,
                left: height*3.4,

              ),

            ],
          ),



          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: s.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            
            
            
            
                      Text('Select Organization Type',
                         // style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)



                        style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor,height*.4),

                      ),


                      Row(
                        children: [
                          Radio<String>(
                            value: 'Individual',
                            groupValue: s.selectedOrganizationType,
                            onChanged: (value) => setState(() => s.selectedOrganizationType = value),
                          ),
                          Text('Individual',
                            style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor,height*.34),

                          ),
                          Radio<String>(
                            value: 'Organization',
                            groupValue: s.selectedOrganizationType,
                            onChanged: (value) => setState(() => s.selectedOrganizationType = value),
                          ),
                          Text('Organization',

                            style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor,height*.34),

                          ),
                        ],
                      ),
                      SizedBox(height: height*.3),

                      _buildTextField(
                        controller: s.nameController,
                        label: 'Enter Name *',
                        icon: Icons.person,
                        validator: (value) => value!.isEmpty ? 'Name is required' : null,
                      ),
                      SizedBox(height: 20),


                      _buildTextField(
                        controller: s.mobileController,
                        label: 'Enter Mobile Number *',
                        icon: Icons.phone,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) return 'Mobile number is required';
                          if (value.length != 10) return 'Invalid mobile number';
                          return null;
                        },
                      ),



                      SizedBox(height: 20),
                      _buildTextField(
                        controller: s.emailController,
                        label: 'Enter Email *',
                        icon: Icons.email,
                        validator: (value) {
                          if (value!.isEmpty) return 'Email is required';
                          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'Invalid email format';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: s.panController,
                        label: 'Enter PAN Number *',
                        icon: Icons.credit_card,
                        validator: (value) => value!.isEmpty ? 'PAN is required' : null,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: s.addressController,
                        label: 'Enter Address',
                        icon: Icons.location_on,
                        maxLines: 3,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: s.pinController,
                        label: 'Enter PIN Number *',
                        icon: Icons.location_searching,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) return 'PIN is required';
                          if (value.length != 6) return 'PIN must be 6 digits';
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Profession *',

                        style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor,height*.34),


                      ),
                      DropdownButtonFormField<String>(


                     dropdownColor: AppColor.whitecolor,


                        value: s.selectedProfession,
                        decoration: InputDecoration(
                          filled: true,



                          // Make sure it's filled
                          fillColor: Color(0XFFe8f0fe),
                          border: OutlineInputBorder(),
                        //  prefixIcon: Icon(Icons.work),



                          // prefixIcon:
                          // Padding(
                          //
                          //   padding: const EdgeInsets.only( right:10),
                          //
                          //
                          //
                          //   child: Material(
                          //     elevation: 0,
                          //     color: AppColor.appColor,
                          //     shadowColor: AppColor.appColor,
                          //
                          //
                          //
                          //     borderRadius: BorderRadius.only(
                          //
                          //       //   topRight: Radius.circular(8.0),
                          //
                          //       //    bottomRight: Radius.circular(8.0),
                          //         bottomLeft: Radius.circular(8.0),
                          //
                          //         topLeft: Radius.circular(8.0)
                          //
                          //
                          //
                          //
                          //
                          //
                          //     ),
                          //
                          //
                          //
                          //
                          //
                          //     child: Icon(Icons.call, color: Colors.white),
                          //
                          //   ),
                          // ),
                          //

                          prefixIconConstraints: BoxConstraints(
                            minWidth: 60,


                            minHeight: 50,
                          ),



                          prefixIcon:

                          //Icon(icon),

                          Padding(

                            padding: const EdgeInsets.only( right:10,left: 1),



                            child: Material(
                              elevation: 0,
                              color: AppColor.appColor,
                              shadowColor: AppColor.appColor,



                              borderRadius: BorderRadius.only(

                                //   topRight: Radius.circular(8.0),

                                //    bottomRight: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(5.0),

                                  topLeft: Radius.circular(5.0)
                              ),

                              child: Icon(Icons.work, color: Colors.white),

                            ),
                          )
                        ),










                        items: s.professions.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) => setState(() => s.selectedProfession = newValue),
                        validator: (value) =>
                        value == null || value == 'Select Profession'
                            ? 'Please select profession'
                            : null,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: s.referralController,
                        label: 'Please enter Referral Code (if you have one)',
                        icon: Icons.card_giftcard,
                      ),
                      SizedBox(height: 20),
                      _buildTextField(
                        controller: s.gstinController,
                        label: 'Enter GSTIN',
                        icon: Icons.business,
                      ),
                    //  SizedBox(height: 20),
                      CheckboxListTile(
                        title: Text('I Agree to the Terms and Conditions',

                           style: Newtextstyle.normaNoSpacinglopenSans(AppColor.blackcolor,height*.34),
                        ),
                        value: s.agreeTerms,
                        onChanged: (value) => setState(() => s.agreeTerms = value ?? false),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      SizedBox(height: 30),
                      //
                      //
                      // ElevatedButton(
                      //   onPressed: _submitForm,
                      //   child: Padding(
                      //     padding: const EdgeInsets.symmetric(vertical: 15),
                      //     child: Text('CREATE ACCOUNT',
                      //         style: TextStyle(fontSize: 16, letterSpacing: 1)),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.teal.shade800,
                      //     minimumSize: Size(double.infinity, 50),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8),
                      //     ),
                      //   ),
                      // ),
                      //
                      //
                      //


                      Container(

                        width: double.infinity,
                        margin: EdgeInsetsDirectional.only(bottom: 1,top: 10),
                        child:  ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                backgroundColor:  AppColor.appColor,
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),



                            onPressed: s.submitForm,


                            child: Text("CREATE ACCOUNT",           style: Newtextstyle.normaNoSpacinglopenSans(Colors.white,height*.5),
                            )
                        ),

                      ),


                      SizedBox(height: 10),


                      // Center(
                      //   child: TextButton(
                      //     onPressed: () => Navigator.pushNamed(context, '/login'),
                      //     child: Text('Already have an account? Login',
                      //         style: TextStyle(color: Colors.teal.shade800)),
                      //   ),
                      // ),



                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),


)
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
       // labelText: label,
        hintText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 15.0,),
        fillColor: Color(0XFFe8f0fe),
        filled: true,
        prefixIcon:
        maxLines==1?

        //Icon(icon),

        Padding(
          padding: const EdgeInsets.only( right:10,left: 1),
          child: Material(
            elevation: 0,
            color: AppColor.appColor,
            shadowColor: AppColor.appColor,
            borderRadius: BorderRadius.only(

              //   topRight: Radius.circular(8.0),
              //    bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(5.0),
                topLeft: Radius.circular(5.0)
            ),
            child: Icon(icon, color: Colors.white),

          ),
        ):SizedBox(),


        prefixIconConstraints: BoxConstraints(
          minWidth: 60,
          minHeight: 50,
        ),

          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
        )
        ,
        //border: OutlineInputBorder(),
      ),
      keyboardType: keyboardType,
      validator: validator,
      maxLines: maxLines,



    );
  }




}