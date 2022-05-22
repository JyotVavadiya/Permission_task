import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_page(),
    ),
  );
}

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  String? status1;
  String? status2;
  String? status3;
  String? status4;
  String? status5;
  String? status6;

  TextStyle style = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "App Permissions",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert, color: Colors.black,),
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(child: Text("calendar permission = ${status1}")),
                PopupMenuItem(child: Text("SMS permission = ${status2}")),
                PopupMenuItem(child: Text("Location permission = ${status3}")),
                PopupMenuItem(child: Text("Camera permission = ${status4}")),
                PopupMenuItem(child: Text("Call permission = ${status5}")),
                PopupMenuItem(child: Text("Bluetooth permission = ${status6}")),
              ],
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.teal),
                child: Icon(
                  Icons.android,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "App Logo",
                  style: TextStyle(fontSize: 18, letterSpacing: 2),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Divider(
                thickness: 1,
              ),
              GestureDetector(
                onTap: () async{
                  PermissionStatus s1 = await Permission.calendar.request();
                  setState(() {
                    status1 = s1.name ;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 40,),
                      Text("Calender Permission", style: style,)
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1),
              GestureDetector(
                onTap: () async{
                  PermissionStatus s2 = await Permission.sms.request();
                  setState(() {
                    status2 = s2.name ;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.sms_outlined),
                      SizedBox(width: 40,),
                      Text("SMS Permission", style: style,)
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1),
              GestureDetector(
                onTap: () async{
                  PermissionStatus s3 = await Permission.location.request();
                  setState(() {
                    status3 = s3.name ;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      SizedBox(width: 40,),
                      Text("Location Permission", style: style,)
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1),
              GestureDetector(
                onTap: () async{
                  var camerastatus = await Permission.camera.status;
                  if(!camerastatus.isGranted)
                  {
                    PermissionStatus s4 = await Permission.camera.request();
                    setState(() {
                      status4 = s4.name ;
                    });
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt_outlined),
                      SizedBox(width: 40,),
                      Text("Camera Permission", style: style,)
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1),
              GestureDetector(
                onTap: () async{
                  PermissionStatus s5 = await Permission.phone.request();
                  setState(() {
                    status5 = s5.name ;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.phone_outlined),
                      SizedBox(width: 40,),
                      Text("Call Permission", style: style,)
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1),
              GestureDetector(
                onTap: () async{

                  PermissionStatus s6 = await Permission.bluetooth.request();
                  setState(() {
                    status6 = s6.name ;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Icon(Icons.bluetooth_outlined),
                      SizedBox(width: 40,),
                      Text("Bluetooth Permission", style: style,)
                    ],
                  ),
                ),
              ),
              Divider(thickness: 1),
            ],
          ),
        ));
  }
}