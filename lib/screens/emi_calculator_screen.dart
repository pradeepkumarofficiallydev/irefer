import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

import '../Utils/NewTextstyle.dart';



class EmiCalculatorScreen extends StatefulWidget {
  @override
  _EmiCalculatorScreenState createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  double loanAmount = 14100000;
  int tenure = 20;
  double interestRate = 21.45;

  double emi = 0;
  double totalAmount = 0;
  double totalInterest = 0;



  final format = NumberFormat.currency(locale: 'en_IN', symbol: '₹');

  @override
  void initState() {
    super.initState();
    calculateEMI();
  }

  void calculateEMI() {
    double monthlyRate = interestRate / (12 * 100);
    int months = tenure * 12;

    emi = loanAmount *
        monthlyRate *
        (pow(1 + monthlyRate, months) / (pow(1 + monthlyRate, months) - 1));

    totalAmount = emi * months;
    totalInterest = totalAmount - loanAmount;
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    calculateEMI();

    return SafeArea(

      child: Scaffold(
        backgroundColor:   Color(0xFFF3F5FF),

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Text(
            "EMI Calculator",
            style: Newtextstyle.normalopenSans2(Colors.black87,height*.56),


          ),
        ),



        body: SingleChildScrollView(
          padding: EdgeInsets.all(height*.5),
          child: Column(
            children: [
              Container(

                height: height*8,
                padding: EdgeInsets.all(height*.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 10)],
                ),
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: totalAmount,
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: totalInterest,
                          color: Colors.green,
                          width: 0.2,
                          sizeUnit: GaugeSizeUnit.factor,
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Text(format.format(totalAmount),


                            style: Newtextstyle.normalopenSans(Colors.black87,height*.34),
                          ),
                          angle: 90,
                          positionFactor: 0.6,
                        )
                      ],
                    )
                  ],
                ),
              ),




              SizedBox(height: height*.3),
              Text('Monthly EMI: ${format.format(emi)}',
                //  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                style: Newtextstyle.normalopenSans(Colors.black87,height*.5),

              ),


              SizedBox(height: height*.3),
              Card(
                //   #f3f5ff
                //   color: Color(0XFFf3f5ff),


                color: Colors.white,

                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Principal Amount',
                            style: Newtextstyle.normalopenSans(Colors.black87,height*.4),
                          ),
                          SizedBox(height: 8),
                          Text(format.format(loanAmount),
                            style: Newtextstyle.normalopenSans1(Colors.black87,height*.35),


                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Interest Amount',

                            style: Newtextstyle.normalopenSans(Colors.black87,height*.4),

                          ),
                          SizedBox(height: 8),
                          Text(format.format(totalInterest),
                            style: Newtextstyle.normalopenSans1(Colors.black87,height*.35),



                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              buildSlider("Loan Amount", loanAmount, 500000, 100000000, (value) => setState(() => loanAmount = value),height),
              buildSlider("Tenure (Years)", tenure.toDouble(), 5, 30,
                      (value) => setState(() => tenure = value.round()),height),

              buildSlider("Interest Rate (%)", interestRate, 7, 25,
                      (value) => setState(() => interestRate = value),height),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildSlider(String label, double value, double min, double max, Function(double) onChanged, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
              style: Newtextstyle.normalopenSans1(Colors.black87,height*.4),


            ),
            Text(
              label.contains("Tenure")
                  ? "$tenure years"
                  : label.contains("Interest")
                  ? "${value.toStringAsFixed(2)}%"
                  : format.format(value.round()),
              style: Newtextstyle.normalopenSans1(Colors.black87,height*.4),

            )
          ],
        ),
        Slider(
          min: min,
          max: max,
          value: value,
          divisions: 100,
          label: value.toStringAsFixed(2),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
