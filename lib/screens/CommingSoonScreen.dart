import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jsp/Utils/AppColors.dart';

import '../Utils/NewTextstyle.dart';

class Commingsoonscreen extends StatefulWidget {
  const Commingsoonscreen({super.key});

  @override
  State<Commingsoonscreen> createState() => _CommingsoonscreenState();
}

class _CommingsoonscreenState extends State<Commingsoonscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColor.whitecolor,
      body:
      SafeArea(
        child: Text("Coming Soon!",                        style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,50),
        ),
      ),

    );
  }
}
