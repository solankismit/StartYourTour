import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/bookpakege_model.dart';
import 'package:syt/models/get_bid_model.dart';
import 'package:syt/screens/bookingScreen.dart';

import '../models/updateBidStatus_model.dart';

class BidDetails extends StatefulWidget {
  String departure,
      destination,
      adult,
      childe,
      infant,
      care;
  BidDetails(
      this.departure,
      this.destination,
      this.adult,
      this.childe,
      this.infant,
      this.care,
      {Key? key})
      : super(key: key);

  @override
  _BidDetailsState createState() => _BidDetailsState();
}

class _BidDetailsState extends State<BidDetails> {

  bookpakege_model data = bookpakege_model();

    String name = "";
    String email = "";
    String phoneNo = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var agencyname = "";
  var agencyprice = "";
  var agencydate = "";
  var agencyid = "";
  dynamic getbid_id = "";
  var totalday ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalperson = int.parse(widget.adult) +
        int.parse(widget.childe) +
        int.parse(widget.infant);



    loaddata();
    dataa(totalday);

  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      agencyname = (prefs.getString("agencyname"))!;
      agencyprice = (prefs.getString("agencyprice"))!;
      agencydate = (prefs.getString("agencydate"))!;
      agencyid = (prefs.getString("agencyid"))!;
      name = (prefs.getString("name"))!;
      email = (prefs.getString("email"))!;
      phoneNo = (prefs.getString("phoneNo"))!;
      print(">>>>>>>>>>>>>>>>>>>>>>>>>");
      print(name + """""""""""""""""""""""""""""""");
      print(email + """""""""""""""""""""""""""""""");
      print(phoneNo + """""""""""""""""""""""""""""""");
      print(">>>>>>>>>>>>>>>>>>>>>>>>>");

    });
  }

  void dataa(var totalday) async{

     //bookpakege_model().data!.totaldays!.toString() as bookpakege_model;


  }



  var totalperson;
  _showDialog2() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Container(
              height: 250.h,
              width: 250.w,
              child: Padding(
                padding: EdgeInsets.all(8.h),
                child: Column(
                  children: [
                    Text(
                      "are you sure you want to reject your tour bid?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Color(0xff004351)),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                    InkWell(
                      onTap: () async{

                        String BidstatusId = agencyid;

                        updateBidStatus_model data =await updateBidStatus().updateBidStatuslist(BidstatusId);
                        const snackBar = SnackBar(
                                 content: Text(
                                      "bid status updated successfully "));
                              ScaffoldMessenger.of(context)
                                 .showSnackBar(snackBar);
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 40.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Color(0xff09646D),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3.r,
                                offset: Offset(1, 2))
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 40.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Color(0xff09646D),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1, 2))
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 2.h),
                            child: Text(
                              "No",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
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
        });
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          height: 80.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _showDialog2();
                },
                child: Container(
                  height: 40.h,
                  width: 175.w,
                  decoration: BoxDecoration(
                    color: Color(0xffFF4C04),
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1, 2))
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Text(
                        "Reject",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async{

                  String  payment_type ="upi"; //data.data?.paymentType.toString()??"";
                  String  bid_package_id = agencyid;
                  print(bid_package_id + "ANkit<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>");
                  String  total_adult = widget.adult;
                  String  total_child = widget.childe;
                  String  total_infant = widget.infant;
                  String  contact_number = phoneNo; //"8511622062";
                  String  email_id =email; //"ankit.webearl@gmail.com";
                  String  approx_start_date ="2022-08-20"; //data.data?.approxStartDate.toString()??"";
                  String  totaldays =  "7"; //data.data?.totaldays!.toString()??"";
                  String  totalnight = "6";//data.data?.totalnight.toString()??"";
                  List  meal = ["lunch","dinner"]; //data.data?.meal.toString()??"";
                  List  meal_type =["veg"]; //data.data?.mealType.toString()??"";
                  String  siteseeing ="include"; //data.data?.siteseeing.toString()??"";
                  String  transport_mode ="car"; //data.data?.transportMode.toString()??"";
                  String  transport_include_exclude ="include"; //data.data?.transportIncludeExclude.toString()??"";
                  String  hoteltype ="5 star"; //data.data?.hoteltype.toString()??"";
                  String  priceperperson ="30000"; //data.data?.priceperperson.toString()??"";
                  String  category ="honeymon"; //data.data?.category.toString()??"";
                  List  booked_include =["sdfg"]; //data.data?.bookedInclude.toString()??"";
                  List  booked_exclude = ["jhgfds"];//data.data?.bookedExclude.toString()??"";
                  String  personal_care = widget.care;
                  String  othere_requirement = "nothing";//data.data?.othereRequirement.toString()??"";
                  String  custom_package_id ="62a04acec216e0694abdb430"; //data.data?.customPackageId.toString()??"";
                  String  departure = widget.departure;
                  String  approx_end_date ="2022-10-02"; //data.data?.approxEndDate.toString()??"";
                  String  user_name = name; //"ankit patel";
                  print(name.toString() + ">>>>>>>>>>>>>>>>>>>>>>>>>>");
                  String  total_person =  (int.parse(widget.adult) + int.parse(widget.infant) + int.parse(widget.childe)).toString();
                  print((int.parse(widget.adult) + int.parse(widget.infant) + int.parse(widget.childe)).toString() + "000000000000000000000");
                  String  agency_contect_no = "1234567089";

                  data = await book_pakege().bookpakegedata(
                      payment_type,
                      bid_package_id,
                      total_adult,
                      total_child,
                      total_infant,
                      contact_number,
                      email_id,
                      approx_start_date,
                      totaldays,
                      totalnight,
                      meal,
                      meal_type,
                      siteseeing,
                      transport_mode,
                      transport_include_exclude,
                      hoteltype,
                      priceperperson,
                      category,
                      booked_include,
                      booked_exclude,
                      personal_care,
                      othere_requirement,
                      custom_package_id,
                      departure,
                      approx_end_date,
                      user_name,
                      total_person,
                      agency_contect_no,
                  );




                  print(bid_package_id + "<><><>><><><><><><><><><><><><><><><");
                  print(total_adult + "<><><>><><><><><><><><><><><><><><><");
                  print(total_child + "<><><>><><><><><><><><><><><><><><><");
                  print(total_infant + "<><><>><><><><><><><><><><><><><><><");


                  final SharedPreferences prefs = await _prefs;

                  String destination = widget.destination;
                  String totalday = data.data?.totaldays.toString()??"";

                  String Id = data!.data?.sId.toString()??"";

                  prefs.setString("bid_package_id", bid_package_id);
                  prefs.setString("total_adult", total_adult);
                  prefs.setString("total_child", total_child);
                  prefs.setString("total_infant", total_infant);
                  prefs.setString("departure", departure);
                  prefs.setString("destination", destination);
                  prefs.setString("totalday", totalday);
                  prefs.setString("Id", Id);
                  print(Id + "0000000000000000000000");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookingScreen(
                        //widget.care,widget.departure,widget.infant,widget.adult,widget.childe,
                      )));
                },
                child: Container(
                  height: 40.h,
                  width: 175.w,
                  decoration: BoxDecoration(
                    color: Color(0xff09646D),
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3,
                          offset: Offset(1, 2))
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 2.h),
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
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
            "Packages Details",
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: Stack(
          fit: StackFit.expand,

          children: [
            Container(

            color: Colors.white,
            child: ListView(
              children: [
                Column(children: [
                  Container(
                    height: 115.h,
                    width: 357.w,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 3.r,
                            offset: Offset(1, 2))
                      ],
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff047B99),
                            Color(0xff023E4D),
                          ]),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 8.h, left: 20.w, bottom: 9.h),
                          child: Row(
                            children: [
                              Text(
                                //"Agency: NR Travels",
                                "Agency: " + agencyname,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w, bottom: 8.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Price:",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    //" ₹ 22,000",
                                    " ₹ " + agencyprice,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff69FF87)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 47.w,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                            right: 47.w,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                // "Date: 25/11/2021",
                                "Date: "+agencydate,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "Total Reviews: 25",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  TabBar(indicatorColor: Color(0xff004351), tabs: [
                    Text(
                        "Overview",
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
                  ]),
                  FutureBuilder<Get_bid_model>(
                      future: GetBid().GetbidList(agencyid),
                      builder: (context, snapshots) {
                        return (snapshots.hasData)
                            ? Container(
                                height: 540.h,
                                child: ListView.builder(
                                    itemCount: snapshots.data?.data?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      print(agencyid + "AnkitChangela>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                                      var server = snapshots.data!.data![index];
                                     // var totalday = server.totalDays.toString();

                                    //  dataa(totalday);


                                      _showDialog() {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                insetPadding:
                                                    EdgeInsets.all(0.w),
                                                backgroundColor:
                                                    Colors.transparent,
                                                child: Container(
                                                  height: 534.5.h,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: snapshots.data!.data![index].itineries!.length,
                                                      itemBuilder: (context, index) {
                                                        return Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 10.w,
                                                                    left: 10.w),
                                                            height: 534.5.h,
                                                            width: 360.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.r),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      right:
                                                                          10.w,
                                                                      top: 10.h,
                                                                      left:
                                                                          10.w),
                                                                  height: 160.h,
                                                                  width: 355.w,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          // color: Colors.deepPurple,
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.fill,
                                                                            // image: AssetImage("assets/Baga Beach.jpg")
                                                                            image:
                                                                                NetworkImage(server.itineries![index].photo.toString()),
                                                                          ),
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(10.r),
                                                                              topRight: Radius.circular(10.r))),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.only(
                                                                      left:
                                                                          10.w,
                                                                      top:
                                                                          10.h),
                                                                  width: 355.w,
                                                                  height: 42.h,
                                                                  child: Text(
                                                                    //"Canada: Arrival and Free day",
                                                                    server
                                                                        .itineries![
                                                                            index]
                                                                        .title
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize: 16
                                                                            .sp,
                                                                        fontFamily:
                                                                            "SegoeUI",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 10.h,
                                                                ),
                                                                Container(
                                                                  width: 320.w,
                                                                  height: 42.h,
                                                                  // color: Colors.green,
                                                                  child: Text(
                                                                    // "Hotel: Ananta",
                                                                    "Hotel: " +
                                                                        server
                                                                            .itineries![index]
                                                                            .hotelName
                                                                            .toString(),
                                                                    style: TextStyle(
                                                                        fontSize: 16
                                                                            .sp,
                                                                        fontFamily:
                                                                            "SegoeUI",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 320.w,
                                                                  height: 215.h,
                                                                  // color: Colors.red,
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    child: Text(
                                                                      // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book......Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                                                      server
                                                                          .itineries![
                                                                              index]
                                                                          .activity
                                                                          .toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
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
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          30.5.h,
                                                                      width:
                                                                          60.w,
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                              .black,
                                                                          borderRadius: BorderRadius.only(
                                                                              bottomRight: Radius.circular(10.r),
                                                                              topLeft: Radius.circular(10.r))),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          //"Day 1",
                                                                          "Day " +
                                                                              server.itineries![index].day.toString(),
                                                                          style: TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Colors.white),
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
                                        height: 540.h,
                                        // color: Colors.yellow,
                                        child: TabBarView(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(top: 20.h),
                                              child: ListView(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.h),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          margin: EdgeInsets.only(bottom: 10.h),
                                                          width: MediaQuery.of(context).size.width,
                                                          decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.grey.shade400,
                                                                offset: Offset(0, 3),
                                                                blurRadius: 10.r,
                                                                spreadRadius: 0.0,
                                                              ),
                                                            ],
                                                            // border: Border.all(color: Color(0xff004351)),
                                                            borderRadius:
                                                                BorderRadius.circular(15.r),
                                                          ),
                                                          child: Padding(
                                                            padding: EdgeInsets.all(10.h),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        //"Ahmedabad To Manali",
                                                                        widget.departure + " To " + widget.destination,
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height: 4.h,
                                                                        ),
                                                                        Text(
                                                                            "Adult (12+ yeras)",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height: 4.h,
                                                                        ),
                                                                        Text(
                                                                            "Infant (2 to 12 years)",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height: 4.h,
                                                                        ),
                                                                        Text(
                                                                            "Child (0 to 2 years)",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height: 4.h,
                                                                        ),
                                                                        Text(
                                                                            "Total person",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            "Personal care",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            "Totals days",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          40.w,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          14.h,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            // "2",
                                                                            widget.adult,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            // "3",
                                                                            widget.infant,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            //"0",
                                                                            widget.childe,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            //"5",
                                                                            (int.parse(widget.adult) + int.parse(widget.infant) + int.parse(widget.childe)).toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            widget.care,
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            //"5",
                                                                            server.totalDays.toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10.h),
                                                          width: MediaQuery.of(context).size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            //border: Border.all(color: Color(0xff004351)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                offset: Offset(
                                                                    0, 3),
                                                                blurRadius: 10,
                                                                spreadRadius:
                                                                    0.0,
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.h),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Approx Departure Between",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 4.h,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        //"11/10/2020 to 16/10/2020",
                                                                        server.startDate1.toString() + " To " + server.endDate1.toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10.h),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            //border: Border.all(color: Color(0xff004351)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                offset: Offset(
                                                                    0, 3),
                                                                blurRadius: 10,
                                                                spreadRadius:
                                                                    0.0,
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.h),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Hotel & Food",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text("Hotel type",
                                                                                style: TextStyle(
                                                                                  fontSize: 16.sp,
                                                                                  fontFamily: "SegoeUI",
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color: Color(0xff004351),
                                                                                )),
                                                                            Icon(
                                                                              Icons.star_rate,
                                                                              size: 16.sp,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            "meal",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            "meals type",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          30.w,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            ":-",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          10.h,
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                                // "2,3",
                                                                                server.hotelTypes.toString(),
                                                                                style: TextStyle(
                                                                                  fontSize: 16.sp,
                                                                                  fontFamily: "SegoeUI",
                                                                                  fontWeight: FontWeight.bold,
                                                                                  color: Color(0xff004351),
                                                                                )),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            // "Breakfast,lunch,dinner",
                                                                            server.mealRequired.toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                        SizedBox(
                                                                          height:
                                                                              4.h,
                                                                        ),
                                                                        Text(
                                                                            // "nonveg",
                                                                            server.mealTypes!.toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 16.sp,
                                                                              fontFamily: "SegoeUI",
                                                                              fontWeight: FontWeight.bold,
                                                                              color: Color(0xff004351),
                                                                            )),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10.h),
                                                          width: MediaQuery.of(context).size.width,
                                                          decoration:
                                                              BoxDecoration(
                                                            //border: Border.all(color: Color(0xff004351)),
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                offset: Offset(
                                                                    0, 3),
                                                                blurRadius: 10,
                                                                spreadRadius:
                                                                    0.0,
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.h),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Travel By",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 4.h,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        //"Train,bus",
                                                                        server
                                                                            .travelBy
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 10.h),
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            // border: Border.all(color: Color(0xff004351)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                offset: Offset(
                                                                    0, 3),
                                                                blurRadius: 10,
                                                                spreadRadius:
                                                                    0.0,
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.h),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Category",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 4.h,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        //"Honeymoon,wildlife,Nature",
                                                                        server
                                                                            .destinationCategory
                                                                            .toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 130.h,
                                                          width: 400.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            // border: Border.all(color: Color(0xff004351)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                offset: Offset(
                                                                    0, 3),
                                                                blurRadius: 10,
                                                                spreadRadius:
                                                                    0.0,
                                                              ),
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.r),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.h),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                        "Othere Requirement",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontFamily:
                                                                              "SegoeUI",
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Color(0xff004351),
                                                                        )),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 4.h,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          20.h,
                                                                      width:
                                                                          350.w,
                                                                      // color: Colors.red,
                                                                      child: Text(
                                                                          server
                                                                              .otherServices
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                16.sp,
                                                                            fontFamily:
                                                                                "SegoeUI",
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            color:
                                                                                Color(0xff004351),
                                                                          )),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 20.h,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: ListView(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 20.w,
                                                        left: 20.w),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            //color: Colors.red,
                                                            child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: 30.h,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .only(),
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    "Include Services",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.sp,
                                                                      fontFamily:
                                                                          "SegoeUI",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          20.h),
                                                                  Container(
                                                                    //width: 300.w,
                                                                    height:
                                                                        200.h,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius: BorderRadius.circular(10.r),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: Colors.grey,
                                                                              blurRadius: 3.r,
                                                                              offset: Offset(1, 2))
                                                                        ]),
                                                                    child: ListView.builder(
                                                                        //scrollDirection: Axis.vertical,
                                                                        itemCount: snapshots.data!.data![index].includeServices!.length,
                                                                        itemBuilder: (context, index) {
                                                                          return Padding(
                                                                            padding:
                                                                                EdgeInsets.only(
                                                                              top: 10.h,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 30.w,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.check,
                                                                                  color: Color(0xff079023),
                                                                                  size: 19.sp,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 15.w,
                                                                                ),
                                                                                Container(
                                                                                  //height: 100.h,
                                                                                  width: 300.w,
                                                                                  child: Text(
                                                                                    //"Spa and relaxation treatment",
                                                                                    server.includeServices![0].includeServicesValue.toString(),
                                                                                    style: TextStyle(
                                                                                      fontSize: 16.sp,
                                                                                      fontFamily: "SegoeUI",
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Color(0xff079023),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          );
                                                                        }),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        30.h,
                                                                  ),
                                                                  Text(
                                                                    "Exlude Services",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18.sp,
                                                                      fontFamily:
                                                                          "SegoeUI",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        20.h,
                                                                  ),
                                                                  Container(
                                                                    height:
                                                                        200.h,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.r),
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            color:
                                                                                Colors.grey,
                                                                            blurRadius:
                                                                                3.r,
                                                                            offset:
                                                                                Offset(1, 2),
                                                                          )
                                                                        ]),
                                                                    child: ListView.builder(
                                                                        scrollDirection: Axis.vertical,
                                                                        itemCount: snapshots.data!.data![index].excludeServices!.length,
                                                                        itemBuilder: (context, index) {
                                                                          return Padding(
                                                                            padding:
                                                                                EdgeInsets.only(top: 10.h),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 30.w,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.close,
                                                                                  color: Color(0xffEE1B1B),
                                                                                  size: 19.sp,
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 15.w,
                                                                                ),
                                                                                Container(
                                                                                  width: 300.w,
                                                                                  child: Text(
                                                                                    //"Water Activities",
                                                                                    server.excludeServices![0].excludeServicesValue.toString(),
                                                                                    style: TextStyle(
                                                                                      fontSize: 16.sp,
                                                                                      fontFamily: "SegoeUI",
                                                                                      fontWeight: FontWeight.bold,
                                                                                      color: Color(0xffEE1B1B),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          );
                                                                        }),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        60.h,
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ))
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 245.h,
                                              color: Colors.white,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: 50.h, bottom: 40.h),
                                                child: ListView.builder(
                                                    scrollDirection: Axis.horizontal,
                                                    itemCount: snapshots.data!.data![index].itineries!.length,
                                                    itemBuilder: (context, index) {
                                                      var text = server.itineries![index].activity.toString();
                                                      return Container(
                                                        margin: EdgeInsets.only(
                                                            right: 10.w,
                                                            left: 10.w),
                                                        height: 240.h,
                                                        width: 350.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors.grey,
                                                                blurRadius: 3.r,
                                                                offset: Offset(0, 2))
                                                          ],
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(10.r),
                                                          //border: Border.all(color: Color(0xff707070))
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  width: 70.w,
                                                                  height: 30.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xff005158),
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                      topLeft: Radius.circular(9.r),
                                                                      bottomRight: Radius.circular(9.r),
                                                                    ),
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      //"Day 1",
                                                                      "Day " +
                                                                          server
                                                                              .itineries![index]
                                                                              .day
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
                                                                SizedBox(
                                                                  width: 20.w,
                                                                ),
                                                                SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.horizontal,
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        260.w,
                                                                    height:
                                                                        50.h,
                                                                    padding: EdgeInsets.only(
                                                                        left: 10
                                                                            .w),
                                                                    // color: Colors.red,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            color:
                                                                                Color(0xff262626),
                                                                            borderRadius: BorderRadius.only(
                                                                              bottomLeft: Radius.circular(15.r),
                                                                            )),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        //"Canada: Arrival and Free day",
                                                                        server
                                                                            .itineries![index]
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
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 20.h,
                                                            ),
                                                            Container(
                                                              height: 150.h,
                                                              width: 320.w,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(15
                                                                            .r),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            15.r)),
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  //image: AssetImage("assets/Baga Beach.jpg",),
                                                                  image: NetworkImage(server.itineries![index].photo.toString()),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 15.h,
                                                            ),
                                                            Container(
                                                              width: 300.w,
                                                              child: Text(
                                                                //"Hotel: Ananta",
                                                                "Hotel: " +
                                                                    server
                                                                        .itineries![
                                                                            index]
                                                                        .hotelName
                                                                        .toString(),

                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18.sp,
                                                                    fontFamily:
                                                                        "SegoeUI",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 10.h,
                                                                      right: 25.w,
                                                                      left: 25.w),
                                                              child: Container(
                                                                height: 125.h,
                                                                width: 300.w,
                                                                //color: Colors.yellow,
                                                                child:
                                                                    SingleChildScrollView(
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  child: Text(
                                                                    text.length >
                                                                            200
                                                                        ? "${text.substring(0, 200)}"
                                                                        : text,
                                                                    //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever sin and Owing to white ",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style: TextStyle(
                                                                        fontSize: 16
                                                                            .sp,
                                                                        fontFamily:
                                                                            "SegoeUI",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    _showDialog();
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets
                                                                        .fromLTRB(
                                                                            0.w,
                                                                            20.h,
                                                                            20.w,
                                                                            0.h),
                                                                    child: Text(
                                                                      "Read More",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            16.sp,
                                                                        fontFamily:
                                                                            "SegoeUI",
                                                                        fontWeight:
                                                                            FontWeight.bold,
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
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            :
                            Center(
                                child: CircularProgressIndicator(
                                backgroundColor: Color(0xffFF4C04),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xff09646D)),
                                strokeWidth: 3,
                              ));
                      })
                ]),
              ],
            )
            ),
          ],
        ),
      ),
    );
  }
}
