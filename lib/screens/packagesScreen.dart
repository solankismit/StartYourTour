// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syt/Api.dart';
// import 'package:syt/models/get_destinationdata_model.dart';
// import 'package:syt/screens/myplaningScreen.dart';
// import 'package:syt/screens/packagedetailsScreen.dart';
//
// import 'top_trending_packages_viewall.dart';
//
// class PackagesScreen extends StatefulWidget {
//   @override
//   _PackagesScreenState createState() => _PackagesScreenState();
// }
//
// class _PackagesScreenState extends State<PackagesScreen> {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//   String destination_id = "";
//   String destination_name = "";
//   var destination_package = "";
//   String destination_placeToVisit = "";
//
//   @override
//   void initState() {
//     super.initState();
//     loaddata();
//   }
//
//   void loaddata() async {
//     final SharedPreferences prefs = await _prefs;
//     setState(() {
//       destination_id = (prefs.getString("destination_id"))!;
//       print(prefs.getString("destination_id").toString() + "=========+++++++++++++++++++++");
//       destination_name = (prefs.getString("destination_name"))!;
//       print(prefs.getString("destination_name").toString() + "=========+++++++++++++++++++++");
//       destination_package = (prefs.getString("destination_package"))!;
//       print(prefs.getString("destination_package").toString() + "+++++++++++++++++++++******************");
//       destination_placeToVisit = (prefs.getString("destination_placeToVisit"))!;
//       print(prefs.getString("destination_placeToVisit").toString() + "'''''''''''''''''''''''''''''''''''''''''''");
//     });
//   }
//
//   var top;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//           fit: StackFit.expand,
//           children: [
//             FutureBuilder<get_destinationdata_model>(
//             future: GetDestinationData().destinationdatalist(destination_id),
//             builder: (context, snapshots) {
//               return (snapshots.hasData)
//                   ? ListView.builder(
//                       itemCount: snapshots.data!.data?.length,
//                       itemBuilder: (context, index) {
//                         var server = snapshots.data!.data![index];
//                         var _travel1 =
//                             server.destination!.howToReach.toString();
//                         print(_travel1);
//                         print("================>>>>>>>>>0");
//
//                         return Container(
//                           height: 850.h,
//                           child: NestedScrollView(
//                               headerSliverBuilder: (BuildContext context,
//                                   bool innerBoxIsScrolled) {
//                                 return [
//                                   SliverAppBar(
//                                       leading: IconButton(
//                                         onPressed: () {
//                                           Navigator.pop(context);
//                                         },
//                                         icon: Icon(
//                                           Icons.arrow_back,
//                                           color: Color(0xffffffff),
//                                         ),
//                                       ),
//                                       titleSpacing: 10.w,
//                                       floating: true,
//                                       pinned: true,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.only(
//                                               bottomRight:
//                                                   Radius.circular(15.r),
//                                               bottomLeft:
//                                                   Radius.circular(15.r))),
//                                       backgroundColor: Color(0xff00363D),
//                                       expandedHeight: 300.h,
//                                       flexibleSpace: LayoutBuilder(builder:
//                                           (context,
//                                               BoxConstraints constraints) {
//                                         this.top = constraints.biggest.height;
//                                         print(top);
//                                         return ClipRRect(
//                                           borderRadius: BorderRadius.only(
//                                               bottomRight:
//                                                   Radius.circular(15.r),
//                                               bottomLeft:
//                                                   Radius.circular(15.r)),
//                                           child: FlexibleSpaceBar(
//                                             titlePadding: EdgeInsets.only(
//                                                 left: (top < 100) ? 50.w : 10.w,
//                                                 bottom:
//                                                     (top < 100) ? 20.h : 10.h),
//                                             title: Text(
//                                               //"CANADA",
//                                               destination_name,
//                                               style: TextStyle(
//                                                   fontSize: 20.sp,
//                                                   fontFamily: "SegoeUI",
//                                                   fontStyle: FontStyle.italic,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.white
//                                                       .withOpacity(0.7)),
//                                             ),
//                                             //background: Image.network("https://start-your-tour-api.herokuapp.com/images/placephoto/Chandra Taal.jpg",fit: BoxFit.fill),
//                                             background: Image.network(
//                                                 server.destination!.photo
//                                                     .toString(),
//                                                 fit: BoxFit.cover),
//                                             // background: Image.network(destination_placeToVisit,fit: BoxFit.cover),
//                                           ),
//                                         );
//                                       }))
//                                 ];
//                               },
//                               body: Container(
//                                 color: Colors.white,
//                                 child: ListView(
//                                   children: [
//                                     Column(
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 11.w,
//                                               right: 11.w,
//                                               bottom: 25.h,
//                                               top: 20.h),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     "Best Time to Visit",
//                                                     style: TextStyle(
//                                                         fontSize: 16.sp,
//                                                         fontFamily: "SegoeUI",
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Colors.black),
//                                                   ),
//                                                   Text(
//                                                     "Starting From",
//                                                     style: TextStyle(
//                                                         fontSize: 16.sp,
//                                                         fontFamily: "SegoeUI",
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Colors.black),
//                                                   ),
//                                                 ],
//                                               ),
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Text(
//                                                     //"Oct - Fab (550 Bookings)",
//                                                     server.destination!
//                                                         .bestTimeForVisit
//                                                         .toString(),
//                                                     style: TextStyle(
//                                                         fontSize: 16.sp,
//                                                         fontFamily: "SegoeUI",
//                                                         fontWeight:
//                                                             FontWeight.bold,
//                                                         color: Colors.grey),
//                                                   ),
//                                                   Text(
//                                                     // "₹ 1070/ Month",
//                                                     "₹ " +
//                                                         server.packages![index].pricePerPerson.toString() +
//                                                         "/Person",
//                                                     style: TextStyle(
//                                                       fontSize: 16.sp,
//                                                       fontFamily: "SegoeUI",
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       color: Colors.black,
//                                                     ),
//                                                   )
//                                                 ],
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Container(
//                                               margin:
//                                                   EdgeInsets.only(left: 10.w),
//                                               child: Text(
//                                                 "Top Trending Packages",
//                                                 style: TextStyle(
//                                                     fontSize: 18.sp,
//                                                     fontFamily: "SegoeUI",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.black),
//                                               ),
//                                             ),
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.of(context).push(
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             top_trading_packages_viewall()));
//                                               },
//                                               child: Text(
//                                                 "View All",
//                                                 style: TextStyle(
//                                                     fontSize: 16.sp,
//                                                     fontFamily: "SegoeUI",
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Color(0xffBE1C1C)),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 5.h,
//                                         ),
//                                         FutureBuilder<
//                                                 get_destinationdata_model>(
//                                             future: GetDestinationData()
//                                                 .destinationdatalist(
//                                                     destination_id),
//                                             builder: (context, snapshot) {
//                                               return (snapshots.hasData)
//                                                   ? Container(
//                                                       height: 390.h,
//                                                       // width: 380.w,
//                                                       child: ListView.builder(
//                                                           scrollDirection:
//                                                               Axis.horizontal,
//                                                           itemCount: snapshots
//                                                               .data!
//                                                               .data![index]
//                                                               .packages!
//                                                               .length,
//                                                           itemBuilder:
//                                                               (context, index) {
//                                                             var _travelby =
//                                                                 server
//                                                                     .packages![
//                                                                         index]
//                                                                     .travelBy
//                                                                     .toString();
//                                                             var _mealrequired =
//                                                                 server
//                                                                     .packages![
//                                                                         index]
//                                                                     .travelBy
//                                                                     .toString();
//                                                             var _sightseening =
//                                                                 server
//                                                                     .packages![
//                                                                         index]
//                                                                     .sightseeing
//                                                                     .toString();
//                                                             return Padding(
//                                                               padding:
//                                                                   EdgeInsets
//                                                                       .fromLTRB(
//                                                                           10.w,
//                                                                           5.h,
//                                                                           0.w,
//                                                                           0.h),
//                                                               child: InkWell(
//                                                                 onTap:
//                                                                     () async {
//                                                                   var Packages_id = server
//                                                                       .packages![
//                                                                           index]
//                                                                       .sId
//                                                                       .toString();
//                                                                   final SharedPreferences
//                                                                       prefs =
//                                                                       await _prefs;
//                                                                   prefs.setString(
//                                                                       "Packages_id",
//                                                                       Packages_id);
//                                                                   Navigator.of(
//                                                                           context)
//                                                                       .push(MaterialPageRoute(
//                                                                           builder: (context) =>
//                                                                               PackageDetails()));
//                                                                 },
//                                                                 child:
//                                                                     Container(
//                                                                   margin: EdgeInsets.only(
//                                                                       right:
//                                                                           10.w,
//                                                                       bottom:
//                                                                           7.h,
//                                                                       top: 5.h),
//                                                                   height: 130.h,
//                                                                   width: 370.w,
//                                                                   decoration: BoxDecoration(
//                                                                       color: Colors
//                                                                           .white,
//                                                                       borderRadius: BorderRadius.circular(10.r),
//                                                                       // border: Border.all(color: Color(0xff707070)),
//                                                                       boxShadow: [
//                                                                         BoxShadow(
//                                                                             color:
//                                                                                 Colors.grey,
//                                                                             blurRadius: 3.r,
//                                                                             offset: Offset(0, 2))
//                                                                       ]),
//                                                                   child: Column(
//                                                                     children: [
//                                                                       Container(
//                                                                         margin: EdgeInsets.only(
//                                                                             top:
//                                                                                 15.h,
//                                                                             right: 5.w,
//                                                                             left: 5.w),
//                                                                         height:
//                                                                             130.h,
//                                                                         width:
//                                                                             350.w,
//                                                                         decoration: BoxDecoration(
//                                                                             border: Border.all(color: Color(0xff707070)),
//                                                                             borderRadius: BorderRadius.circular(5.r),
//                                                                             image: DecorationImage(
//                                                                               fit: BoxFit.fill,
//                                                                               //image: AssetImage("assets/Baga Beach.jpg")
//                                                                               image: NetworkImage(server.packages![index].place.toString()),
//                                                                             )),
//                                                                       ),
//                                                                       Padding(
//                                                                         padding: EdgeInsets.only(
//                                                                             right:
//                                                                                 5.w,
//                                                                             left: 15.w,
//                                                                             top: 15.h),
//                                                                         child:
//                                                                             Row(
//                                                                           children: [
//                                                                             Text(
//                                                                               "Starting From",
//                                                                               style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                       Padding(
//                                                                         padding: EdgeInsets.fromLTRB(
//                                                                             15.w,
//                                                                             5.h,
//                                                                             5.w,
//                                                                             0.h),
//                                                                         child:
//                                                                             Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceBetween,
//                                                                           children: [
//                                                                             Text(
//                                                                               //"₹ 2,50,000/ Per Person",
//                                                                               "₹ " + server.packages![index].pricePerPerson.toString() + "/Person",
//                                                                               style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
//                                                                             ),
//                                                                             Padding(
//                                                                               padding: EdgeInsets.only(right: 15.w),
//                                                                               child: Text(
//                                                                                 //"7 D-6 N",
//                                                                                 server.packages![index].days.toString(),
//                                                                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                       Padding(
//                                                                         padding:
//                                                                             EdgeInsets.only(top: 30.h),
//                                                                         child:
//                                                                             Row(
//                                                                           mainAxisAlignment:
//                                                                               MainAxisAlignment.spaceEvenly,
//                                                                           children: [
//                                                                             Column(
//                                                                               children: [
//                                                                                 Icon(
//                                                                                   Icons.home_filled,
//                                                                                   color: Color(0xff09646D),
//                                                                                   size: 28.sp,
//                                                                                 ),
//                                                                                 Text(
//                                                                                   //"Upto 3 Stars",
//                                                                                   "Upto " + server.packages![index].hotelType.toString(),
//                                                                                   style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                             Column(
//                                                                               children: [
//                                                                                 if (_travelby == "Car") ...[
//                                                                                   Icon(
//                                                                                     CupertinoIcons.car,
//                                                                                     color: Color(0xff09646D),
//                                                                                     size: 28.sp,
//                                                                                   ),
//                                                                                 ] else if (_travelby == "Flight") ...[
//                                                                                   Icon(
//                                                                                     CupertinoIcons.airplane,
//                                                                                     color: Color(0xff09646D),
//                                                                                     size: 28.sp,
//                                                                                   ),
//                                                                                 ] else if (_travelby == "Train") ...[
//                                                                                   Icon(
//                                                                                     CupertinoIcons.tram_fill,
//                                                                                     color: Color(0xff09646D),
//                                                                                     size: 28.sp,
//                                                                                   ),
//                                                                                 ] else if (_travelby == "Bus") ...[
//                                                                                   Icon(
//                                                                                     CupertinoIcons.bus,
//                                                                                     color: Color(0xff09646D),
//                                                                                     size: 28.sp,
//                                                                                   ),
//                                                                                 ],
//                                                                                 Text(
//                                                                                   // "Flights",
//                                                                                   "By " + server.packages![index].travelBy.toString(),
//                                                                                   style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
//                                                                                 ),
//                                                                               ],
//                                                                             ),
//                                                                             Column(
//                                                                               children: [
//                                                                                 if (_mealrequired != "") ...[
//                                                                                   Icon(
//                                                                                     Icons.restaurant,
//                                                                                     color: Color(0xff09646D),
//                                                                                     size: 28.sp,
//                                                                                   ),
//                                                                                   Text(
//                                                                                     "Meals",
//                                                                                     //server.packages![index].mealRequired.toString(),
//                                                                                     style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
//                                                                                   ),
//                                                                                 ] else
//                                                                                   ...[],
//                                                                               ],
//                                                                             ),
//                                                                             Column(
//                                                                               children: [
//                                                                                 if (_sightseening != "") ...[
//                                                                                   Icon(
//                                                                                     Icons.map,
//                                                                                     color: Color(0xff09646D),
//                                                                                     size: 28.sp,
//                                                                                   ),
//                                                                                   Text(
//                                                                                     "Sightseeing",
//                                                                                     //server.packages![index].sightseeing.toString(),
//                                                                                     style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
//                                                                                   ),
//                                                                                 ] else
//                                                                                   ...[],
//                                                                               ],
//                                                                             ),
//                                                                           ],
//                                                                         ),
//                                                                       ),
//                                                                       InkWell(
//                                                                         onTap:
//                                                                             () {
//                                                                           Navigator.of(context)
//                                                                               .push(MaterialPageRoute(builder: (context) => MyPlaniing()));
//                                                                         },
//                                                                         child:
//                                                                             Container(
//                                                                           margin:
//                                                                               EdgeInsets.only(top: 25.h),
//                                                                           height:
//                                                                               35.h,
//                                                                           width:
//                                                                               200.w,
//                                                                           decoration:
//                                                                               BoxDecoration(
//                                                                             color:
//                                                                                 Color(0xff09646D),
//                                                                             borderRadius:
//                                                                                 BorderRadius.circular(10.r),
//                                                                             boxShadow: [
//                                                                               BoxShadow(color: Colors.grey, blurRadius: 3.r, offset: Offset(1, 2))
//                                                                             ],
//                                                                           ),
//                                                                           child:
//                                                                               Center(
//                                                                             child:
//                                                                                 Padding(
//                                                                               padding: EdgeInsets.only(bottom: 2.h),
//                                                                               child: Text(
//                                                                                 "Customize & Get Quote",
//                                                                                 style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             );
//                                                           }),
//                                                     )
//                                                   : CircularProgressIndicator();
//                                             })
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 40.h,
//                                     ),
//                                     FutureBuilder<get_destinationdata_model>(
//                                         future: GetDestinationData().destinationdatalist(destination_id),
//                                         builder: (context, snapshot) {
//                                           print(server.placeToVisit![index].destinationId.toString() + "????????????????????????????????" );
//                                           return (snapshots.hasData)
//                                               ? Container(
//                                                   height: 150.h,
//                                                   // color: Colors.green,
//                                                   child: ListView.builder(
//                                                       scrollDirection:
//                                                           Axis.horizontal,
//                                                       itemCount: snapshots
//                                                           .data!
//                                                           .data![index]
//                                                           .placeToVisit!
//                                                           .length,
//                                                       itemBuilder:
//                                                           (context, index) {
//                                                         _showDialog() {
//                                                           showDialog(
//                                                               context: context,
//                                                               builder:
//                                                                   (BuildContext
//                                                                       context) {
//                                                                 return Dialog(insetPadding: EdgeInsets.all(0.w),
//                                                                   backgroundColor:
//                                                                       Colors
//                                                                           .transparent,
//                                                                   child:
//                                                                       Container(
//                                                                     height:
//                                                                         650.h,
//                                                                     width:
//                                                                         380.w,
//                                                                     // color: Colors.transparent,
//                                                                     child: ListView.builder(
//                                                                         scrollDirection: Axis.horizontal,
//                                                                         itemCount: snapshots.data!.data![0].placeToVisit!.length,
//                                                                         itemBuilder: (context, index) {
//                                                                           return Container(
//                                                                               margin: EdgeInsets.only(right: 10.w, left: 10.w),
//                                                                               height: MediaQuery.of(context).size.height / 2,
//                                                                               width: MediaQuery.of(context).size.width / 1.3,
//                                                                               decoration: BoxDecoration(
//                                                                                 color: Colors.white,
//                                                                                 borderRadius: BorderRadius.circular(10.r),
//                                                                                 // border: Border.all(color: Color(0xff707070)),
//                                                                               ),
//                                                                               child: Stack(
//                                                                                 alignment: Alignment.topCenter,
//                                                                                 children: [
//                                                                                   Container(
//                                                                                     margin: EdgeInsets.only(right: 10.w, top: 10.h, left: 10.w),
//                                                                                     height: 180.h,
//                                                                                     width: 290.w,
//                                                                                     decoration: BoxDecoration(
//                                                                                         image: DecorationImage(
//                                                                                             fit: BoxFit.fill,
//                                                                                             //image: AssetImage("assets/Baga Beach.jpg")
//                                                                                             image: NetworkImage(server.placeToVisit![index].photo.toString()
//                                                                                             )
//                                                                                         ),
//                                                                                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
//                                                                                   ),
//                                                                                   Positioned(
//                                                                                     top: 200.h,
//                                                                                     child: Text(
//                                                                                       //"Canada: Arrival and Free day",
//                                                                                       server.placeToVisit![index].name.toString(),
//                                                                                       style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
//                                                                                     ),
//                                                                                   ),
//                                                                                   Padding(
//                                                                                     padding: EdgeInsets.only(top: 245.h, right: 25.w, left: 25.w),
//                                                                                     child: Container(
//                                                                                       width: 280.w,
//                                                                                       height: 380.h,
//                                                                                       color: Colors.transparent,
//                                                                                       child: SingleChildScrollView(
//                                                                                         scrollDirection: Axis.vertical,
//                                                                                         child: Text(
//                                                                                           //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book......Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
//                                                                                           server.placeToVisit![index].description.toString(),
//                                                                                           textAlign: TextAlign.left,
//                                                                                           style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
//                                                                                         ),
//                                                                                       ),
//                                                                                     ),
//                                                                                   ),
//                                                                                 ],
//                                                                               ));
//                                                                         }),
//                                                                   ),
//                                                                 );
//                                                               });
//                                                         }
//
//                                                         return Padding(
//                                                           padding: EdgeInsets
//                                                               .fromLTRB(
//                                                                   5.w,
//                                                                   0.h,
//                                                                   2.w,
//                                                                   0.h),
//                                                           child: Column(
//                                                             children: [
//                                                               InkWell(
//                                                                 onTap: () {
//                                                                   _showDialog();
//                                                                 },
//                                                                 child:
//                                                                     Container(
//                                                                   height: 100.h,
//                                                                   width: 220.w,
//                                                                   decoration: BoxDecoration(
//                                                                       border: Border.all(color: Color(0xff707070)),
//                                                                       borderRadius: BorderRadius.circular(15.r),
//                                                                       image: DecorationImage(
//                                                                           fit: BoxFit.fill,
//                                                                           // image: AssetImage("assets/Baga Beach.jpg",)
//                                                                           image: NetworkImage(server.placeToVisit![index].photo.toString()))),
//                                                                 ),
//                                                               ),
//                                                               SizedBox(
//                                                                 height: 10.h,
//                                                               ),
//                                                               Text(
//                                                                 //"CN Tower (Canada)",
//                                                                 server
//                                                                     .placeToVisit![
//                                                                         index]
//                                                                     .name
//                                                                     .toString(),
//                                                                 style: TextStyle(
//                                                                     fontSize:
//                                                                         16.sp,
//                                                                     fontFamily:
//                                                                         "SegoeUI",
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold,
//                                                                     color: Colors
//                                                                         .grey),
//                                                               ),
//                                                             ],
//                                                           ),
//                                                         );
//                                                       }),
//                                                 )
//                                               : CircularProgressIndicator();
//                                         }),
//                                     SizedBox(
//                                       height: 30.h,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Text(
//                                           "How To Reach " +
//                                               server
//                                                   .destination!.destinationName
//                                                   .toString(),
//                                           style: TextStyle(
//                                               fontSize: 18.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         if (_travel1 == "Car") ...[
//                                           Icon(
//                                             CupertinoIcons.car,
//                                             color: Color(0xff09646D),
//                                             size: 25.sp,
//                                           ),
//                                         ] else if (_travel1 == "Flight") ...[
//                                           Icon(
//                                             CupertinoIcons.airplane,
//                                             color: Color(0xff09646D),
//                                             size: 25.sp,
//                                           ),
//                                         ] else if (_travel1 == "Train") ...[
//                                           Icon(
//                                             CupertinoIcons.tram_fill,
//                                             color: Color(0xff09646D),
//                                             size: 25.sp,
//                                           ),
//                                         ] else if (_travel1 == "Bus") ...[
//                                           Icon(
//                                             CupertinoIcons.bus,
//                                             color: Color(0xff09646D),
//                                             size: 25.sp,
//                                           ),
//                                         ],
//                                         SizedBox(
//                                           width: 5.w,
//                                         ),
//                                         Text(
//                                           //"By Air",
//                                           "By " +
//                                               server.destination!.howToReach
//                                                   .toString(),
//                                           //server.placeToVisit![index].name.toString(),
//                                           style: TextStyle(
//                                               fontSize: 18.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.black),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 20.h,
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.only(
//                                           right: 18.w, left: 18.w),
//                                       child: Text(
//                                         // "Lprem is very wonderful experience.ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit. Lprem is very wonderful ex perience.ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit. Lprem is very wonderful experience.ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit.",
//                                         "       " +
//                                             server.destination!.aboutDestination
//                                                 .toString(),
//                                         textAlign: TextAlign.left,
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.grey),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 30.h,
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                         );
//                       })
//                   : Center(child: CircularProgressIndicator());
//             }),
//           ],
//         ));
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/screens/myplaningScreen.dart';
import 'package:syt/screens/packagedetailsScreen.dart';

