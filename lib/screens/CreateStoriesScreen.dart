import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:jsp/controller/CreateStoriesController.dart';



class CreateStoriesScreen extends StatelessWidget {
  final List<String> filters = [
    "सभी",
    "रक्षाबंधन",
    "राजनीतिक",
    "धार्मिक",
    "प्रेरक",
    "होली",
    "दीपावली"
  ];

  final List<Map<String, String>> posters = [
    {
      "image": "assets/images/poster1.jpg",
      "title": "श्री सोनू सिंह",
      "description": "गाँवों का विकास, स्वास्थ्य, शिक्षा...",
      "buttonText": "Edit",
    },


    {
      "image": "assets/images/poster2.jpg",
      "title": "श्री रोशन सिंह",
      "description": "हर वार्ड में नियमित ग्राम सभा...",
      "buttonText": "Edit",
    },


    {
      "image": "assets/images/poster3.jpg",
      "title": "श्री शशि रंजन कुमार",
      "description": "Celebrate the boundless love...",
      "buttonText": "Edit",
    },
    {
      "image": "assets/images/poster4.jpg",
      "title": "श्री शशि रंजन कुमार",
      "description": "स्वच्छता और स्वच्छ पेयजल...",
      "buttonText": "Edit",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.orange,
      //   leading: Icon(Icons.arrow_back, color: Colors.black),
      //   title: Text(
      //     "पोस्टर बनाएं",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontSize: 22,
      //       color: Colors.black,
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.add, color: Colors.black),
      //       onPressed: () {},
      //     )
      //   ],
      // ),
      body:



    GetBuilder<Createstoriescontroller>(
    init: Createstoriescontroller(),
    builder: (s) =>





      Column(
        children: [
          // Filter Chips


          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Row(
                children: filters
                    .map((filter) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(
                      filter,
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(color: Colors.orange),
                    onSelected: (value) {},
                  ),
                ))
                    .toList(),
              ),
            ),
          ),

          // Posters Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.9,
                ),
                itemCount: posters.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            child: Image.asset(
                              posters[index]["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                posters[index]["title"]!,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              SizedBox(height: 4),
                              Text(
                                posters[index]["description"]!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  // Download button
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.download,
                                      color: Colors.green,
                                    ),
                                  ),
                                  // Share button
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  // Edit button
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.orange,
                                      minimumSize: Size(50, 30),
                                    ),
                                    child: Text(
                                      posters[index]["buttonText"]!,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),


    )


    );
  }
}
