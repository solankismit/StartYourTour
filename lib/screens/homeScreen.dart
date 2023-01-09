import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/getdestination_catagory_model.dart';

import 'package:syt/screens/drawerScreen.dart';
import 'package:syt/screens/honeymoondestinationsScreen.dart';
import 'package:syt/screens/myplaningScreen.dart';
import 'package:syt/screens/packagesScreen.dart';
import 'package:syt/screens/searchScreen.dart';
import 'package:syt/screens/topratedhotelsScreen.dart';
import '../models/Get_HomePage_Data_Modal.dart';
import '../models/getmostloveddestinations_catagory_model.dart';
import '../models/safetyinfo_model.dart';


const categorys = """
query categorys{
  categorys{
    name
    _id
    __typename
  }
}
""";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var top;
  var hei = 362.h;
  var White = Color(0xffFFFFFF);
  var greendark = Color(0xff09646D);
  var color;
  String _id = "";

  @override
  void setState(VoidCallback fn) {
    hei = top;
    super.setState(fn);
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool searchBar = false;

  // void _sendDataToSecondScreen(BuildContext context) {
  //   var server;
  //   String catagory_destination=server.categoryName.toString();
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => HoneymoonDestinations()));
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerScreen(),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                //foregroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.r),
                        bottomLeft: Radius.circular(15.r))),
                automaticallyImplyLeading: false,
                backgroundColor: Color(0xff00363D),
                expandedHeight: 360.h,
                flexibleSpace: LayoutBuilder(
                    builder: (context, BoxConstraints constraints) {
                  this.top = constraints.biggest.height;
                  hei = this.top;
                  print(top);
                  print(hei);

                  return ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15.r),
                        bottomLeft: Radius.circular(15.r)),
                    child: FlexibleSpaceBar(
                      background: Image.asset(
                        "assets/Baga Beach.jpg",
                        fit: BoxFit.cover,
                      ),
                      centerTitle: true,
                      title: (hei > 150.h)
                          ? InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => MyPlaniing()));
                              },
                              child: Container(
                                height: 32.h,
                                width: 140.w,
                                decoration: BoxDecoration(
                                  color: Color(0xff09646D),
                                  borderRadius: BorderRadius.circular(5.r),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10.r,
                                        spreadRadius: 2.r,
                                        offset: Offset(0, 0))
                                  ],
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 2.h),
                                    child: Text(
                                      "Create Custom Package",
                                      style: TextStyle(
                                          fontSize: 10.sp,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : null,
                    ),
                  );
                }),
                leading: IconButton(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                      setState(() {
                        if (hei > 100.h) {
                          color = greendark;
                        } else {
                          color = White;
                        }
                      });
                    },
                    icon: Icon(Icons.menu),
                    color: (hei > 100.h) ? Color(0xff09646D) : Colors.white),
                actions: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (searchBar == false)
                          ? Text(
                              "Search your Desired Location",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16.sp,
                                fontFamily: "SegoeUI",
                                //fontWeight: FontWeight.bold,
                                //color: Colors.white,
                                color: Color(0xff09646D),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        searchBar = !searchBar;
                      });
                    },
                    icon: Icon(
                      (searchBar == false) ? Icons.search_rounded : Icons.close,
                      size: 30.sp,
                    ),
                    color: Color(0xff09646D),
                  )
                ],
                floating: true,
                pinned: true,
                title: (searchBar == false)
                    ? null
                    : Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff09646D))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xff09646D)),
                            onFieldSubmitted: (value) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SearchResult()));
                            },
                            // onTap: () {
                            //   Navigator.of(context).push(MaterialPageRoute(
                            //                                 builder: (context) => SearchResult()));
                            // },
                            decoration: InputDecoration(
                              hintText: "Search your Desired Location",
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16.sp,
                                  fontFamily: "SegoeUI",
                                  //fontWeight: FontWeight.bold,
                                  color: Color(0xff09646D)),
                            ),
                            keyboardType: TextInputType.streetAddress,
                          ),
                        ),
                      ),
              ),
            ];
          },
          body: FutureBuilder<Get_HomePage_Data_Model>(
              future: HomePage_Data().HomePage_DataList(),
              builder: (context, snapshots) {
                return (snapshots.hasData)
                    ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount:snapshots.data?.data?.length,
                    itemBuilder: (context, index){
                    var server = snapshots.data?.data?[index];
                    return   LimitedBox(
                      maxHeight: 500.h,
                      maxWidth: 410.w,
                      child: ListView(
                       // scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Are You Looking For?",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              SizedBox(
                                height: 120.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:  snapshots.data?.data?[index].destinationData?.length??0,
                                  itemBuilder: (context,destIndex) {
                                    return Row(children: [
                                      SizedBox(width: 10.w),
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              var cat_id =
                                              snapshots.data?.data?[index].destinationData?[destIndex].sId.toString();
                                                var cat_name = server?.destinationData?[destIndex].categoryName.toString();

                                              final SharedPreferences prefs =
                                              await _prefs;
                                              prefs.setString("cat_id", cat_id!);
                                              prefs.setString("cat_name", cat_name!);
                                              print("from home page ");

                                              print(prefs.getString("cat_id"));
                                              print(prefs.getString("cat_name"));

                                              print("from home page ");

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HoneymoonDestinations()));
                                            },
                                            child: Container(
                                              height: 90.h,
                                              width: 100.w,
                                              margin: EdgeInsets.only(right: 10.w),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(15.r),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    //image: AssetImage("assets/Baga Beach.jpg"),
                                                    image: NetworkImage(
                                                        server!.destinationData![destIndex].photo.toString()
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var cat_id =
                                              server.destinationData?[destIndex].sId.toString();
                                              var cat_name = server.destinationData?[destIndex].categoryName.toString();

                                              final SharedPreferences prefs =
                                              await _prefs;
                                              prefs.setString("cat_id", cat_id!);

                                               prefs.setString("cat_name", cat_name!);

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HoneymoonDestinations()));
                                            },
                                            child: Text(
                                              server.destinationData![destIndex].categoryName.toString(),
                                              style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontFamily: "SegoeUI",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]);
                                  }
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10.w),
                                    child: Text(
                                      "Most Loved Destinations!",
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
                                    },
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffBE1C1C)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),

                              SizedBox(
                                height: 150.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                    itemCount:  snapshots.data?.data?[index].mostLovaedDestionation?.length??0,
                                    itemBuilder: (context,destIndex){

                                      return Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10.w),
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    var destination_id = server?.mostLovaedDestionation?[destIndex].sId.toString();
                                                    var destination_name = server?.mostLovaedDestionation?[destIndex].destinationName.toString();
                                                    var destination_placeToVisit =
                                                    server?.mostLovaedDestionation?[destIndex].placeToVisits.toString();

                                                    final SharedPreferences prefs =
                                                    await _prefs;
                                                    prefs.setString("destination_id",
                                                        destination_id!);
                                                    prefs.setString(
                                                        "destination_name",
                                                        destination_name!);
                                                    prefs.setString(
                                                        "destination_placeToVisit",
                                                        destination_placeToVisit!);

                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PackagesScreen()));
                                                  },
                                                  child: Container(
                                                    height: 110.h,
                                                    width: 258.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.circular(15.r),
                                                        image: DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                (server?.mostLovaedDestionation![destIndex].placeToVisits??"").toString()))),
                                                    child: Center(
                                                      child: Opacity(
                                                        opacity: 0.7,
                                                        child: Text(
                                                          // "CANADA",
                                                          (server?.mostLovaedDestionation![destIndex].destinationName??'').toString(),
                                                          style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontFamily: "SegoeUI",
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  // "Niagra Falls (Canada)",
                                                  (server?.mostLovaedDestionation![destIndex].destinationName??"").toString(),
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }

                                ),
                              ),
                              // Container(
                              //     height: 160.h,
                              //     margin: EdgeInsets.only(left: 10.w),
                              //     child: FutureBuilder<
                              //             getmostloveddestinations_catagory_model>(
                              //         future: Getmostloveddestinations_catagory()
                              //             .getmostloveddestinationsList(),
                              //         builder: (context, snapshots) {
                              //           return (snapshots.hasData)
                              //               ? ListView.builder(
                              //                   scrollDirection: Axis.horizontal,
                              //                   itemCount: snapshots.data!.data!.length,
                              //                   itemBuilder: (context, index) {
                              //                     var server = snapshots.data!.data![index];
                              //                     return
                              //                   })
                              //               : Center(child: CircularProgressIndicator());
                              //         })
                              // ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 300.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:  snapshots.data?.data?[index].saftyinformation?.length??0,
                                  itemBuilder: (context,sefindex){

                                    return Container(
                                      height: 300.h,
                                      width: 410.w,
                                      // color: Colors.red,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Your Safety Is Our Priority",
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(
                                              (server?.saftyinformation![sefindex].info!.description??"").toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                fontFamily: "SegoeUI",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                              )),
                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          Container(
                                            //height: 170.h,
                                            margin: EdgeInsets.only(left: 10.w),
                                            child:  SizedBox(
                                              height: 150.h,
                                              child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount:  snapshots.data?.data?[index].saftyinformation?[index].safetyinfo?.length??0,
                                                itemBuilder: (context,sefindex){

                                                  return  Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(right: 10.w),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              height: 120.h,
                                                              width: 250.w,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(15.r),
                                                                  image: DecorationImage(fit: BoxFit.cover, image: NetworkImage( (server?.saftyinformation?[index].safetyinfo![sefindex].safetyinfoPhoto??"").toString(),))),
                                                            ),
                                                            SizedBox(
                                                              height: 5.h,
                                                            ),
                                                            Text(
                                                              (server?.saftyinformation![index].safetyinfo![sefindex].safetyinfoTitle??"").toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16.sp,
                                                                  fontFamily: "SegoeUI",
                                                                  fontWeight: FontWeight.bold,
                                                                  color: Colors.grey),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );

                                                }

                                          ),
                                            ),
                                          ) ],
                                      ),
                                    );
                                  }

                                ),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10.w),
                                child: Text(
                                  "Top Rated Hotels",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TopRatedHotels()));
                                },
                                child: Container(
                                  child: Text(
                                    "View All",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffBE1C1C)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            width: 100,
                            height: 260.h,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 257.h,
                                          width: 216.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                15.r),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/Baga Beach.jpg")),
                                            // color: Colors.green,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 1.5.h,
                                          left: 0.w,
                                          child: Container(
                                            height: 200.h,
                                            width: 250.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(15.r),
                                                gradient: LinearGradient(
                                                    begin: Alignment
                                                        .topCenter,
                                                    end: Alignment
                                                        .bottomCenter,
                                                    colors: [
                                                      Colors
                                                          .transparent,
                                                      Colors.black
                                                          .withOpacity(
                                                          0.9),
                                                    ])),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 50.h,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Alberta",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  "top 10 selling hotels",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Text(
                                                  "From ₹1000 per night",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 15.w,
                                          bottom: 12.h,
                                          child: InkWell(
                                            onTap: () {},
                                            child: InkWell(
                                              child: Container(
                                                height: 30.h,
                                                width: 130.w,
                                                decoration:
                                                BoxDecoration(
                                                  color: Colors
                                                      .transparent,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5.r),
                                                  border: Border.all(
                                                      color:
                                                      Colors.white),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "View Hotels",
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontFamily:
                                                        "SegoeUI",
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        color: Colors
                                                            .white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 216.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                15.r),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/Baga Beach.jpg")),
                                            // color: Colors.green,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 1.5.h,
                                          left: 0.w,
                                          child: Container(
                                            height: 200.h,
                                            width: 250.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(15.r),
                                                gradient: LinearGradient(
                                                    begin: Alignment
                                                        .topCenter,
                                                    end: Alignment
                                                        .bottomCenter,
                                                    colors: [
                                                      Colors
                                                          .transparent,
                                                      Colors.black
                                                          .withOpacity(
                                                          0.9)
                                                    ])),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 50.h,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Alberta",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  "top 10 selling hotels",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Text(
                                                  "From ₹1000 per night",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            left: 15.w,
                                            bottom: 12.h,
                                            child: InkWell(
                                              onTap: () {},
                                              child: InkWell(
                                                child: Container(
                                                  height: 30.h,
                                                  width: 130.w,
                                                  decoration:
                                                  BoxDecoration(
                                                    color: Colors
                                                        .transparent,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        5.r),
                                                    border: Border.all(
                                                        color: Colors
                                                            .white),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "View Hotels",
                                                      style: TextStyle(
                                                          fontSize:
                                                          16.sp,
                                                          fontFamily:
                                                          "SegoeUI",
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          color: Colors
                                                              .white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 216.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                15.r),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/Baga Beach.jpg")),
                                            // color: Colors.green,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 1.5.h,
                                          left: 0.w,
                                          child: Container(
                                            height: 200.h,
                                            width: 250.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(15.r),
                                                gradient: LinearGradient(
                                                    begin: Alignment
                                                        .topCenter,
                                                    end: Alignment
                                                        .bottomCenter,
                                                    colors: [
                                                      Colors
                                                          .transparent,
                                                      Colors.black
                                                          .withOpacity(
                                                          0.9)
                                                    ])),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 50.h,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Alberta",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  "top 10 selling hotels",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Text(
                                                  "From ₹1000 per night",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            left: 15.w,
                                            bottom: 12.h,
                                            child: InkWell(
                                              onTap: () {},
                                              child: InkWell(
                                                child: Container(
                                                  height: 30.h,
                                                  width: 130.w,
                                                  decoration:
                                                  BoxDecoration(
                                                    color: Colors
                                                        .transparent,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        5.r),
                                                    border: Border.all(
                                                        color: Colors
                                                            .white),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "View Hotels",
                                                      style: TextStyle(
                                                          fontSize:
                                                          16.sp,
                                                          fontFamily:
                                                          "SegoeUI",
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          color: Colors
                                                              .white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 10.w),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 250.h,
                                          width: 216.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                15.r),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: AssetImage(
                                                    "assets/Baga Beach.jpg")),
                                            // color: Colors.green,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 1.5.h,
                                          left: 0.w,
                                          child: Container(
                                            height: 200.h,
                                            width: 250.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(15.r),
                                                gradient: LinearGradient(
                                                    begin: Alignment
                                                        .topCenter,
                                                    end: Alignment
                                                        .bottomCenter,
                                                    colors: [
                                                      Colors
                                                          .transparent,
                                                      Colors.black
                                                          .withOpacity(
                                                          0.9)
                                                    ])),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 50.h,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.w),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(
                                                  "Alberta",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      fontWeight:
                                                      FontWeight
                                                          .bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 5.h,
                                                ),
                                                Text(
                                                  "top 10 selling hotels",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                Text(
                                                  "From ₹1000 per night",
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily:
                                                      "SegoeUI",
                                                      //fontWeight: FontWeight.bold,
                                                      color:
                                                      Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            left: 15.w,
                                            bottom: 12.h,
                                            child: InkWell(
                                              onTap: () {},
                                              child: InkWell(
                                                child: Container(
                                                  height: 30.h,
                                                  width: 130.w,
                                                  decoration:
                                                  BoxDecoration(
                                                    color: Colors
                                                        .transparent,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        5.r),
                                                    border: Border.all(
                                                        color: Colors
                                                            .white),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "View Hotels",
                                                      style: TextStyle(
                                                          fontSize:
                                                          16.sp,
                                                          fontFamily:
                                                          "SegoeUI",
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          color: Colors
                                                              .white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          )
                        ],
                      ),

                    );
                  }



                ) : Center(child: CircularProgressIndicator());
              }

              )

      ),

    );
  }
}


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syt/Api.dart';
// import 'package:syt/models/getdestination_catagory_model.dart';
// import 'package:syt/screens/drawerScreen.dart';
// import 'package:syt/screens/honeymoondestinationsScreen.dart';
// import 'package:syt/screens/myplaningScreen.dart';
// import 'package:syt/screens/packagesScreen.dart';
// import 'package:syt/screens/searchScreen.dart';
// import 'package:syt/screens/topratedhotelsScreen.dart';
// import '../models/getmostloveddestinations_catagory_model.dart';
// import '../models/safetyinfo_model.dart';
//
// const categorys = """
// query categorys{
//   categorys{
//     name
//     _id
//     __typename
//   }
// }
// """;
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//   var top;
//   var hei = 362.h;
//   var White = Color(0xffFFFFFF);
//   var greendark = Color(0xff09646D);
//   var color;
//   String _id = "";
//
//   @override
//   void setState(VoidCallback fn) {
//     hei = top;
//     super.setState(fn);
//   }
//
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   bool searchBar = false;
//
//   // void _sendDataToSecondScreen(BuildContext context) {
//   //   var server;
//   //   String catagory_destination=server.categoryName.toString();
//   //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => HoneymoonDestinations()));
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       drawer: DrawerScreen(),
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return [
//             SliverAppBar(
//               //foregroundColor: Colors.green,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(15.r),
//                       bottomLeft: Radius.circular(15.r))),
//               automaticallyImplyLeading: false,
//               backgroundColor: Color(0xff00363D),
//               expandedHeight: 360.h,
//               flexibleSpace:
//               LayoutBuilder(builder: (context, BoxConstraints constraints) {
//                 this.top = constraints.biggest.height;
//                 hei = this.top;
//                 print(top);
//                 print(hei);
//
//                 return ClipRRect(
//                   borderRadius: BorderRadius.only(
//                       bottomRight: Radius.circular(15.r),
//                       bottomLeft: Radius.circular(15.r)),
//                   child: FlexibleSpaceBar(
//                     background: Image.asset(
//                       "assets/Baga Beach.jpg",
//                       fit: BoxFit.cover,
//                     ),
//                     centerTitle: true,
//                     title: (hei > 150.h)
//                         ? InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => MyPlaniing()));
//                       },
//                       child: Container(
//                         height: 32.h,
//                         width: 140.w,
//                         decoration: BoxDecoration(
//                           color: Color(0xff09646D),
//                           borderRadius: BorderRadius.circular(5.r),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: Colors.grey,
//                                 blurRadius: 10.r,
//                                 spreadRadius: 2.r,
//                                 offset: Offset(0, 0))
//                           ],
//                         ),
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(bottom: 2.h),
//                             child: Text(
//                               "Create Custom Package",
//                               style: TextStyle(
//                                   fontSize: 10.sp,
//                                   fontFamily: "SegoeUI",
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                         : null,
//                   ),
//                 );
//               }),
//               leading: IconButton(
//                   onPressed: () {
//                     scaffoldKey.currentState?.openDrawer();
//                     setState(() {
//                       if (hei > 100.h) {
//                         color = greendark;
//                       } else {
//                         color = White;
//                       }
//                     });
//                   },
//                   icon: Icon(Icons.menu),
//                   color: (hei > 100.h) ? Color(0xff09646D) : Colors.white),
//               actions: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     (searchBar == false)
//                         ? Text(
//                       "Search your Desired Location",
//                       style: TextStyle(
//                         fontStyle: FontStyle.italic,
//                         fontSize: 16.sp,
//                         fontFamily: "SegoeUI",
//                         //fontWeight: FontWeight.bold,
//                         //color: Colors.white,
//                         color: Color(0xff09646D),
//                       ),
//                     )
//                         : Container(),
//                   ],
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       searchBar = !searchBar;
//                     });
//                   },
//                   icon: Icon(
//                     (searchBar == false) ? Icons.search_rounded : Icons.close,
//                     size: 30.sp,
//                   ),
//                   color: Color(0xff09646D),
//                 )
//               ],
//               floating: true,
//               pinned: true,
//               title: (searchBar == false)
//                   ? null
//                   : Container(
//                 height: 50.h,
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Color(0xff09646D))),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 10.w),
//                   child: TextFormField(
//                     style: TextStyle(color: Color(0xff09646D)),
//                     onFieldSubmitted: (value) {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => SearchResult()));
//                     },
//                     // onTap: () {
//                     //   Navigator.of(context).push(MaterialPageRoute(
//                     //                                 builder: (context) => SearchResult()));
//                     // },
//                     decoration: InputDecoration(
//                       hintText: "Search your Desired Location",
//                       hintStyle: TextStyle(
//                           fontStyle: FontStyle.italic,
//                           fontSize: 16.sp,
//                           fontFamily: "SegoeUI",
//                           //fontWeight: FontWeight.bold,
//                           color: Color(0xff09646D)),
//                     ),
//                     keyboardType: TextInputType.streetAddress,
//                   ),
//                 ),
//               ),
//             ),
//           ];
//         },
//         body: ListView(
//           children: [
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: 10.w,
//                     ),
//                     Text(
//                       "Are You Looking For?",
//                       style: TextStyle(
//                           fontSize: 18.sp,
//                           fontFamily: "SegoeUI",
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Container(
//                   // width: 100.w,
//                     height: 140.h,
//                     child: FutureBuilder<getdestination_catagoty_model>(
//                         future: Getdestination_catagory().getcategoryList(),
//                         builder: (context, snapshots) {
//                           return (snapshots.hasData)
//                               ? ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: snapshots.data!.data!.length,
//                               itemBuilder: (context, index) {
//                                 var server = snapshots.data!.data![index];
//                                 return Row(children: [
//                                   SizedBox(width: 10.w),
//                                   Column(
//                                     children: [
//                                       InkWell(
//                                         onTap: () async {
//                                           var cat_id =
//                                           server.sId.toString();
//                                           var cat_name = server.categoryName
//                                               .toString();
//
//                                           final SharedPreferences prefs =
//                                           await _prefs;
//                                           prefs.setString("cat_id", cat_id);
//                                           prefs.setString(
//                                               "cat_name", cat_name);
//                                           // print("from home page ");
//                                           //
//                                           // print(
//                                           //     prefs.getString("cat_id"));
//                                           // print(prefs
//                                           //     .getString("cat_name"));
//
//                                           print("from home page ");
//
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       HoneymoonDestinations()));
//                                         },
//                                         child: Container(
//                                           height: 90.h,
//                                           width: 100.w,
//                                           margin:
//                                           EdgeInsets.only(right: 10.w),
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(
//                                                   15.r),
//                                               image: DecorationImage(
//                                                 fit: BoxFit.cover,
//                                                 //image: AssetImage("assets/Baga Beach.jpg"),
//                                                 image: NetworkImage(server
//                                                     .photo
//                                                     .toString()),
//                                               )),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 5.h,
//                                       ),
//                                       InkWell(
//                                         onTap: () async {
//                                           var cat_id =
//                                           server.sId.toString();
//                                           var cat_name = server.categoryName
//                                               .toString();
//
//                                           final SharedPreferences prefs =
//                                           await _prefs;
//                                           prefs.setString("cat_id", cat_id);
//
//                                           prefs.setString(
//                                               "cat_name", cat_name);
//
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       HoneymoonDestinations()));
//                                         },
//                                         child: Text(
//                                           server.categoryName.toString(),
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.grey),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ]);
//                               })
//                               : Center(child: CircularProgressIndicator());
//                         })),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 10.w),
//                       child: Text(
//                         "Most Loved Destinations!",
//                         style: TextStyle(
//                             fontSize: 18.sp,
//                             fontFamily: "SegoeUI",
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>));
//                       },
//                       child: Text(
//                         "View All",
//                         style: TextStyle(
//                             fontSize: 16.sp,
//                             fontFamily: "SegoeUI",
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xffBE1C1C)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Container(
//                     height: 160.h,
//                     margin: EdgeInsets.only(left: 10.w),
//                     child: FutureBuilder<
//                         getmostloveddestinations_catagory_model>(
//                         future: Getmostloveddestinations_catagory()
//                             .getmostloveddestinationsList(),
//                         builder: (context, snapshots) {
//                           return (snapshots.hasData)
//                               ? ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: snapshots.data!.data!.length,
//                               itemBuilder: (context, index) {
//                                 var server = snapshots.data!.data![index];
//                                 return Container(
//                                   margin: EdgeInsets.only(right: 10.w),
//                                   child: Column(
//                                     children: [
//                                       InkWell(
//                                         onTap: () async {
//                                           var destination_id =
//                                           server.sId.toString();
//                                           var destination_name = server
//                                               .destinationName
//                                               .toString();
//                                           var destination_placeToVisit =
//                                           server.placeToVisits
//                                               .toString();
//
//                                           final SharedPreferences prefs =
//                                           await _prefs;
//                                           prefs.setString("destination_id",
//                                               destination_id);
//                                           prefs.setString(
//                                               "destination_name",
//                                               destination_name);
//                                           prefs.setString(
//                                               "destination_placeToVisit",
//                                               destination_placeToVisit);
//
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       PackagesScreen()));
//                                         },
//                                         child: Container(
//                                           height: 110.h,
//                                           width: 258.w,
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius.circular(
//                                                   15.r),
//                                               image: DecorationImage(
//                                                   fit: BoxFit.cover,
//                                                   image: NetworkImage(server
//                                                       .placeToVisits
//                                                       .toString()))),
//                                           child: Center(
//                                             child: Opacity(
//                                               opacity: 0.7,
//                                               child: Text(
//                                                 // "CANADA",
//                                                 server.destinationName
//                                                     .toString(),
//                                                 style: TextStyle(
//                                                   fontSize: 18.sp,
//                                                   fontFamily: "SegoeUI",
//                                                   fontWeight:
//                                                   FontWeight.bold,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 5.h,
//                                       ),
//                                       Text(
//                                         // "Niagra Falls (Canada)",
//                                         server.destinationName.toString(),
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.grey),
//                                       ),
//                                     ],
//                                   ),
//                                 );
//                               })
//                               : Center(child: CircularProgressIndicator());
//                         })),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Container(
//                     height: 300.h,
//                     width: 410.w,
//                     // color: Colors.red,
//                     child: FutureBuilder<safetyinfo_model>(
//                         future: Getseftyinfo().getseftyinfoList(),
//                         builder: (context, snapshots) {
//                           return (snapshots.hasData)
//                               ? ListView.builder(
//                               physics: NeverScrollableScrollPhysics(),
//                               itemCount: snapshots.data!.data!.safetyinfo!.length = 1,
//                               itemBuilder: (context, index) {
//                                 var server = snapshots.data!.data;
//                                 return Column(
//                                   children: [
//                                     Text(
//                                       "Your Safety Is Our Priority",
//                                       style: TextStyle(
//                                           fontSize: 18.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black),
//                                     ),
//                                     SizedBox(
//                                       height: 20.h,
//                                     ),
//                                     Text(
//                                         server!.info!.description.toString(),
//                                         textAlign: TextAlign.center,
//                                         style: TextStyle(
//                                           fontSize: 16.sp,
//                                           fontFamily: "SegoeUI",
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.grey,
//                                         )),
//                                     SizedBox(
//                                       height: 30.h,
//                                     ),
//                                     Container(
//                                       height: 170.h,
//                                       margin: EdgeInsets.only(left: 10.w),
//                                       child: FutureBuilder<safetyinfo_model>(
//                                           future: Getseftyinfo().getseftyinfoList(),
//                                           builder: (context, snapshots) {
//                                             return (snapshots.hasData)
//                                                 ? ListView.builder(
//                                               scrollDirection: Axis.horizontal,
//                                               itemCount: snapshots.data!.data!.safetyinfo!.length,
//                                               itemBuilder: (context, index) {
//                                                 var server1 = snapshots.data!.data;
//                                                 return Row(
//                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       margin: EdgeInsets.only(right: 10.w),
//                                                       child: Column(
//                                                         children: [
//                                                           Container(
//                                                             height: 130.h,
//                                                             width: 250.w,
//                                                             decoration: BoxDecoration(
//                                                                 borderRadius: BorderRadius.circular(15.r),
//                                                                 image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(server1!.safetyinfo![index].safetyinfoPhoto.toString()))),
//                                                           ),
//                                                           SizedBox(
//                                                             height: 5.h,
//                                                           ),
//                                                           Text(
//                                                             server1!.safetyinfo![index].safetyinfoTitle.toString(),
//                                                             style: TextStyle(
//                                                                 fontSize: 16.sp,
//                                                                 fontFamily: "SegoeUI",
//                                                                 fontWeight: FontWeight.bold,
//                                                                 color: Colors.grey),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ],
//                                                 );
//                                               },
//                                             )
//                                                 : Center(
//                                                 child:
//                                                 CircularProgressIndicator());
//                                           }),
//                                     ),
//                                   ],
//                                 );
//                               })
//                               : Center(child: CircularProgressIndicator());
//                         })),
//                 SizedBox(
//                   height: 30.h,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 10.w),
//                       child: Text(
//                         "Top Rated Hotels",
//                         style: TextStyle(
//                             fontSize: 18.sp,
//                             fontFamily: "SegoeUI",
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => TopRatedHotels()));
//                       },
//                       child: Container(
//                         child: Text(
//                           "View All",
//                           style: TextStyle(
//                               fontSize: 16.sp,
//                               fontFamily: "SegoeUI",
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xffBE1C1C)),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10.h,
//                 ),
//                 Container(
//                   // width: 100,
//                   height: 260.h,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       SizedBox(
//                         width: 10.w,
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Stack(
//                             children: [
//                               Container(
//                                 height: 257.h,
//                                 width: 216.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15.r),
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image:
//                                       AssetImage("assets/Baga Beach.jpg")),
//                                   // color: Colors.green,
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 1.5.h,
//                                 left: 0.w,
//                                 child: Container(
//                                   height: 200.h,
//                                   width: 250.w,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15.r),
//                                       gradient: LinearGradient(
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           colors: [
//                                             Colors.transparent,
//                                             Colors.black.withOpacity(0.9),
//                                           ])),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 50.h,
//                                 child: Padding(
//                                   padding: EdgeInsets.only(left: 15.w),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Alberta",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 5.h,
//                                       ),
//                                       Text(
//                                         "top 10 selling hotels",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             //fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Text(
//                                         "From ₹1000 per night",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             //fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 15.w,
//                                 bottom: 12.h,
//                                 child: InkWell(
//                                   onTap: () {},
//                                   child: InkWell(
//                                     child: Container(
//                                       height: 30.h,
//                                       width: 130.w,
//                                       decoration: BoxDecoration(
//                                         color: Colors.transparent,
//                                         borderRadius:
//                                         BorderRadius.circular(5.r),
//                                         border: Border.all(color: Colors.white),
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           "View Hotels",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Stack(
//                             children: [
//                               Container(
//                                 height: 250.h,
//                                 width: 216.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15.r),
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image:
//                                       AssetImage("assets/Baga Beach.jpg")),
//                                   // color: Colors.green,
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 1.5.h,
//                                 left: 0.w,
//                                 child: Container(
//                                   height: 200.h,
//                                   width: 250.w,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15.r),
//                                       gradient: LinearGradient(
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           colors: [
//                                             Colors.transparent,
//                                             Colors.black.withOpacity(0.9)
//                                           ])),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 50.h,
//                                 child: Padding(
//                                   padding: EdgeInsets.only(left: 15.w),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Alberta",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 5.h,
//                                       ),
//                                       Text(
//                                         "top 10 selling hotels",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             //fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Text(
//                                         "From ₹1000 per night",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             //fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                   left: 15.w,
//                                   bottom: 12.h,
//                                   child: InkWell(
//                                     onTap: () {},
//                                     child: InkWell(
//                                       child: Container(
//                                         height: 30.h,
//                                         width: 130.w,
//                                         decoration: BoxDecoration(
//                                           color: Colors.transparent,
//                                           borderRadius:
//                                           BorderRadius.circular(5.r),
//                                           border:
//                                           Border.all(color: Colors.white),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "View Hotels",
//                                             style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontFamily: "SegoeUI",
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ))
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Stack(
//                             children: [
//                               Container(
//                                 height: 250.h,
//                                 width: 216.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15.r),
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image:
//                                       AssetImage("assets/Baga Beach.jpg")),
//                                   // color: Colors.green,
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 1.5.h,
//                                 left: 0.w,
//                                 child: Container(
//                                   height: 200.h,
//                                   width: 250.w,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15.r),
//                                       gradient: LinearGradient(
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           colors: [
//                                             Colors.transparent,
//                                             Colors.black.withOpacity(0.9)
//                                           ])),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 50.h,
//                                 child: Padding(
//                                   padding: EdgeInsets.only(left: 15.w),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Alberta",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 5.h,
//                                       ),
//                                       Text(
//                                         "top 10 selling hotels",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             //fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Text(
//                                         "From ₹1000 per night",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             //fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                   left: 15.w,
//                                   bottom: 12.h,
//                                   child: InkWell(
//                                     onTap: () {},
//                                     child: InkWell(
//                                       child: Container(
//                                         height: 30.h,
//                                         width: 130.w,
//                                         decoration: BoxDecoration(
//                                           color: Colors.transparent,
//                                           borderRadius:
//                                           BorderRadius.circular(5.r),
//                                           border:
//                                           Border.all(color: Colors.white),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "View Hotels",
//                                             style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontFamily: "SegoeUI",
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ))
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(right: 10.w),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Stack(
//                             children: [
//                               Container(
//                                 height: 250.h,
//                                 width: 216.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15.r),
//                                   image: DecorationImage(
//                                       fit: BoxFit.cover,
//                                       image:
//                                       AssetImage("assets/Baga Beach.jpg")),
//                                   // color: Colors.green,
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 1.5.h,
//                                 left: 0.w,
//                                 child: Container(
//                                   height: 200.h,
//                                   width: 250.w,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15.r),
//                                       gradient: LinearGradient(
//                                           begin: Alignment.topCenter,
//                                           end: Alignment.bottomCenter,
//                                           colors: [
//                                             Colors.transparent,
//                                             Colors.black.withOpacity(0.9)
//                                           ])),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 50.h,
//                                 child: Padding(
//                                   padding: EdgeInsets.only(left: 15.w),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Alberta",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 5.h,
//                                       ),
//                                       Text(
//                                         "top 10 selling hotels",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             //fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 3.h,
//                                       ),
//                                       Text(
//                                         "From ₹1000 per night",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             //fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                   left: 15.w,
//                                   bottom: 12.h,
//                                   child: InkWell(
//                                     onTap: () {},
//                                     child: InkWell(
//                                       child: Container(
//                                         height: 30.h,
//                                         width: 130.w,
//                                         decoration: BoxDecoration(
//                                           color: Colors.transparent,
//                                           borderRadius:
//                                           BorderRadius.circular(5.r),
//                                           border:
//                                           Border.all(color: Colors.white),
//                                         ),
//                                         child: Center(
//                                           child: Text(
//                                             "View Hotels",
//                                             style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontFamily: "SegoeUI",
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ))
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40.h,
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