import 'top_trending_packages_viewall.dart';

class PackagesScreen extends StatefulWidget {
  @override
  _PackagesScreenState createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var destination_id = "";
  var destination_name = "";
  var destination_placeToVisit = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      destination_id = (prefs.getString("destination_id"))!;
      destination_name = (prefs.getString("destination_name"))!;
      destination_placeToVisit = (prefs.getString("destination_placeToVisit"))!;
    });
  }

  var top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<get_destinationdata_model>(
            future: GetDestinationData().destinationdatalist(destination_id),
            builder: (context, snapshots) {
              return (snapshots.hasData)
                  ? ListView.builder(
                      itemCount: snapshots.data!.data!.length,
                      itemBuilder: (context, index) {
                        var server = snapshots.data!.data![index];
                        var _travel1 =
                            server.destination!.howToReach.toString();
                        print(_travel1);
                        print("================>>>>>>>>>0");

                        return Container(
                          height: 850.h,
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
                                        ),
                                      ),
                                      titleSpacing: 10.w,
                                      floating: true,
                                      pinned: true,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(15.r),
                                              bottomLeft:
                                                  Radius.circular(15.r))),
                                      backgroundColor: Color(0xff00363D),
                                      expandedHeight: 300.h,
                                      flexibleSpace: LayoutBuilder(builder:
                                          (context,
                                              BoxConstraints constraints) {
                                        this.top = constraints.biggest.height;
                                        print(top);
                                        return ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(15.r),
                                              bottomLeft:
                                                  Radius.circular(15.r)),
                                          child: FlexibleSpaceBar(
                                            titlePadding: EdgeInsets.only(
                                                left: (top < 100) ? 50.w : 10.w,
                                                bottom:
                                                    (top < 100) ? 20.h : 10.h),
                                            title: Text(
                                              //"CANADA",
                                              destination_name,
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  fontFamily: "SegoeUI",
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white
                                                      .withOpacity(0.7)),
                                            ),
                                            //background: Image.network("https://start-your-tour-api.herokuapp.com/images/placephoto/Chandra Taal.jpg",fit: BoxFit.fill),
                                            background: Image.network(
                                                server.destination!.photo
                                                    .toString(),
                                                fit: BoxFit.cover),
                                            // background: Image.network(destination_placeToVisit,fit: BoxFit.cover),
                                          ),
                                        );
                                      }))
                                ];
                              },
                              body: Container(
                                color: Colors.white,
                                child: ListView(
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 11.w,
                                              right: 11.w,
                                              bottom: 25.h,
                                              top: 20.h),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Best Time to Visit",
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontFamily: "SegoeUI",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                  Text(
                                                    "Starting From",
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontFamily: "SegoeUI",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    //"Oct - Fab (550 Bookings)",
                                                    server.destination!
                                                        .bestTimeForVisit
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontFamily: "SegoeUI",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.grey),
                                                  ),
                                                  Text(
                                                    // "₹ 1070/ Month",
                                                    "₹ " +
                                                        server.packages![index]
                                                            .pricePerPerson
                                                            .toString() +
                                                        "/Person",
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontFamily: "SegoeUI",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(left: 10.w),
                                              child: Text(
                                                "Top Trending Packages",
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
                                                            top_trading_packages_viewall()));
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
                                          height: 5.h,
                                        ),
                                        FutureBuilder<
                                                get_destinationdata_model>(
                                            future: GetDestinationData()
                                                .destinationdatalist(
                                                    destination_id),
                                            builder: (context, snapshot) {
                                              return (snapshots.hasData)
                                                  ? Container(
                                                      height: 390.h,
                                                      // width: 380.w,
                                                      child: ListView.builder(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount: snapshots
                                                              .data!
                                                              .data![index]
                                                              .packages!
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            var _travelby =
                                                                server
                                                                    .packages![
                                                                        index]
                                                                    .travelBy
                                                                    .toString();
                                                            var _mealrequired =
                                                                server
                                                                    .packages![
                                                                        index]
                                                                    .travelBy
                                                                    .toString();
                                                            var _sightseening =
                                                                server
                                                                    .packages![
                                                                        index]
                                                                    .sightseeing
                                                                    .toString();
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          10.w,
                                                                          5.h,
                                                                          0.w,
                                                                          0.h),
                                                              child: InkWell(
                                                                onTap:
                                                                    () async {
                                                                  var Packages_id = server
                                                                      .packages![
                                                                          index]
                                                                      .sId
                                                                      .toString();
                                                                  final SharedPreferences
                                                                      prefs =
                                                                      await _prefs;
                                                                  prefs.setString(
                                                                      "Packages_id",
                                                                      Packages_id);
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              PackageDetails()));
                                                                },
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets.only(
                                                                      right:
                                                                          10.w,
                                                                      bottom:
                                                                          7.h,
                                                                      top: 5.h),
                                                                  height: 130.h,
                                                                  width: 370.w,
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius: BorderRadius.circular(10.r),
                                                                      // border: Border.all(color: Color(0xff707070)),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            color:
                                                                                Colors.grey,
                                                                            blurRadius: 3.r,
                                                                            offset: Offset(0, 2))
                                                                      ]),
                                                                  child: Column(
                                                                    children: [
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                15.h,
                                                                            right: 5.w,
                                                                            left: 5.w),
                                                                        height:
                                                                            130.h,
                                                                        width:
                                                                            350.w,
                                                                        decoration: BoxDecoration(
                                                                            border: Border.all(color: Color(0xff707070)),
                                                                            borderRadius: BorderRadius.circular(5.r),
                                                                            image: DecorationImage(
                                                                              fit: BoxFit.fill,
                                                                              //image: AssetImage("assets/Baga Beach.jpg")
                                                                              image: NetworkImage(server.packages![index].place.toString()),
                                                                            )),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(
                                                                            right:
                                                                                5.w,
                                                                            left: 15.w,
                                                                            top: 15.h),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              "Starting From",
                                                                              style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.fromLTRB(
                                                                            15.w,
                                                                            5.h,
                                                                            5.w,
                                                                            0.h),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              //"₹ 2,50,000/ Per Person",
                                                                              "₹ " + server.packages![index].pricePerPerson.toString() + "/Person",
                                                                              style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(right: 15.w),
                                                                              child: Text(
                                                                                //"7 D-6 N",
                                                                                server.packages![index].days.toString(),
                                                                                style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(top: 30.h),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            Column(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.home_filled,
                                                                                  color: Color(0xff09646D),
                                                                                  size: 28.sp,
                                                                                ),
                                                                                Text(
                                                                                  //"Upto 3 Stars",
                                                                                  "Upto " + server.packages![index].hotelType.toString(),
                                                                                  style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.grey),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                if (_travelby == "Car") ...[
                                                                                  Icon(
                                                                                    CupertinoIcons.car,
                                                                                    color: Color(0xff09646D),
                                                                                    size: 28.sp,
                                                                                  ),
                                                                                ] else if (_travelby == "Flight") ...[
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
                                                                                  // "Flights",
                                                                                  "By " + server.packages![index].travelBy.toString(),
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
                                                                                if (_sightseening != "") ...[
                                                                                  Icon(
                                                                                    Icons.map,
                                                                                    color: Color(0xff09646D),
                                                                                    size: 28.sp,
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
                                                                          Navigator.of(context)
                                                                              .push(MaterialPageRoute(builder: (context) => MyPlaniing()));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          margin:
                                                                              EdgeInsets.only(top: 25.h),
                                                                          height:
                                                                              35.h,
                                                                          width:
                                                                              200.w,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0xff09646D),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.r),
                                                                            boxShadow: [
                                                                              BoxShadow(color: Colors.grey, blurRadius: 3.r, offset: Offset(1, 2))
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.only(bottom: 2.h),
                                                                              child: Text(
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
                                                  : CircularProgressIndicator();
                                            })
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    FutureBuilder<get_destinationdata_model>(
                                        future: GetDestinationData()
                                            .destinationdatalist(
                                                destination_placeToVisit),
                                        builder: (context, snapshot) {
                                          return (snapshots.hasData)
                                              ? Container(
                                                  height: 150.h,
                                                  // color: Colors.green,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount: snapshots
                                                          .data!
                                                          .data![index]
                                                          .placeToVisit!
                                                          .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        _showDialog(){

                                                          showDialog(context: context, builder: (BuildContext context) {
                                                                return Dialog(insetPadding: EdgeInsets.all(0.w),

                                                                  backgroundColor:
                                                                      Colors.transparent,
                                                                  child:
                                                                      Container(
                                                                    height:
                                                                        650.h,
                                                                    width:
                                                                        380.w,
                                                                    // color: Colors.transparent,
                                                                    child: ListView.builder(
                                                                        scrollDirection: Axis.horizontal,
                                                                        itemCount: snapshots.data!.data![0].placeToVisit!.length,
                                                                        itemBuilder: (context, index) {
                                                                          return Container(
                                                                              margin: EdgeInsets.only(right: 10.w, left: 10.w),
                                                                              height: MediaQuery.of(context).size.height / 2,
                                                                              width: MediaQuery.of(context).size.width / 1.3,
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                borderRadius: BorderRadius.circular(10.r),
                                                                                // border: Border.all(color: Color(0xff707070)),
                                                                              ),
                                                                              child: Stack(
                                                                                alignment: Alignment.topCenter,
                                                                                children: [
                                                                                  Container(
                                                                                    margin: EdgeInsets.only(right: 10.w, top: 10.h, left: 10.w),
                                                                                    height: 180.h,
                                                                                    width: 290.w,
                                                                                    decoration: BoxDecoration(
                                                                                        image: DecorationImage(
                                                                                            fit: BoxFit.fill,
                                                                                            //image: AssetImage("assets/Baga Beach.jpg")
                                                                                            image: NetworkImage(server.placeToVisit![index].photo.toString())),
                                                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
                                                                                  ),
                                                                                  Positioned(
                                                                                    top: 200.h,
                                                                                    child: Center(
                                                                                      child: Container(
                                                                                        width: 300.w,
                                                                                        child: Center(
                                                                                          child: Padding(
                                                                                            padding:  EdgeInsets.only(left: 15.r),
                                                                                            child: Text(
                                                                                              //"Canada: Arrival and Free day",
                                                                                              server.placeToVisit![index].name.toString(),
                                                                                              style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  SizedBox(height: 100.h,),
                                                                                  Padding(
                                                                                    padding: EdgeInsets.only(top: 260.h, right: 25.w, left: 25.w),
                                                                                    child: Container(
                                                                                      width: 280.w,
                                                                                      height: 380.h,
                                                                                      color: Colors.transparent,
                                                                                      child: SingleChildScrollView(
                                                                                        scrollDirection: Axis.vertical,
                                                                                        child: Text(
                                                                                          //"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book....Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book......Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has beenthe industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                                                                          server.placeToVisit![index].description.toString(),
                                                                                          textAlign: TextAlign.left,
                                                                                          style: TextStyle(fontSize: 16.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.black),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ));
                                                                        }),
                                                                  ),
                                                                );
                                                              });
                                                        }

                                                        return Padding(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                                  5.w,
                                                                  0.h,
                                                                  2.w,
                                                                  0.h),
                                                          child: Column(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  _showDialog();
                                                                },
                                                                child:
                                                                    Container(
                                                                  height: 100.h,
                                                                  width: 220.w,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(color: Color(0xff707070)),
                                                                      borderRadius: BorderRadius.circular(15.r),
                                                                      image: DecorationImage(
                                                                          fit: BoxFit.fill,
                                                                          // image: AssetImage("assets/Baga Beach.jpg",)
                                                                          image: NetworkImage(server.placeToVisit![index].photo.toString()))),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10.h,
                                                              ),
                                                              Text(
                                                                  //"CN Tower (Canada)",

                                                              server.placeToVisit![index].name
                                                                            .toString()
                                                                            .length >
                                                                        20
                                                                    ? "${server.placeToVisit![index].name.toString().substring(0, 20)}"
                                                                    : server.placeToVisit![index]
                                                                            .name
                                                                            .toString() +
                                                                        "...",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontFamily:
                                                                        "SegoeUI",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                )
                                              : CircularProgressIndicator();
                                        }),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "How To Reach " +
                                              server
                                                  .destination!.destinationName
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (_travel1 == "Car") ...[
                                          Icon(
                                            CupertinoIcons.car,
                                            color: Color(0xff09646D),
                                            size: 25.sp,
                                          ),
                                        ] else if (_travel1 == "Flight") ...[
                                          Icon(
                                            CupertinoIcons.airplane,
                                            color: Color(0xff09646D),
                                            size: 25.sp,
                                          ),
                                        ] else if (_travel1 == "Train") ...[
                                          Icon(
                                            CupertinoIcons.tram_fill,
                                            color: Color(0xff09646D),
                                            size: 25.sp,
                                          ),
                                        ] else if (_travel1 == "Bus") ...[
                                          Icon(
                                            CupertinoIcons.bus,
                                            color: Color(0xff09646D),
                                            size: 25.sp,
                                          ),
                                        ],
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        Text(
                                          //"By Air",
                                          "By " +
                                              server.destination!.howToReach
                                                  .toString(),
                                          //server.placeToVisit![index].name.toString(),
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 18.w, left: 18.w),
                                      child: Text(
                                        // "Lprem is very wonderful experience.ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit. Lprem is very wonderful ex perience.ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit. Lprem is very wonderful experience.ipsum I sdn jaskk euifn hbe chek is very good I recommend to all lorem to visit.",
                                        "       " +
                                            server.destination!.aboutDestination
                                                .toString(),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30.h,
                                    ),
                                  ],
                                ),
                              )),
                        );
                      })
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
