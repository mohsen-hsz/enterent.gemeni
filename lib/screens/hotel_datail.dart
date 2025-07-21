//File : hotel_datail.dart

import "package:hotel_reservation_app/screens/support2.dart";
import "package:flutter/material.dart";

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  bool isWifiChecked = false;
  bool isHdtvChecked = false;
  bool isKitchenChecked = false;
  bool isBathroomChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Hotel Details", style: Appwidget.whitetextstyle(26.0)),
              ],
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.0),
                      Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 2.0, color: Colors.black45),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.blue,
                            size: 40.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text("Hotel Name", style: Appwidget.normaltextstyle(20.0)),
                      SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Hotel Name",
                            hintStyle: Appwidget.normaltextstyle(18.0),
                          ),
                        ),
                      ),
                  
                      SizedBox(height: 20.0),
                      Text(
                        "Hotel Room Charges",
                        style: Appwidget.normaltextstyle(20.0),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Room Charges",
                            hintStyle: Appwidget.normaltextstyle(18.0),
                          ),
                        ),
                      ),
                  
                      SizedBox(height: 20.0),
                      Text(
                        "Hotel Address",
                        style: Appwidget.normaltextstyle(20.0),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter Hotel Address",
                            hintStyle: Appwidget.normaltextstyle(18.0),
                          ),
                        ),
                      ),
                  
                      SizedBox(height: 20.0),
                      Text(
                        "what service you want to offer ?",
                        style: Appwidget.normaltextstyle(20.0),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isWifiChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isWifiChecked = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.wifi,
                            color: const Color.fromARGB(255, 7, 102, 179),
                            size: 30.0,
                          ),
                          SizedBox(width: 10.0),
                          Text("WIFI", style: Appwidget.normaltextstyle(23.0)),
                        ],
                      ),
                      
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isHdtvChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isHdtvChecked = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.tv,
                            color: const Color.fromARGB(255, 7, 102, 179),
                            size: 30.0,
                          ),
                          SizedBox(width: 10.0),
                          Text("HDTV", style: Appwidget.normaltextstyle(23.0)),
                        ],
                      ),
                  
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isKitchenChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isKitchenChecked = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.kitchen,
                            color: const Color.fromARGB(255, 7, 102, 179),
                            size: 30.0,
                          ),
                          SizedBox(width: 10.0),
                          Text("Kitchen", style: Appwidget.normaltextstyle(23.0)),
                        ],
                      ),
                  
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: isBathroomChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isBathroomChecked = value!;
                              });
                            },
                          ),
                          Icon(
                            Icons.bathroom,
                            color: const Color.fromARGB(255, 7, 102, 179),
                            size: 30.0,
                          ),
                          SizedBox(width: 10.0),
                          Text("Bathroom", style: Appwidget.normaltextstyle(23.0)),
                        ],
                      ),

                       SizedBox(height: 20.0),
                      Text(
                        "Hotel Description",
                        style: Appwidget.normaltextstyle(20.0),
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        padding: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFececf8),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          maxLines: 6,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter About Hotel ...",
                            hintStyle: Appwidget.normaltextstyle(18.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Center(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Center(child: Text("Submit",style: Appwidget.whitetextstyle(26.0),)),
                        ),
                      ),
                      SizedBox(height: 30.0,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
