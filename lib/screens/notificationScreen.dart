import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syt/screens/drawerScreen.dart';

import '../Api.dart';
import '../models/Notification_Dispaly_Model.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: DrawerScreen(),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Colors.black,
          ),
          title: Text(
            "Notifications",
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<Notification_dispaly_Model>(
            future: Notification_Display().Notification_DisplayList(),
            builder: (context, snapshots) {
              return (snapshots.hasData)
                  ? ListView.builder(
                //scrollDirection: Axis.horizontal,
                itemCount: snapshots.data!.data!.length,
                itemBuilder: (context, index){
                  var server = snapshots.data?.data?[index];
                  return Container(
                    color: Colors.white,
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: 15.h, left: 16.h, bottom: 16.h),
                            //height: 150.h,
                            width: 380.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                              Border.all(color: Color(0xff004351)),
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(1, 2))
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 12.h,
                                  right: 8.h,
                                  top: 3.h,
                                  bottom: 3.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        server!.title.toString(),
                                       // "Package booked successfully",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff004351)),
                                      ),
                                      Row(
                                        children: [
                                          // Text(
                                          //   "12:30",
                                          //   style: TextStyle(
                                          //       fontSize: 12.sp,
                                          //       fontFamily: "SegoeUI",
                                          //       fontWeight:
                                          //       FontWeight.bold,
                                          //       color: Color(0xff004351)),
                                          // ),
                                          // SizedBox(
                                          //   width: 10.w,
                                          // ),
                                          Text(
                                            server.dateAndTime.toString(),
                                           // "20/02/2021",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight:
                                                FontWeight.bold,
                                                color: Color(0xff004351)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    server.text.toString(),
                                   //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff333333)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }


              ): Center(child: CircularProgressIndicator());
            }));
  }
}
