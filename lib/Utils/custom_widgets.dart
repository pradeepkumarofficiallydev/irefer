import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:jsp/Utils/AppColors.dart';


enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class CustomWidgets {
  static Widget addressWidget(BuildContext context) {
    return InkWell(
      onTap: () {
        //Navigator.pushNamed(context, "/success");
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2,color: Colors.purple),
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Default Address",
                style: TextStyle(fontSize: 10),
              ),
              Radio(
                activeColor: Colors.purple,
                  value: "radio value",
                  groupValue: "group value",

                  onChanged: (value) {
                    print(value); //selected value
                  })
            ]),
            Text(
              "Address Primary",
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            ),
            Text(
              "City",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "State, Pincode",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "Phone Number",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(color: Colors.black)
              ),
              child: Text(
                "Deliever to this address",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Edit address",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black)
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Delete address",
                            style: TextStyle(color: Colors.black),
                          ),
                        )))
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget productSumWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),  color: Color(0xffC8E900),),
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "assets/images/test.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Brand"),
                Text("Product Name"),
                SizedBox(
                  height: 10,
                ),
                Text("Brand"),
                Text(
                  "Product Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, "/address_list");
                }, child: Text(
                  "Place Request",),
               style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                 backgroundColor: Colors.purple,
                 elevation: 5,
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                )),
                Text("*Discalimer*"),
              ],
            ),
          )),
        ],
      ),
    );
  }



  static void showCircularIndicator(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        useRootNavigator: false,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (BuildContext dialogContext) {
    //     Future.delayed(Duration(milliseconds: 1000), () {
    //       if (Navigator.of(dialogContext).canPop()) {
    //         Navigator.of(dialogContext).pop();
    //       }
    //     });
    //
    //     return Dialog(
    //       backgroundColor: Colors.black12,
    //       insetPadding: EdgeInsets.zero,
    //       child: Container(
    //         width: double.infinity,
    //         height: double.infinity,
    //         child: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       ),
    //     );
    //   },
    // );

    // Navigator.pushNamed(context, "/loading_page");

  }











  static Widget showCircularIndicator1(BuildContext context,double height, Color appColor,) {
    //
    // double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    // double height = width * 0.4; // Maintain aspect ratio


    return Container(
      //color: Colors.red,



        height: height,
        width: height,

        child:

         Center(

          child: CircularProgressIndicator(

            color: appColor,

            strokeWidth: 3,

          ),
        )
    );
  }

}







class CustomDropdown extends StatefulWidget {
  final List<String> items; // List of items to display in the dropdown
  final String hintText; // Placeholder text
  final ValueChanged<String> onItemSelected; // Callback when an item is selected
  final double dropdownHeight; // Height of the dropdown menu
  final TextStyle? textStyle; // Text style for selected item
  final BoxDecoration? dropdownDecoration; // Decoration for dropdown menu
  final BoxDecoration? buttonDecoration; // Decoration for dropdown button

  const CustomDropdown({
    Key? key,
    required this.items,
    required this.hintText,
    required this.onItemSelected,
    this.dropdownHeight = 200,
    this.textStyle,
    this.dropdownDecoration,
    this.buttonDecoration,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with SingleTickerProviderStateMixin {
  String? selectedValue;
  bool isDropdownOpen = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );



    WidgetsBinding.instance.addPostFrameCallback((_) {

      if (widget.hintText.isNotEmpty) {

        widget.onItemSelected(widget.hintText!); // Notify parent about the default selection
      }


    });





  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleDropdown() {
    if (isDropdownOpen) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: widget.buttonDecoration ??




                BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(

                  child: Text(
                    overflow: TextOverflow.ellipsis,


                    '${selectedValue ?? widget.hintText}',

                    style: widget.textStyle ??
                        const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Icon(
                  isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.blue,

                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animationController,
          axisAlignment: -1.0,
          child: Container(
            height: widget.dropdownHeight,
            decoration: widget.dropdownDecoration ??
                BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
            child: ListView.builder(

              itemCount: widget.items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedValue = widget.items[index];
                      isDropdownOpen = false;
                      _animationController.reverse();
                    });
                    widget.onItemSelected(widget.items[index]);
                  },
                  child: Container(


                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: index == widget.items.length - 1
                              ? Colors.transparent
                              : Colors.grey[300]!,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(

                      widget.items[index],
                      style: widget.textStyle ??
                          const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

