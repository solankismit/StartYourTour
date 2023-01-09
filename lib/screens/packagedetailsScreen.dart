import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/get_pakege_details_modal.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/screens/bookingScreen.dart';
import 'package:syt/screens/myplaningScreen.dart';
import '../models/get_destinationdata_model.dart';

class PackageDetails extends StatefulWidget {
  @override
  _PackageDetailsState createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var Packages_id = "";
  var getpackagedetails_api = "";
  var destination_id = "";
  var destination_package = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      Packages_id = (prefs.getString("Packages_id"))??"";
      destination_id = (prefs.getString("destination_id"))??"";
      destination_package = (prefs.getString("destination_package"))??"";
    });
  }

  var top;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
                FutureBuilder<get_pakege_details_modal>(
                future: GetPackageDetails().pakegedetailsList(Packages_id),
                builder: (context, snapshots) {
                  return (snapshots.hasData)
                      ? ListView.builder(

                      itemCount: snapshots.data?.data?.length,
                      itemBuilder: (context, index) {
                        var server = snapshots.data!.data![index];
                        var text1 = server.moreDetails.toString();
                        var _travelby = server.travelBy.toString();
                        var _mealrequired = server.mealRequired.toString();
                        var _sightseening = server.sightseeing.toString();

                        // print(_travelby + "top");

                        return Container(
                          height: 860.h,
                          child: NestedScrollView(
                            headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) {
                              return [
                                SliverAppBar(
                                  leading: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Color(0xffffffff),
                                      size: 28.sp,
                                    ),
                                  ),
                                  titleSpacing: 10.w,
                                  floating: true,
                                  pinned: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(15.r),
                                          bottomLeft: Radius.circular(15.r))),
                                  backgroundColor: Color(0xff00363D),
                                  expandedHeight: 350.h,
                                  flexibleSpace: LayoutBuilder(
                                    builder:
                                        (context, BoxConstraints constraints) {
                                      this.top = constraints.biggest.height;
                                      return ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15.r),
                                            bottomLeft: Radius.circular(15.r)),
                                        child: FlexibleSpaceBar(
                                          titlePadding: EdgeInsets.only(
                                              left: (top < 100) ? 50.w : 10.w,
                                              bottom:
                                              (top < 100) ? 20.h : 10.h),
                                          title: Text(
                                            //"CANADA",
                                            server.name.toString(),
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                fontFamily: "SegoeUI",
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white
                                                    .withOpacity(0.7)),
                                          ),
                                          // background: Image.asset("assets/Baga Beach.jpg", fit: BoxFit.fill),
                                          background: Image.network(
                                              server.place![index].photo
                                                  .toString(),
                                              fit: BoxFit.fill),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ];
                            },
                            body: Stack(
                              fit: StackFit.expand,
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: ListView(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            // margin: EdgeInsets.only(right: 10.w),
                                            // height: 280.h,
                                            width: 400.w,
                                            // color: Colors.orange,
                                            child: Column(
                                              children: [
                                                SizedBox(height: 15.h),
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          left: 5.h),
                                                      //height: 50.h,
                                                      width: 370.w,
                                                      // color: Colors.red,
                                                      child: Text(
                                                        //"Canada Package with CN Tower Tour",
                                                        server.name.toString(),
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontFamily: "SegoeUI",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.black),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 30.w,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5.h),
                                                      child: Text(
                                                        // "₹ 2,50,000/-",
                                                        "₹" +
                                                            server.pricePerPerson
                                                                .toString() +
                                                            "/Person",
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontFamily: "SegoeUI",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.black),
                                                      ),
                                                    ),
                                                    // Icon(
                                                    //   Icons.star,
                                                    //   color: Color(0xff1F08B1),
                                                    //   size: 20.sp,
                                                    // ),
                                                    // Icon(
                                                    //   Icons.star,
                                                    //   color: Color(0xff1F08B1),
                                                    //   size: 20.sp,
                                                    // ),
                                                    // Icon(
                                                    //   Icons.star,
                                                    //   color: Color(0xff1F08B1),
                                                    //   size: 20.sp,
                                                    // ),
                                                    // Icon(
                                                    //   Icons.star,
                                                    //   color: Color(0xff1F08B1),
                                                    //   size: 20.sp,
                                                    // ),
                                                    // Icon(
                                                    //   Icons.star_border,
                                                    //   color: Color(0xff1F08B1),
                                                    //   size: 20.sp,
                                                    // ),
                                                    // Text(
                                                    //   "(2074)",
                                                    //   style: TextStyle(
                                                    //       fontSize: 16.sp,
                                                    //       fontFamily: "SegoeUI",
                                                    //       fontWeight: FontWeight.bold,
                                                    //       color: Colors.grey),
                                                    // ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 15.h),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            // "7D-6N",
                                                            server.day.toString(),
                                                            style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontFamily:
                                                                "SegoeUI",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color: Colors.grey),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  EdgeInsets.only(top: 25.h),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Icon(
                                                            Icons.home_filled,
                                                            color:
                                                            Color(0xff09646D),
                                                            size: 28.sp,
                                                          ),
                                                          Text(
                                                            //"Upto 3 Stars",
                                                            "Upto " +
                                                                server.hotelType
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontFamily:
                                                                "SegoeUI",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color: Colors.grey),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          if (_travelby ==
                                                              "Car") ...[
                                                            Icon(
                                                              CupertinoIcons.car,
                                                              color:
                                                              Color(0xff09646D),
                                                              size: 28.sp,
                                                            ),
                                                          ] else if (_travelby ==
                                                              "Plane") ...[
                                                            Icon(
                                                              CupertinoIcons
                                                                  .airplane,
                                                              color:
                                                              Color(0xff09646D),
                                                              size: 28.sp,
                                                            ),
                                                          ] else if (_travelby ==
                                                              "Train") ...[
                                                            Icon(
                                                              CupertinoIcons
                                                                  .tram_fill,
                                                              color:
                                                              Color(0xff09646D),
                                                              size: 28.sp,
                                                            ),
                                                          ] else if (_travelby ==
                                                              "Bus") ...[
                                                            Icon(
                                                              CupertinoIcons.bus,
                                                              color:
                                                              Color(0xff09646D),
                                                              size: 28.sp,
                                                            ),
                                                          ],
                                                          Text(
                                                            // "Flights",
                                                            "By " +
                                                                server.travelBy
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontFamily:
                                                                "SegoeUI",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color: Colors.grey),
                                                          ),
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          if (_mealrequired !=
                                                              "") ...[
                                                            Icon(
                                                              Icons.restaurant,
                                                              color:
                                                              Color(0xff09646D),
                                                              size: 28.sp,
                                                            ),
                                                            Text(
                                                              "Meals",
                                                              //server.packages![index].mealRequired.toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16.sp,
                                                                  fontFamily:
                                                                  "SegoeUI",
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.grey),
                                                            ),
                                                          ] else
                                                            ...[],
                                                        ],
                                                      ),
                                                      Column(
                                                        children: [
                                                          if (_sightseening !=
                                                              "") ...[
                                                            Icon(
                                                              Icons.map,
                                                              color:
                                                              Color(0xff09646D),
                                                              size: 28.sp,
                                                            ),
                                                            Text(
                                                              "Sightseeing",
                                                              //server.packages![index].sightseeing.toString(),
                                                              style: TextStyle(
                                                                  fontSize: 16.sp,
                                                                  fontFamily:
                                                                  "SegoeUI",
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                                  color:
                                                                  Colors.grey),
                                                            ),
                                                          ] else
                                                            ...[],
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                BookingScreen()));
                                                  },
                                                  child: Container(
                                                    margin:
                                                    EdgeInsets.only(top: 20.h),
                                                    height: 35.h,
                                                    width: 180.w,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff09646D),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            blurRadius: 3.r,
                                                            offset: Offset(1, 2))
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        " Customize Now",
                                                        style: TextStyle(
                                                            fontSize: 18.sp,
                                                            fontFamily: "SegoeUI",
                                                            fontWeight:
                                                            FontWeight.bold,
                                                            color: Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 10.h),
                                                Container(
                                                  width: 390.w,
                                                  color: Colors.transparent,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        //margin: EdgeInsets.all(10),
                                                        //color: Colors.green,
                                                        child: ExpansionPanelList(
                                                          elevation: 0,
                                                          animationDuration:
                                                          Duration(
                                                              milliseconds:
                                                              500),
                                                          children: [
                                                            ExpansionPanel(
                                                              headerBuilder:
                                                                  (context,
                                                                  isExpanded) {
                                                                return ListTile(
                                                                  title: Text(
                                                                    //text1.length > 30 ? "${text1.substring(0, 30)}" : text1,
                                                                    //text1,
                                                                    "Overview",
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize:
                                                                      16.sp,
                                                                      fontFamily:
                                                                      "SegoeUI",
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              body: ListTile(
                                                                title: Container(
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    //border: Border.all(width: 1.0)
                                                                  ),
                                                                  child: Text(
                                                                    //"sdcfvghjkjhgfgh",
                                                                    text1,
                                                                    style:
                                                                    TextStyle(
                                                                      fontSize:
                                                                      16.sp,
                                                                      fontFamily:
                                                                      "SegoeUI",
                                                                      //fontWeight: FontWeight.bold,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              isExpanded: _expanded,
                                                              canTapOnHeader: true,
                                                            ),
                                                          ],
                                                          dividerColor:
                                                          Colors.green,
                                                          expansionCallback:
                                                              (panelIndex,
                                                              isExpanded) {
                                                            _expanded = !_expanded;
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   text1.length > 200 ?"${text1.substring(0, 200)}": text1,
                                                      //   //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and",
                                                      //   // server.moreDetails.toString(),
                                                      //   textAlign: TextAlign.left,
                                                      //   //overflow: TextOverflow.ellipsis,
                                                      //   style: TextStyle(
                                                      //     fontSize: 16.sp,
                                                      //     fontFamily: "SegoeUI",
                                                      //     fontWeight: FontWeight.bold,
                                                      //     color: Colors.black,
                                                      //   ),
                                                      // ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            height: 15.h,
                                          ),
                                          Text(
                                            "Itinerary",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          Container(
                                            height: 420.h,
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: snapshots.data!
                                                    .data![index].itinaries!.length,
                                                itemBuilder: (context, index) {
                                                  var text = server
                                                      .itinaries![index].activity
                                                      .toString();
                                                  _showDialog() {
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext context) {
                                                          return Dialog(
                                                            insetPadding:
                                                            EdgeInsets.all(0.w),
                                                            backgroundColor:
                                                            Colors.transparent,
                                                            child: Container(
                                                              height: 542.5.h,
                                                              child:
                                                              ListView.builder(
                                                                  scrollDirection:
                                                                  Axis
                                                                      .horizontal,
                                                                  itemCount: snapshots
                                                                      .data!
                                                                      .data![0]
                                                                      .itinaries!
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                      index) {
                                                                    return Container(
                                                                        margin: EdgeInsets.only(
                                                                            right: 10.w, left: 10.w),
                                                                        height:
                                                                        534.5
                                                                            .h,
                                                                        width: 360
                                                                            .w,
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          color:
                                                                          Colors.white,
                                                                          borderRadius:
                                                                          BorderRadius.circular(10.r),
                                                                          //border: Border.all(color: Color(0xff707070))
                                                                        ),
                                                                        child:
                                                                        Column(
                                                                          //   mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              margin: EdgeInsets.only(right: 10.w, top: 10.h, left: 10.w),
                                                                              height: 160.h,
                                                                              width: 334.5.w,
                                                                              decoration: BoxDecoration(
                                                                                //color: Colors.deepPurple,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.fill,
                                                                                    // image: AssetImage("assets/Baga Beach.jpg")
                                                                                    image: NetworkImage(server.itinaries![index].photo.toString()),
                                                                                  ),
                                                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
                                                                            ),
                                                                            Container(
                                                                              margin: EdgeInsets.only(left: 5.w, top: 10.h),
                                                                              width: 345.w,
                                                                              height: 50.h,
                                                                              child: Text(
                                                                                //"Canada: Arrival and Free day",
                                                                                server.itinaries![index].title.toString(),
                                                                                style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 5.h,
                                                                            ),
                                                                            Text(
                                                                              // "Hotel: Ananta",
                                                                              "Hotel: " + server.itinaries![index].hotelName.toString(),
                                                                              style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 10.h,
                                                                            ),
                                                                            Container(
                                                                              width: 320.w,
                                                                              height: 230.h,
                                                                              //color: Colors.red,
                                                                              child: SingleChildScrollView(
                                                                                scrollDirection: Axis.vertical,
                                                                                child: Text(
                                                                                  // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book......Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                                                                  server.itinaries![index].activity.toString(),
                                                                                  textAlign: TextAlign.left,
                                                                                  style: TextStyle(
                                                                                      fontSize: 16.sp,
                                                                                      fontFamily: "SegoeUI",
                                                                                      //fontWeight: FontWeight.bold,
                                                                                      color: Colors.black),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 15.h,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Container(
                                                                                  height: 28.1.h,
                                                                                  width: 61.w,
                                                                                  decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.only(bottomRight: Radius.circular(10.r), topLeft: Radius.circular(10.r))),
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      //"Day 1",
                                                                                      "Day " + server.itinaries![index].day.toString(),
                                                                                      style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ));
                                                                  }),
                                                            ),
                                                          );
                                                        });
                                                  }

                                                  return Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10.w,
                                                        bottom: 7.h,
                                                        left: 10.w),
                                                    height: 240.h,
                                                    width: 350.w,
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: Colors.grey,
                                                            blurRadius: 3.r,
                                                            offset: Offset(0, 2))
                                                      ],
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          10.r),
                                                      //border: Border.all(color: Color(0xff707070))
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Container(
                                                              width: 60.w,
                                                              height: 30.h,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Color(
                                                                    0xff005158),
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                        9.r),
                                                                    bottomRight: Radius
                                                                        .circular(
                                                                        9.r)),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  //"Day 1",
                                                                  "Day " +
                                                                      server
                                                                          .itinaries![
                                                                      index]
                                                                          .day
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                    fontSize: 16.sp,
                                                                    fontFamily:
                                                                    "SegoeUI",
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10.w,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                              children: [
                                                                Container(
                                                                  width: 280.w,
                                                                  height: 45.h,
                                                                  // color: Colors.red,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                      color: Color(
                                                                          0xdd1e1e1e),
                                                                      borderRadius:
                                                                      BorderRadius.only(
                                                                        bottomLeft:
                                                                        Radius.circular(15.r),
                                                                      )),
                                                                  child: Padding(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                        left:
                                                                        10.w),
                                                                    child: Center(
                                                                      child: Text(
                                                                        //"Canada: Arrival and Free day",
                                                                        server
                                                                            .itinaries![
                                                                        index]
                                                                            .title
                                                                            .toString(),
                                                                        style:
                                                                        TextStyle(
                                                                          fontSize:
                                                                          16.sp,
                                                                          fontFamily:
                                                                          "SegoeUI",
                                                                          fontWeight:
                                                                          FontWeight.bold,
                                                                          color: Colors
                                                                              .white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 15.h,
                                                        ),
                                                        Container(
                                                          height: 120.h,
                                                          width: 300.w,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                    15.r),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                    15.r)),
                                                            image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              //image: AssetImage("assets/Baga Beach.jpg",),
                                                              image: NetworkImage(
                                                                  server
                                                                      .itinaries![
                                                                  index]
                                                                      .photo
                                                                      .toString()),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Container(
                                                          width: 300.w,
                                                          child: Text(
                                                            //"Hotel: Ananta",
                                                            "Hotel : " +
                                                                server
                                                                    .itinaries![
                                                                index]
                                                                    .hotelName
                                                                    .toString(),

                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontFamily:
                                                                "SegoeUI",
                                                                fontWeight:
                                                                FontWeight.bold,
                                                                color:
                                                                Colors.black),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              top: 10.h,
                                                              right: 25.w,
                                                              left: 25.w),
                                                          child: Container(
                                                            height: 110.h,
                                                            width: 300.w,
                                                            //color: Colors.yellow,
                                                            child:
                                                            SingleChildScrollView(
                                                              scrollDirection:
                                                              Axis.vertical,
                                                              child: Text(
                                                                text.length > 200
                                                                    ? "${text.substring(0, 200)}"
                                                                    : text,
                                                                //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever sin and Owing to white ",
                                                                textAlign:
                                                                TextAlign.left,
                                                                style: TextStyle(
                                                                    fontSize: 16.sp,
                                                                    fontFamily:
                                                                    "SegoeUI",
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                _showDialog();
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .fromLTRB(
                                                                    0.w,
                                                                    15.h,
                                                                    20.w,
                                                                    0.h),
                                                                child: Text(
                                                                  "Read More",
                                                                  style: TextStyle(
                                                                    fontSize: 16.sp,
                                                                    fontFamily:
                                                                    "SegoeUI",
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    color: Color(
                                                                        0xffFF0000),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 30.h,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Include Services",
                                                      style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontFamily: "SegoeUI",
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.h),
                                                    Container(
                                                      width: 380.w,
                                                      height: 200.h,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors.grey,
                                                                blurRadius: 3.r,
                                                                offset:
                                                                Offset(1, 2))
                                                          ]),
                                                      child: ListView.builder(
                                                        //scrollDirection: Axis.vertical,
                                                          itemCount: snapshots
                                                              .data!
                                                              .data![index]
                                                              .includeService!
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                top: 10.h,
                                                              ),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 30.w,
                                                                  ),
                                                                  Icon(
                                                                    Icons.check,
                                                                    color: Color(
                                                                        0xff079023),
                                                                    size: 20.sp,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 15.w,
                                                                  ),
                                                                  Container(
                                                                    //height: 100.h,bokk
                                                                    width: 300.w,
                                                                    child: Text(
                                                                      //"Spa and relaxation treatment",
                                                                      server
                                                                          .includeService![
                                                                      index]
                                                                          .serviceName
                                                                          .toString(),
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        16.sp,
                                                                        fontFamily:
                                                                        "SegoeUI",
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                        color: Color(
                                                                            0xff079023),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                    SizedBox(
                                                      height: 30.h,
                                                    ),
                                                    Text(
                                                      "Exclude Services",
                                                      style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontFamily: "SegoeUI",
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 10.h,
                                                    ),
                                                    Container(
                                                      height: 200.h,
                                                      width: 380.w,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors.grey,
                                                                blurRadius: 3.r,
                                                                offset:
                                                                Offset(1, 2))
                                                          ]),
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                          Axis.vertical,
                                                          itemCount: snapshots
                                                              .data!
                                                              .data![index]
                                                              .excludeService!
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  top: 10.h),
                                                              child: Row(
                                                                children: [
                                                                  SizedBox(
                                                                    width: 30.w,
                                                                  ),
                                                                  Icon(
                                                                    Icons.close,
                                                                    color: Color(
                                                                        0xffEE1B1B),
                                                                    size: 20.sp,
                                                                  ),
                                                                  SizedBox(
                                                                    width: 15.w,
                                                                  ),
                                                                  Container(
                                                                    width: 300.w,
                                                                    child: Text(
                                                                      //"Water Activities",
                                                                      server
                                                                          .excludeService![
                                                                      index]
                                                                          .serviceName
                                                                          .toString(),
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        16.sp,
                                                                        fontFamily:
                                                                        "SegoeUI",
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                        color: Color(
                                                                            0xffEE1B1B),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            "Similar Packages",
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          FutureBuilder<get_destinationdata_model>(
                                              future: GetDestinationData()
                                                  .destinationdatalist(
                                                  destination_id),
                                              builder: (context, snapshots) {
                                                return (snapshots.hasData)
                                                    ? Container(
                                                  height: 400.h,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                      Axis.horizontal,
                                                      itemCount: snapshots
                                                          .data!
                                                          .data![index]
                                                          .packages!
                                                          .length,
                                                      //itemCount: 4,
                                                      itemBuilder:
                                                          (context, index) {
                                                        var server1 =
                                                        snapshots.data!
                                                            .data![0];
                                                        var _travelby =
                                                        server1
                                                            .packages![
                                                        index]
                                                            .travelBy
                                                            .toString();
                                                        var _mealrequired =
                                                        server1
                                                            .packages![
                                                        index]
                                                            .mealRequired
                                                            .toString();
                                                        var _sightseening =
                                                        server1
                                                            .packages![
                                                        index]
                                                            .sightseeing
                                                            .toString();
                                                        return Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                              5.w,
                                                              5.h,
                                                              0.w,
                                                              0.h),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              Navigator.of(
                                                                  context)
                                                                  .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                      PackageDetails()));
                                                            },
                                                            child: Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                  right: 10
                                                                      .w,
                                                                  bottom:
                                                                  7.h,
                                                                  top: 4
                                                                      .h),
                                                              height: 337.h,
                                                              width: 377.w,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius: BorderRadius.circular(10.r),
                                                                  // border: Border.all(color: Color(0xff707070)),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                        color: Colors
                                                                            .grey,
                                                                        blurRadius: 3
                                                                            .r,
                                                                        offset: Offset(
                                                                            0,
                                                                            2))
                                                                  ]),
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        top: 15
                                                                            .h,
                                                                        right: 15
                                                                            .w,
                                                                        left:
                                                                        15.w),
                                                                    height:
                                                                    140.h,
                                                                    width:
                                                                    370.w,
                                                                    decoration: BoxDecoration(
                                                                        border: Border.all(color: Color(0xff707070)),
                                                                        borderRadius: BorderRadius.circular(5.r),
                                                                        image: DecorationImage(
                                                                          fit:
                                                                          BoxFit.fill,
                                                                          //image: AssetImage("assets/Baga Beach.jpg")
                                                                          image:
                                                                          NetworkImage(server1.packages![index].place.toString()),
                                                                        )),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right: 5
                                                                            .w,
                                                                        left: 15
                                                                            .w,
                                                                        top: 10
                                                                            .h),
                                                                    child:
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          "Starting From",
                                                                          style: TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.black),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.fromLTRB(
                                                                        15.w,
                                                                        5.h,
                                                                        15.w,
                                                                        0.h),
                                                                    child:
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          //"₹ 2,50,000/ Per Person",
                                                                          "₹ " +
                                                                              server1.packages![index].pricePerPerson.toString() +
                                                                              "/Person",
                                                                          style: TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.black),
                                                                        ),
                                                                        Text(
                                                                          //"7 D-6 N",
                                                                          server1.packages![index].days.toString(),
                                                                          style: TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.grey),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 35
                                                                            .h),
                                                                    child:
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.spaceEvenly,
                                                                      children: [
                                                                        Column(
                                                                          children: [
                                                                            Icon(Icons.home_filled, color: Color(0xff09646D), size: 28.sp),
                                                                            Text(
                                                                              //"Upto 3 Stars",
                                                                              "Upto " + server1.packages![index].hotelType.toString(),
                                                                              style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            // Icon(Icons.airplanemode_active,color: Color(0xff4D2981),size:28.sp),
                                                                            // Text(
                                                                            //   "Flights",
                                                                            //   //"By "+server.packages![index].travelBy.toString(),
                                                                            //   style: TextStyle(
                                                                            //       fontSize: 16.sp,
                                                                            //       fontFamily: "SegoeUI",
                                                                            //       fontWeight: FontWeight.bold,
                                                                            //       color: Colors.grey),
                                                                            // ),
                                                                            if (_travelby == "Car") ...[
                                                                              Icon(
                                                                                CupertinoIcons.car,
                                                                                color: Color(0xff09646D),
                                                                                size: 28.sp,
                                                                              ),
                                                                            ] else if (_travelby == "Plane") ...[
                                                                              Icon(
                                                                                CupertinoIcons.airplane,
                                                                                color: Color(0xff09646D),
                                                                                size: 28.sp,
                                                                              ),
                                                                            ] else if (_travelby == "Train") ...[
                                                                              Icon(
                                                                                CupertinoIcons.tram_fill,
                                                                                color: Color(0xff09646D),
                                                                                size: 28.sp,
                                                                              ),
                                                                            ] else if (_travelby == "Bus") ...[
                                                                              Icon(
                                                                                CupertinoIcons.bus,
                                                                                color: Color(0xff09646D),
                                                                                size: 28.sp,
                                                                              ),
                                                                            ],
                                                                            Text(
                                                                              //"Flights",
                                                                              "By " + server1.packages![index].travelBy.toString(),
                                                                              style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            if (_mealrequired != "") ...[
                                                                              Icon(
                                                                                Icons.restaurant,
                                                                                color: Color(0xff09646D),
                                                                                size: 28.sp,
                                                                              ),
                                                                              Text(
                                                                                "Meals",
                                                                                //server.packages![index].mealRequired.toString(),
                                                                                style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                              ),
                                                                            ] else
                                                                              ...[],
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            // Icon(
                                                                            //     Icons.map,
                                                                            //     color: Color(0xff4D2981),
                                                                            //     size:28.sp
                                                                            // ),
                                                                            // Text(
                                                                            //   "Sightseeing",
                                                                            //   //server.packages![index].sightseeing.toString(),
                                                                            //   style: TextStyle(
                                                                            //       fontSize: 16.sp,
                                                                            //       fontFamily: "SegoeUI",
                                                                            //       fontWeight: FontWeight.bold,
                                                                            //       color: Colors.grey),
                                                                            // ),

                                                                            if (_sightseening != "") ...[
                                                                              Icon(
                                                                                Icons.map,
                                                                                color: Color(0xff09646D),
                                                                              ),
                                                                              Text(
                                                                                "Sightseeing",
                                                                                //server.packages![index].sightseeing.toString(),
                                                                                style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                              ),
                                                                            ] else
                                                                              ...[],
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () {
                                                                      Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              MyPlaniing()));
                                                                    },
                                                                    child:
                                                                    Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                          25.h),
                                                                      height:
                                                                      35.h,
                                                                      width:
                                                                      260.w,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        color:
                                                                        Color(0xff09646D),
                                                                        borderRadius:
                                                                        BorderRadius.circular(10.r),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: Colors.grey,
                                                                              blurRadius: 3.r,
                                                                              offset: Offset(1, 2))
                                                                        ],
                                                                      ),
                                                                      child:
                                                                      Center(
                                                                        child:
                                                                        Padding(
                                                                          padding:
                                                                          EdgeInsets.only(bottom: 2.h),
                                                                          child:
                                                                          Text(
                                                                            "Customize & Get Quote",
                                                                            style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                )
                                                    : Center(
                                                    child:
                                                    CircularProgressIndicator());
                                              }),
                                          SizedBox(
                                            height: 25.h,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                      : Center(child: CircularProgressIndicator());
                }),
              ],
        ));
  }
}