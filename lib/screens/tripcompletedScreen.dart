import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TripCompleted extends StatefulWidget {
  @override
  _TripCompletedState createState() => _TripCompletedState();
}

class _TripCompletedState extends State<TripCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
          icon: Icon(Icons.arrow_back,color:Color(0xff004351) ,),
        ),
        title: Text(
          "Trip Completed",
          style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  height: 135.h,
                  child: Stack(
                    children: [
                      Container(
                        width: 380.w,
                        height: 130.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff037491),
                                  Color(0xff000000),
                                ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Text(
                                "Ahmedabad To Goa",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 35.h,
                          left: 3.w,
                          child: Container(
                            width: 373.w,
                            height: 90.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Color(0xff01576D))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.w, top: 8.h, right: 8.w),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Trip/package ID: 2548756523",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "Booking Date: 27/02/2021",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "Total Person: 2",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "View More Details",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffEE1B1B)),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "Agency Contact No: 96244**4*0",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Text(
                                            "Contact Person: Tour Bharat",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 8.w, left: 8.w),
                                  child: Text(
                                    "Trip Completed",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff2A9D00)),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 70.w, left: 70.w),
                  child: Text(
                    "We hope your journey was great, Please share your Experience with us.",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff7F7F7F)),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0xff025B72),
                      size: 25.h,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xff025B72),
                      size: 25.h,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xff025B72),
                      size: 25.h,
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xff025B72),
                      size: 25.h,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Color(0xff025B72),
                      size: 25.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 85.h,
                ),
                Container(
                  height: 110.h,
                  width: 310.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 3,
                        offset: Offset(0,2)
                    )
                    ],
                    borderRadius: BorderRadius.circular(15.r),

                ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 8.w,left: 8.w),
                    child: TextFormField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Write experience here...",
                        hintStyle: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff7F7F7F)
                        )

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                SizedBox(
                  height: 80.h,
                ),
                InkWell(onTap: (){
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NavigationBar()));
                },
                  child: Container(
                    height: 35.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      color: Color(0xff09646D),
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1,2)
                      )
                      ],
                    ),
                    child:  Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: Text("Submit",style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.white

                        ),),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
