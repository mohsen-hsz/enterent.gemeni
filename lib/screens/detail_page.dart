import 'package:hotel_reservation_app/screens/support2.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      child: Image.asset(
                        "assets/images/hotel1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(top: 50.0, left: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text("Hotel Beach", style: Appwidget.headlinetextstyle(28.0)),
                    Text("\$20", style: Appwidget.normaltextstyle(28.0)),
                    Divider(thickness: 2.0),
                    SizedBox(height: 10.0),
                    Text(
                      "what this place offers",
                      style: Appwidget.headlinetextstyle(22.0),
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.wifi, color: Colors.blue, size: 30.0),
                        SizedBox(width: 10.0),
                        Text("WiFi", style: Appwidget.normaltextstyle(23.0)),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Icon(Icons.tv, color: Colors.blue, size: 30.0),
                        SizedBox(width: 10.0),
                        Text("TV", style: Appwidget.normaltextstyle(23.0)),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Icon(Icons.kitchen, color: Colors.blue, size: 30.0),
                        SizedBox(width: 10.0),
                        Text("Kitchen", style: Appwidget.normaltextstyle(23.0)),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      children: [
                        Icon(Icons.bathroom, color: Colors.blue, size: 30.0),
                        SizedBox(width: 10.0),
                        Text("Bathroom", style: Appwidget.normaltextstyle(23.0)),
                      ],
                    ),
                    Divider(thickness: 2.0),
                    SizedBox(height: 5.0),
                    Text(
                      "About this place",
                      style: Appwidget.headlinetextstyle(22.0),
                    ),
                    SizedBox(height: 20.0),
                    Material(
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0),
                            Text(
                              "\$100 for 4 nights",
                              style: Appwidget.headlinetextstyle(20.0),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "check-in Data",
                              style: Appwidget.headlinetextstyle(20.0),
                            ),
                            Divider(),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "02, Apr 2025",
                                  style: Appwidget.normaltextstyle(20.0),
                                ),
                              ],
                            ),
          
                            SizedBox(height: 5.0),
                            Text(
                              "check-out Data",
                              style: Appwidget.headlinetextstyle(20.0),
                            ),
                            Divider(),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.calendar_month,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  "05, Apr 2025",
                                  style: Appwidget.normaltextstyle(20.0),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              "Number of Guests",
                              style: Appwidget.normaltextstyle(20.0),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              padding: EdgeInsets.only(left: 20.0),
                              decoration: BoxDecoration(color: Color.fromARGB(255, 243, 243, 243),borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,hintText:"1", hintStyle: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500)
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                              child: Center(child: Text("Book Now", style: Appwidget.whitetextstyle(22.0),)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
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
