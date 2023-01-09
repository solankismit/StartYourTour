import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api.dart';
import '../models/bidpakege_comper_model.dart';
import '../models/get_pakege_details_modal.dart';

class CompareBids extends StatefulWidget {
  String fristid,
      fristagency,
      fristdate,
      fristprice,
      secondid,
      secondagency,
      seconddate,
      secondprice;
  // therddid,therdprice,therdagency,therddate;

  CompareBids(this.fristid, this.fristagency, this.fristdate, this.fristprice,
      this.secondid, this.secondagency, this.seconddate, this.secondprice,
      {Key? key})
      : super(key: key);

  // CompareBids(String fristid, String fristagency, String fristdate, String fristprice, String secondid, String secondagency, String seconddate, String secondprice, );

  @override
  _CompareBidsState createState() => _CompareBidsState();
}

class _CompareBidsState extends State<CompareBids>



    with SingleTickerProviderStateMixin {


 // int len= 0;

  List itenaries  = [];

  int? len;
  //
  Future<bid_pakege_comper_model>? _future;
  int _tabLength=0;
  int _dataLength=0;
  //
  late TabController _tabController = TabController(length: len.toString().length, vsync:this, );




  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    _future = Comper_bidpakege().Comperbidpakegeslist(widget.fristid,widget.secondid);
    _future!.then((value) {
      print("pppppppppppppppppppp : ${value.data!.length}");
      var server0Len = value.data![0].itineries?.length ;
      var server1Len = value.data![1].itineries?.length ;
      print(server0Len);
      print(server1Len);

      if(server0Len!.toInt() > server1Len!.toInt() ){
        checkAndUpdateTabLength(server0Len!.toInt());
      }else{
        checkAndUpdateTabLength(server1Len!.toInt());
      }
      //
      // print("data length ${value!.length}");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        print("other job");
        setState(() {
          // _dataLength = value.length;
        });
      });
    });

  }

  void checkAndUpdateTabLength (newLength){
    print("checkAndUpdateTabLength");
    print(newLength);
    print(_tabLength);
    setState(() {
      _tabLength = newLength;
      _tabController = TabController(vsync: this, length:newLength,);
    });
  }


  // void didUpdateWidget(covariant Widget oldWidget) {
  //   //super.didUpdateWidget(oldWidget);
  //   if (len!.toInt().toString().length != _tabController.length) {
  //     final oldIndex = _tabController.index;
  //     _tabController.dispose();
  //     _tabController = TabController(
  //       length: len!.toInt().toString().length,
  //       inialIndex: max(0, min(oldIndex,len!.toInt().toString().length - 1)),
  //       vsync: this,
  //     );
  //   }
  // }



  @override
  Widget build(BuildContext context) {
   // print(len!.toInt().toString().length);
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                indicatorColor: Color(0xff004351),
                tabs: [
                  Text("Overview",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004351),
                      )),
                  Text(
                    "Services",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff004351),
                    ),
                  ),
                  Text(
                    "Itinerary",
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff004351)),
                  )
                ],
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff004351),
                ),
              ),
              title: Text(
                "Compare Packages",
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: "SegoeUI",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff004351)),
              ),
              centerTitle: true,
            ),
            body: FutureBuilder<bid_pakege_comper_model>(
                future: _future,
                
                builder: (context, snapshots) {
                  print(widget.fristid + "Ankit FastID");
                  print(widget.secondid + "Ankit SecondID");

                  if(snapshots.hasData){
                    return  ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshots.data!.data!.length,
                        itemBuilder: (context, index) {

                          var server = snapshots.data!.data![0];
                          var server1 = snapshots.data!.data![1];
                          
                          len =  snapshots.data!.data![index].itineries?.length;

                          print(len.toString() + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                          print('55555555555555555555');
                          print(_tabLength.toString());


                          //  len = server1.itineries!.length;

                          print(index.toString() + "❤️❤️❤️❤️❤️❤️👋👋👋👋👋👋👋👋");
                          return Container(
                            height: 750.h,
                            child: TabBarView(
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: ListView(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 30.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        Text(
                                                          //"NR Travels",
                                                          widget.fristagency,

                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                            Icon(
                                                              Icons.star_border,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                            Icon(
                                                              Icons.star_border,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          "Total Reviews: 12",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"Price: ₹ 22,000",
                                                          widget.fristprice,
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Categories",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"Historical",

                                                          server.destinationCategory.toString(),
                                                          // snapshots.data!.data![0].destinationCategory.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Meals",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"Breakfast, Lunch, Dinner",
                                                          server.mealRequired.toString(),
                                                          //snapshots.data!.data![0].mealRequired.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Cab",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          "Exclude",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Sightseeing",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"Exclude",
                                                          server.sightseeing.toString(),
                                                          // snapshots.data!.data![0].sightseeing.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Flight",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          "Include",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Duration",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"20/7/2021 to 27/7/2021",
                                                          "${server.startDate1.toString()}${"to"}${server.endDate1.toString()}" ,
                                                          //"${snapshots.data!.data![0].startDate1.toString()} ${"to"} ${snapshots.data!.data![0].endDate1.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Categories",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          "Historical,Adventure",
                                                          //  server.destinationCategory.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Other Requirements",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          "No other",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                      ],
                                                    ),
                                                    VerticalDivider(
                                                      color: Colors.black,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Text(
                                                          //"Bharat Travels",
                                                          widget.secondagency,
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                            Icon(
                                                              Icons.star_border,
                                                              color:
                                                              Color(0xff025B72),
                                                              size: 18.sp,
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          "Total Reviews: 18",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"Price: ₹ 18,000",
                                                          widget.secondprice,
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Categories",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //  "Hostorical",
                                                          server1.destinationCategory.toString(),
                                                          // snapshots.data!.data![1].destinationCategory.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Meals",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"Breakfast,Dinner",
                                                          server1.mealRequired.toString(),
                                                          // snapshots.data!.data![1].mealRequired.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Cab",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          "Exclude",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Sightseeing",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"Exclude",

                                                          server1.sightseeing.toString(),
                                                          //snapshots.data!.data![1].sightseeing.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Flight",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          "Exclude",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Duration",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          //"20/7/2021 to 27/7/2021",

                                                          "${server1.startDate1.toString()}${"to"}${server1.endDate1.toString()}" ,
                                                          // "${snapshots.data!.data![1].startDate1.toString()} ${"to"} ${snapshots.data!.data![1].endDate1.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Categories",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          "Hostorical",

                                                          //server.destinationCategory.toString(),
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 40.h,
                                                        ),
                                                        Text(
                                                          "Other Requirements",
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        Text(
                                                          "No other",
                                                          style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Colors.black),
                                                        ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  child: ListView(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 30.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 20.w, left: 20.w),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            //"NR Travels",
                                                            widget.fristagency,
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontFamily:
                                                                "SegoeUI",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Colors.black),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Text(
                                                            "Included/Excluded",
                                                            style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontFamily:
                                                                "SegoeUI",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color: Colors.grey),
                                                          ),
                                                          SizedBox(
                                                            height: 40.h,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xff079023),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      //"Spa and relaxation treatment",
                                                                      server.includeServices![0].includeServicesValue.toString(),
                                                                      //  snapshots.data!.data![0].includeServices![0].includeServicesValue.toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xff079023)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xff079023),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      "Water Activities",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xff079023)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xff079023),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      "Spa and relaxation treatment",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xff079023)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Color(
                                                                        0xffEE1B1B),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      // "Water Activities",
                                                                      server.excludeServices![0].excludeServicesValue.toString(),
                                                                      // snapshots.data!.data![0].excludeServices![0].excludeServicesValue.toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xffEE1B1B)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Color(
                                                                        0xffEE1B1B),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      "Spa and relaxation treatment",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xffEE1B1B)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Color(
                                                                        0xffEE1B1B),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      "Private Beach area",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xffEE1B1B)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      VerticalDivider(
                                                        color: Colors.black,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Text(
                                                            // "Bharat Travels",

                                                            widget.secondagency,
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontFamily:
                                                                "SegoeUI",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Colors.black),
                                                          ),
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Text(
                                                            "Included/Excluded",
                                                            //server.includeServices![index].includeServicesValue.toString(),
                                                            style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontFamily:
                                                                "SegoeUI",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color: Colors.grey),
                                                          ),
                                                          SizedBox(
                                                            height: 40.h,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xff079023),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      //"Spa and relaxation treatment",
                                                                      server1.includeServices![0].includeServicesValue.toString(),
                                                                      //snapshots.data!.data![0].includeServices![0].includeServicesValue.toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xff079023)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xff079023),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      "Water Activities",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xff079023)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xff079023),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      "Spa and relaxation treatment",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xff079023)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Color(
                                                                        0xffEE1B1B),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      //"Water Activities",
                                                                      server1.excludeServices![0].excludeServicesValue.toString(),
                                                                      //snapshots.data!.data![1].excludeServices![1].excludeServicesValue.toString(),
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xffEE1B1B)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Color(
                                                                        0xffEE1B1B),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      "Spa and relaxation treatment",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xffEE1B1B)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Color(
                                                                        0xffEE1B1B),
                                                                    size: 20.h,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10.w,
                                                                  ),
                                                                  Container(
                                                                    width: 130.w,
                                                                    child: Text(
                                                                      "Private Beach area",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                          color: Color(
                                                                              0xffEE1B1B)),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                    color: Colors.white,
                                    child: ListView(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 40.h,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 20.w, left: 20.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              Text(
                                                                //"NR Travels",
                                                                widget.fristagency,
                                                                style: TextStyle(
                                                                    fontSize: 18.sp,
                                                                    fontFamily:
                                                                    "SegoeUI",
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color:
                                                                    Colors.black),
                                                              ),
                                                              SizedBox(
                                                                height: 30.h,
                                                              ),
                                                            ],
                                                          ),
                                                          VerticalDivider(
                                                            color: Colors.black,
                                                          ),
                                                          Column(
                                                            children: [
                                                              Text(
                                                                //"Bharat Travels",
                                                                widget.secondagency,
                                                                style: TextStyle(
                                                                    fontSize: 18.sp,
                                                                    fontFamily:
                                                                    "SegoeUI",
                                                                    fontWeight:
                                                                    FontWeight.bold,
                                                                    color:
                                                                    Colors.black),
                                                              ),
                                                              SizedBox(
                                                                height: 30.h,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),




                                                    TabBar(

                                                      controller:  _tabController,
                                                      indicatorColor: Color(0xff004351),
                                                      tabs:
                                                      snapshots.data!.data![0].itineries!.length >= snapshots.data!.data![1].itineries!.length ?
                                                      snapshots.data!.data![0].itineries!.asMap().entries.map((entry) {
                                                        int idx = entry.key;
                                                        print(_tabController.toString() + ">>>>>>>>>>>>>>>>>>>>>>");
                                                        // String val = entry.value;

                                                        return Text(
                                                          "Day "+(idx+1).toString(),
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Color(0xff004351)),
                                                        );
                                                      }).toList()
                                                          :
                                                      snapshots.data!.data![1].itineries!.asMap().entries.map((entry) {
                                                        int idx = entry.key;
                                                        print(_tabController.toString() + ">>>>>>>>>>>>>>>>>>>>>>");
                                                        // String val = entry.value;

                                                        return Text(
                                                          "Day "+(idx+1).toString(),
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontFamily: "SegoeUI",
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Color(0xff004351)),
                                                        );
                                                      }).toList()


                                                      //       [
                                                      //     Text(
                                                      //       "Day 1",
                                                      // //"${"Day"} ${ server1.itineries![index].day.toString()}",
                                                      //       style: TextStyle(
                                                      //           fontSize: 18.sp,
                                                      //           fontFamily: "SegoeUI",
                                                      //           fontWeight:
                                                      //           FontWeight.bold,
                                                      //           color: Color(0xff004351)),
                                                      //     ),
                                                      //   ],
                                                    ),
                                                    Container(
                                                      height: 800.h,
                                                      // color: Colors.green,
                                                      child: TabBarView(
                                                          controller: _tabController,
                                                          children:
                                                          snapshots.data!.data![0].itineries!.length >= snapshots.data!.data![1].itineries!.length
                                                              ?
                                                          snapshots.data!.data![0].itineries!.asMap().entries.map((entry) {

                                                            print(_tabController);
                                                            int idx = entry.key;
                                                            // String val = entry.value;

                                                            return
                                                              ListView(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 40.h,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets.only(
                                                                            right: 20.w,
                                                                            left: 20.w),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                          children: [
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(
                                                                                  height:
                                                                                  30.h,
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(

                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            "Day ${idx+1}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      10.h,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            idx + 1 <= snapshots.data!.data![0].itineries!.length  ?
                                                                                            "Hotel: ${snapshots.data!.data![0].itineries![idx].hotelName.toString()}"
                                                                                                :
                                                                                            "Hotel: ---",
                                                                                            //"${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      10.h,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            idx + 1 <= snapshots.data!.data![0].itineries!.length  ?
                                                                                            "Activity: ${snapshots.data!.data![0].itineries![idx].activity.toString()}"
                                                                                                :
                                                                                            "Activity: ---",
                                                                                            //"${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      30.h,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            VerticalDivider(
                                                                              color: Colors
                                                                                  .black,
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(
                                                                                  height:
                                                                                  30.h,
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            "Day ${idx+1}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      10.h,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            idx + 1 <= snapshots.data!.data![1].itineries!.length  ?
                                                                                            "Hotel: ${snapshots.data!.data![1].itineries![idx].hotelName.toString()}"
                                                                                                :
                                                                                            "Hotel: ---",
                                                                                            // "${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      10.h,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            idx + 1 <= snapshots.data!.data![1].itineries!.length  ?
                                                                                            "Activity: ${snapshots.data!.data![1].itineries![idx].activity.toString()}"
                                                                                                :
                                                                                            "Activity: ---",

                                                                                            //"${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      30.h,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              );
                                                          }).toList()
                                                              : snapshots.data!.data![1].itineries!.asMap().entries.map((entry) {

                                                            print(_tabController);
                                                            int idx = entry.key;
                                                            // String val = entry.value;

                                                            return
                                                              Container(
                                                                  child: Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 40.h,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsets.only(
                                                                            right: 20.w,
                                                                            left: 20.w),
                                                                        child: Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceEvenly,
                                                                          children: [
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(
                                                                                  height:
                                                                                  30.h,
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            "Day ${idx+1}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      10.h,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            idx + 1 <= snapshots.data!.data![0].itineries!.length  ?
                                                                                            "Hotel: ${snapshots.data!.data![0].itineries![idx].hotelName.toString()}"
                                                                                                :
                                                                                            "Hotel: ---",
                                                                                            //"${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      10.h,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            idx + 1 <= snapshots.data!.data![0].itineries!.length  ?
                                                                                            "Activity: ${snapshots.data!.data![0].itineries![idx].activity.toString()}"
                                                                                                :
                                                                                            "Activity: ---",
                                                                                            //"${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      30.h,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            VerticalDivider(
                                                                              color: Colors
                                                                                  .black,
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                SizedBox(
                                                                                  height:
                                                                                  30.h,
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            "Day ${idx+1}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      10.h,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            idx + 1 <= snapshots.data!.data![1].itineries!.length  ?
                                                                                            "Hotel: ${snapshots.data!.data![1].itineries![idx].hotelName.toString()}"
                                                                                                :
                                                                                            "Hotel: ---",
                                                                                            // "${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      10.h,
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          width:
                                                                                          130.w,
                                                                                          child:
                                                                                          Text(
                                                                                            idx + 1 <= snapshots.data!.data![1].itineries!.length  ?
                                                                                            "Activity: ${snapshots.data!.data![1].itineries![idx].activity.toString()}"
                                                                                                :
                                                                                            "Activity: ---",

                                                                                            //"${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height:
                                                                                      30.h,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ));
                                                          }).toList()

                                                         


                                                        // [
                                                        //   Container(
                                                        //       child: Column(
                                                        //         children: [
                                                        //           SizedBox(
                                                        //             height: 40.h,
                                                        //           ),
                                                        //           Padding(
                                                        //             padding:
                                                        //             EdgeInsets.only(
                                                        //                 right: 20.w,
                                                        //                 left: 20.w),
                                                        //             child: Row(
                                                        //               mainAxisAlignment:
                                                        //               MainAxisAlignment
                                                        //                   .spaceEvenly,
                                                        //               children: [
                                                        //                 Column(
                                                        //                   children: [
                                                        //                     SizedBox(
                                                        //                       height:
                                                        //                       30.h,
                                                        //                     ),
                                                        //                     Column(
                                                        //                       crossAxisAlignment:
                                                        //                       CrossAxisAlignment
                                                        //                           .start,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Day 1: lorem ipsum",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Hotel: ${server.itineries![0].hotelName.toString()}",
                                                        //                                   //"${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Activity: ${server.itineries![0].activity.toString()}",
                                                        //                                   //"${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           30.h,
                                                        //                         ),
                                                        //                       ],
                                                        //                     ),
                                                        //                   ],
                                                        //                 ),
                                                        //                 VerticalDivider(
                                                        //                   color: Colors
                                                        //                       .black,
                                                        //                 ),
                                                        //                 Column(
                                                        //                   children: [
                                                        //                     SizedBox(
                                                        //                       height:
                                                        //                       30.h,
                                                        //                     ),
                                                        //                     Column(
                                                        //                       crossAxisAlignment:
                                                        //                       CrossAxisAlignment
                                                        //                           .start,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Day 1: lorem ipsum",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Hotel: ${server1.itineries![0].hotelName.toString()}",
                                                        //                                    // "${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Activity: ${server1.itineries![0].activity.toString()}",
                                                        //                                   //"${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           30.h,
                                                        //                         ),
                                                        //                       ],
                                                        //                     ),
                                                        //                   ],
                                                        //                 ),
                                                        //               ],
                                                        //             ),
                                                        //           ),
                                                        //         ],
                                                        //       )),
                                                        //   Container(
                                                        //       child: Column(
                                                        //         children: [
                                                        //           SizedBox(
                                                        //             height: 40.h,
                                                        //           ),
                                                        //           Padding(
                                                        //             padding:
                                                        //             EdgeInsets.only(
                                                        //                 right: 20.w,
                                                        //                 left: 20.w),
                                                        //             child: Row(
                                                        //               mainAxisAlignment:
                                                        //               MainAxisAlignment
                                                        //                   .spaceEvenly,
                                                        //               children: [
                                                        //                 Column(
                                                        //                   children: [
                                                        //                     SizedBox(
                                                        //                       height:
                                                        //                       30.h,
                                                        //                     ),
                                                        //                     Column(
                                                        //                       crossAxisAlignment:
                                                        //                       CrossAxisAlignment
                                                        //                           .start,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Day 2: lorem ipsum",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Hotel:${server.itineries![1].hotelName.toString()} ",
                                                        //                                // ${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Activity: ${server.itineries![1].activity.toString()}",
                                                        //                                   //${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           30.h,
                                                        //                         ),
                                                        //                       ],
                                                        //                     ),
                                                        //                   ],
                                                        //                 ),
                                                        //                 VerticalDivider(
                                                        //                   color: Colors
                                                        //                       .black,
                                                        //                 ),
                                                        //                 Column(
                                                        //                   children: [
                                                        //                     SizedBox(
                                                        //                       height:
                                                        //                       30.h,
                                                        //                     ),
                                                        //                     Column(
                                                        //                       crossAxisAlignment:
                                                        //                       CrossAxisAlignment
                                                        //                           .start,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Day 2: lorem ipsum",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Hotel:  ${server1.itineries![1].hotelName.toString()}",
                                                        //                                    //${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Activity:${server1.itineries![1].activity.toString()}" ,
                                                        //                                    //${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           30.h,
                                                        //                         ),
                                                        //                       ],
                                                        //                     ),
                                                        //                   ],
                                                        //                 ),
                                                        //               ],
                                                        //             ),
                                                        //           ),
                                                        //         ],
                                                        //       )),
                                                        //   Container(
                                                        //       child: Column(
                                                        //         children: [
                                                        //           SizedBox(
                                                        //             height: 40.h,
                                                        //           ),
                                                        //           Padding(
                                                        //             padding:
                                                        //             EdgeInsets.only(
                                                        //                 right: 20.w,
                                                        //                 left: 20.w),
                                                        //             child: Row(
                                                        //               mainAxisAlignment:
                                                        //               MainAxisAlignment
                                                        //                   .spaceEvenly,
                                                        //               children: [
                                                        //                 Column(
                                                        //                   children: [
                                                        //                     SizedBox(
                                                        //                       height:
                                                        //                       30.h,
                                                        //                     ),
                                                        //                     Column(
                                                        //                       crossAxisAlignment:
                                                        //                       CrossAxisAlignment
                                                        //                           .start,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Day 1: lorem ipsum",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Hotel: ${server.itineries![2].hotelName.toString()}",
                                                        //                                   //${snapshots.data!.data![0].itineries![0].hotelName.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Activity: ${server.itineries![2].activity.toString()}",
                                                        //                                   //${snapshots.data!.data![0].itineries![0].activity.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           30.h,
                                                        //                         ),
                                                        //                       ],
                                                        //                     ),
                                                        //                   ],
                                                        //                 ),
                                                        //                 VerticalDivider(
                                                        //                   color: Colors
                                                        //                       .black,
                                                        //                 ),
                                                        //                 Column(
                                                        //                   children: [
                                                        //                     SizedBox(
                                                        //                       height:
                                                        //                       30.h,
                                                        //                     ),
                                                        //                     Column(
                                                        //                       crossAxisAlignment:
                                                        //                       CrossAxisAlignment
                                                        //                           .start,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Day 1: lorem ipsum",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Hotel: ${server1.itineries![2].hotelName.toString()}" ,
                                                        //                                    //${snapshots.data!.data![1].itineries![1].hotelName.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Activity:  ${server1.itineries![2].activity.toString()}",
                                                        //                                  //${snapshots.data!.data![1].itineries![1].activity.toString()}",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           30.h,
                                                        //                         ),
                                                        //                       ],
                                                        //                     ),
                                                        //                   ],
                                                        //                 ),
                                                        //               ],
                                                        //             ),
                                                        //           ),
                                                        //         ],
                                                        //       )),
                                                        //   Container(
                                                        //       child: Column(
                                                        //         children: [
                                                        //           SizedBox(
                                                        //             height: 40.h,
                                                        //           ),
                                                        //           Padding(
                                                        //             padding:
                                                        //             EdgeInsets.only(
                                                        //                 right: 20.w,
                                                        //                 left: 20.w),
                                                        //             child: Row(
                                                        //               mainAxisAlignment:
                                                        //               MainAxisAlignment
                                                        //                   .spaceEvenly,
                                                        //               children: [
                                                        //                 Column(
                                                        //                   children: [
                                                        //                     SizedBox(
                                                        //                       height:
                                                        //                       30.h,
                                                        //                     ),
                                                        //                     Column(
                                                        //                       crossAxisAlignment:
                                                        //                       CrossAxisAlignment
                                                        //                           .start,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Day 1: lorem ipsum",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Hotel: Ahmedabad",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Activity: Ipsum Lorem",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           30.h,
                                                        //                         ),
                                                        //                       ],
                                                        //                     ),
                                                        //                   ],
                                                        //                 ),
                                                        //                 VerticalDivider(
                                                        //                   color: Colors
                                                        //                       .black,
                                                        //                 ),
                                                        //                 Column(
                                                        //                   children: [
                                                        //                     SizedBox(
                                                        //                       height:
                                                        //                       30.h,
                                                        //                     ),
                                                        //                     Column(
                                                        //                       crossAxisAlignment:
                                                        //                       CrossAxisAlignment
                                                        //                           .start,
                                                        //                       children: [
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Day 1: lorem ipsum",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Hotel: Ahmedabad",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           10.h,
                                                        //                         ),
                                                        //                         Row(
                                                        //                           children: [
                                                        //                             Container(
                                                        //                               width:
                                                        //                               130.w,
                                                        //                               child:
                                                        //                               Text(
                                                        //                                 "Activity: Ipsum Lorem",
                                                        //                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                        //                               ),
                                                        //                             ),
                                                        //                           ],
                                                        //                         ),
                                                        //                         SizedBox(
                                                        //                           height:
                                                        //                           30.h,
                                                        //                         ),
                                                        //                       ],
                                                        //                     ),
                                                        //                   ],
                                                        //                 ),
                                                        //               ],
                                                        //             ),
                                                        //           ),
                                                        //         ],
                                                        //       )),
                                                        // ]

                                                      ),
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          );

                        }


                    );
                  }else{
                    return  Center(child: CircularProgressIndicator());
                  }


                })));
  }
}
