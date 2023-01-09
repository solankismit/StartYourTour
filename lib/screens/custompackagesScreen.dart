// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:syt/Api.dart';
// import 'package:syt/models/Get_custom_requirementtt_model.dart';
// import 'package:syt/models/display_userbid_model.dart';
// import 'package:syt/screens/biddetails.dart';
// import 'package:syt/screens/comparebids.dart';
// import 'package:syt/screens/drawerScreen.dart';
// import '../models/Get_custom_requirementtt_model.dart';
// import 'budget(Per Head)Screen.dart';
//
// const custompackage_display = """
// // query custompackage_display(\$id:String!,){
// //   custompackage_display(id:\$id){
// //      _id
// //     userId
// //     departurelocation
// //     destinationlocation
// //     category
// //     adult
// //     child
// //     infont
// //     personalcare
// //     travelby
// //     departurebetween
// //     hoteltype
// //     meals
// //     mealtype
// //     additionalrequirements
// //     name
// //     email
// //     phone
// //     city
// //     budget
// //     custompackage_status
// //     createdAt
// //     updatedAt
// //     __typename
// //   }
// // }
// // """;
//
// class CustomPackages extends StatefulWidget {
//
//   @override
//   _CustomPackagesState createState() => _CustomPackagesState();
// }
//
// class _CustomPackagesState extends State<CustomPackages> {
//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//
//   var customid;
//   var departure = "";
//   var destination = "";
//   var adult = "";
//   var childe = "";
//   var infant = "";
//   var care = "";
//   var fristid;
//    var fristagency;
//   var fristdate;
//   var fristprice;
//    var secondid;
//   var secondagency;
//   var seconddate;
//   var secondprice;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loaddata();
//   }
//
//   void loaddata() async {
//     final SharedPreferences prefs = await _prefs;
//     setState(() {
//       customid = (prefs.getString("customid"))!;
//       departure = (prefs.getString("departure"))!;
//       destination = (prefs.getString("destination"))!;
//       adult = (prefs.getString("adult"))!;
//       childe = (prefs.getString("childe"))!;
//       infant = (prefs.getString("infant"))!;
//       care = (prefs.getString("care"))!;
//     });
//   }
//
//   _showDialog() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return Dialog(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.r),
//               ),
//               child: Container(
//                 height: 250.h,
//                 width: 250.w,
//                 child: Padding(
//                   padding: EdgeInsets.all(8.h),
//                   child: Column(
//                     children: [
//                       Text(
//                         "are you sure you want to cancel your tour plan?",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontSize: 18.sp,
//                             fontFamily: "SegoeUI",
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xff004351)),
//                       ),
//                       SizedBox(
//                         height: 70.h,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Container(
//                           height: 40.h,
//                           width: 120.w,
//                           decoration: BoxDecoration(
//                             color: Color(0xff09646D),
//                             borderRadius: BorderRadius.circular(10.r),
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 3.r,
//                                   offset: Offset(1, 2))
//                             ],
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.only(bottom: 2.h),
//                               child: Text(
//                                 "Yes",
//                                 style: TextStyle(
//                                     fontSize: 18.sp,
//                                     fontFamily: "SegoeUI",
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.of(context).pop();
//                         },
//                         child: Container(
//                           height: 40.h,
//                           width: 120.w,
//                           decoration: BoxDecoration(
//                             color: Color(0xff09646D),
//                             borderRadius: BorderRadius.circular(10.r),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey,
//                                 blurRadius: 3.r,
//                                 offset: Offset(1, 2),
//                               ),
//                             ],
//                           ),
//                           child: Center(
//                             child: Padding(
//                               padding: EdgeInsets.only(bottom: 2.h),
//                               child: Text(
//                                 "No",
//                                 style: TextStyle(
//                                     fontSize: 18.sp,
//                                     fontFamily: "SegoeUI",
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ));
//         });
//   }
//
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   final selectedIndexs = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Stack(
//         children: [
//           Positioned(
//             top: 750.h,
//             right: 10.w,
//             child: FloatingActionButton(
//               onPressed: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => BudgetPerHead()));
//               },
//               backgroundColor: Color(0xff004351),
//               child: Icon(
//                 Icons.filter_list_alt,
//                 color: Colors.white,
//                 size: 30.sp,
//               ),
//             ),
//           ),
//         ],
//         //  overflow: Overflow.visible,
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//         ),
//         height: 60.h,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             InkWell(
//               onTap: () {
//                 print("hiiiiiiiiiiiiiiiiiii");
//                 if (selectedIndexs.contains(selectedIndexs) == 1 &&
//                     selectedIndexs.contains(selectedIndexs) == 1) {
//                   print("--------------->>>>");
//                   Navigator.of(context).push(
//                       MaterialPageRoute(builder: (context) => CompareBids(
//                         fristid,
//                         fristagency,
//                         fristdate,
//                         fristprice,
//                         secondid,
//                         secondagency,
//                         seconddate,
//                         secondprice,
//                       )));
//                 } else {
//                   Fluttertoast.showToast(
//                     msg: "Please select at least 2 items",
//                     backgroundColor: Color(0xff005C63),
//                     textColor: Colors.white,
//                   );
//                 }
//                 // (checkbox == true && checkbox2 == true)
//                 //     ? Navigator.of(context).push(MaterialPageRoute(
//                 //     builder: (context) => CompareBids()))
//                 //     : Fluttertoast.showToast(
//                 //   msg: "Please select at least 2 items",
//                 //   backgroundColor: Color(0xff005C63),
//                 //   textColor: Colors.white,
//                 // );
//               },
//               child: Container(
//                 height: 35.h,
//                 width: 175.w,
//                 decoration: BoxDecoration(
//                   color: Color(0xff09646D),
//                   borderRadius: BorderRadius.circular(10.r),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey,
//                         blurRadius: 3.r,
//                         offset: Offset(1, 2))
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Compare Quotes",
//                     style: TextStyle(
//                         fontSize: 16.sp,
//                         fontFamily: "SegoeUI",
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       key: scaffoldKey,
//       drawer: DrawerScreen(),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           onPressed: () {
//             scaffoldKey.currentState?.openDrawer();
//           },
//           icon: Icon(Icons.menu),
//           color: Colors.black,
//         ),
//         title: Text(
//           "Custom Packages",
//           style: TextStyle(
//               fontSize: 18.sp,
//               fontFamily: "SegoeUI",
//               fontWeight: FontWeight.bold,
//               color: Color(0xff004351)),
//         ),
//         centerTitle: true,
//       ),
//       // centerTitle: true,
//
//       body: Column(
//         children: [
//           FutureBuilder<Get_custom_requirementtt_model>(
//               future: GetCustomRequirement().getcustomrequirementlist(),
//               builder: (context, snapshots) {
//                 return (snapshots.hasData)
//                     ? Container(
//                   height: 250.h,
//
//                   margin: EdgeInsets.only(right: 10.w),
//                   //color: Colors.deepPurple,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: snapshots.data!.data!.length,
//                       itemBuilder: (context, index) {
//                         var server = snapshots.data!.data![index];
//
//                         return Padding(
//                           padding: EdgeInsets.only(left: 10.w),
//                           child: Container(
//                             height: MediaQuery.of(context).size.height / 20,
//                             width: 320.w,
//                             decoration: BoxDecoration(
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 3.r,
//                                     offset: Offset(1, 2))
//                               ],
//                               gradient: LinearGradient(
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                   colors: [
//                                     Color(0xff047B99),
//                                     Color(0xff023E4D),
//                                   ]),
//                               borderRadius: BorderRadius.circular(15.r),
//                             ),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Container(
//                                       height: 30.h,
//                                       width: 83.w,
//                                       decoration: BoxDecoration(
//                                         boxShadow: [
//                                           BoxShadow(
//                                               color: Colors.grey,
//                                               blurRadius: 3.r,
//                                               offset: Offset(1, 2))
//                                         ],
//                                         color: Color(0xffF3F3F3),
//                                         borderRadius: BorderRadius.only(
//                                           topRight:
//                                           Radius.circular(14.r),
//                                           bottomLeft:
//                                           Radius.circular(14.r),
//                                         ),
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           "active",
//                                           style: TextStyle(
//                                               fontSize: 16.sp,
//                                               fontFamily: "SegoeUI",
//                                               fontWeight:
//                                               FontWeight.bold,
//                                               color: Color(0xffFF0000)),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       top: 7.h,
//                                       left: 13.w,
//                                       bottom: 5.h),
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                           Icons.perm_contact_calendar_rounded,
//                                           size: 22.sp,
//                                           color: Colors.white),
//                                       SizedBox(
//                                         width: 12.w,
//                                       ),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             // "Trip ID: 621cc7c8f3b13d254786ceed",
//                                             "Trip ID: " + server.tripId.toString(),
//                                             style: TextStyle(
//                                                 fontSize: 16.sp,
//                                                 fontFamily: "SegoeUI",
//                                                 fontWeight:
//                                                 FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 13.w, bottom: 5.h),
//                                   child: Row(
//                                     children: [
//                                       Icon(
//                                           Icons
//                                               .airplanemode_active_sharp,
//                                           size: 22.sp,
//                                           color: Colors.white),
//                                       SizedBox(
//                                         width: 12.w,
//                                       ),
//                                       Text(
//                                         //"Departure: Ahmedabad",
//                                         "Departure: " +
//                                             server.departure.toString(),
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                       left: 13.w, bottom: 5.h),
//                                   child: Row(
//                                     children: [
//                                       Icon(Icons.location_pin,
//                                           size: 22.sp,
//                                           color: Colors.white),
//                                       SizedBox(
//                                         width: 12.w,
//                                       ),
//                                       Text(
//                                         //"Arrival: Delhi",
//                                         "Arrival: " +
//                                             server.arival.toString(),
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     left: 13.w,
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Icon(Icons.calendar_today,
//                                           size: 22.sp,
//                                           color: Colors.white),
//                                       SizedBox(
//                                         width: 12.w,
//                                       ),
//                                       Text(
//                                         //"On Date: 28/02/2022 - 09/03/2022",
//                                         "On Date: " +
//                                             server.onDate.toString(),
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: "SegoeUI",
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 17.h,
//                                 ),
//                                 Stack(
//                                   children: [
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         InkWell(
//                                           onTap: () async {
//                                             var customid = server.tripId.toString();
//                                             final SharedPreferences prefs = await _prefs;
//                                             prefs.setString("customid", customid);
//                                             print(customid + "<-------------------------screen-----------------------screen------------------------->");
//                                             setState(() {
//                                                 loaddata();
//                                             });
//
//
//                                             var departure = server.customRequirement!.departure.toString();
//                                             var destination = server.customRequirement!.destination.toString();
//                                             var adult = server.customRequirement!.totalAdult.toString();
//                                             var childe = server.customRequirement!.totalChild.toString();
//                                             var infant = server.customRequirement!.infant.toString();
//                                             var care = server.customRequirement!.personalCare.toString();
//
//                                             prefs.setString("departure", departure);
//                                             prefs.setString("destination", destination);
//                                             prefs.setString("adult", adult);
//                                             prefs.setString("childe", childe);
//                                             prefs.setString("infant", infant);
//                                             prefs.setString("care", care);
//
//
//                                           },
//                                           child: Container(
//                                             height: 35.h,
//                                             width: 150.w,
//                                             decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                               BorderRadius.circular(
//                                                   10.r),
//                                               boxShadow: [
//                                                 BoxShadow(
//                                                     color: Colors.black38,
//                                                     blurRadius: 3.r,
//                                                     offset: Offset(1, 2))
//                                               ],
//                                             ),
//                                             child: Center(
//                                               child: Padding(
//                                                 padding: EdgeInsets.only(bottom: 2.h),
//                                                 child: Text(
//                                                   "Show packages",
//                                                   style: TextStyle(
//                                                       fontSize: 16.sp,
//                                                       fontFamily: "SegoeUI",
//                                                       fontWeight:
//                                                       FontWeight.bold,
//                                                       color: Color(0xff09646D)),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         Padding(
//                                           padding: EdgeInsets.only(top: 30.h),
//                                           child: InkWell(
//                                             onTap: () {
//                                               _showDialog();
//                                             },
//                                             child: CircleAvatar(
//                                               radius: 12.5.r,
//                                               backgroundColor:
//                                               Color(0xffFF0000),
//                                               child: Center(
//                                                 child: Icon(
//                                                   Icons.close,
//                                                   size: 19.sp,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//
//                       }),
//                 )
//                     : Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }),
//
//           SizedBox(
//             height: 10.h,
//           ),
//
//           Column(children: [
//             Container(
//               width: 50.w,
//               child: Divider(
//                 color: Colors.grey.shade200,
//                 height: 10.h,
//                 thickness: 1.w,
//               ),
//             ),
//             Text(
//               "You can compare maximum two Quotes",
//               style: TextStyle(
//                   fontSize: 16.sp,
//                   fontFamily: "SegoeUI",
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xff7F7F7F)),
//             ),
//
//             SizedBox(
//               height: 20.h,
//             ),
//
//             FutureBuilder<display_userbid_model>(
//                 future: Display_userbid().userbidlist(customid),
//                 builder: (context, snapshots) {
//                   return (snapshots.hasData)
//                       ? Container(
//                            //color: Colors.green,
//                           height: 300.h,
//                           width: 350.w,
//                           child: ListView.builder(
//                               scrollDirection: Axis.vertical,
//                               itemCount: snapshots.data!.data!.length,
//                               itemBuilder: (context, index) {
//                                 var server1 = snapshots.data!.data![index];
//                                 return Padding(
//                                   padding: EdgeInsets.only(bottom: 10.h),
//                                   child: InkWell(
//                                     onTap: () async {
//                                       var agencyname = server1.agency.toString();
//                                       var agencyprice = server1.price.toString();
//                                       var agencydate = server1.date.toString();
//                                       var agencyid = server1.sId.toString();
//
//                                       final SharedPreferences prefs = await _prefs;
//                                       prefs.setString("agencyname", agencyname);
//                                       prefs.setString("agencyprice", agencyprice);
//                                       prefs.setString("agencydate", agencydate);
//                                       prefs.setString("agencyid", agencyid);
//
//                                       Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   BidDetails(
//                                                       departure,
//                                                       destination,
//                                                       adult,
//                                                       childe,
//                                                       infant,
//                                                       care,
//                                                   )));
//                                     },
//                                     child: Stack(
//                                       children: [
//                                         Container(
//                                           height: 110.h,
//                                           width: 360.w,
//                                           decoration: BoxDecoration(
//                                             boxShadow: [
//                                               BoxShadow(
//                                                   color: Colors.grey,
//                                                   blurRadius: 3.r,
//                                                   offset: Offset(1, 2))
//                                             ],
//                                             gradient: LinearGradient(
//                                                 begin: Alignment.topCenter,
//                                                 end: Alignment.bottomCenter,
//                                                 colors: [
//                                                   Color(0xff047B99),
//                                                   Color(0xff023E4D),
//                                                 ]),
//                                             borderRadius:
//                                                 BorderRadius.circular(15.r),
//                                           ),
//                                           child: Column(
//                                             children: [
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                     top: 8.h,
//                                                     left: 20.w,
//                                                     bottom: 9.h),
//                                                 child: Row(
//                                                   children: [
//                                                     Text(
//                                                       //"Agency: NR Travels",
//                                                       server1.agency
//                                                           .toString(),
//                                                       style: TextStyle(
//                                                           fontSize: 18.sp,
//                                                           fontFamily:
//                                                               "SegoeUI",
//                                                           fontWeight:
//                                                               FontWeight
//                                                                   .bold,
//                                                           color:
//                                                               Colors.white),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                     left: 20.w,
//                                                     bottom: 8.h),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   children: [
//                                                     Row(
//                                                       children: [
//                                                         Text(
//                                                           "Price:",
//                                                           //server1.price.toString(),
//                                                           style: TextStyle(
//                                                               fontSize:
//                                                                   16.sp,
//                                                               fontFamily:
//                                                                   "SegoeUI",
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                               color: Colors
//                                                                   .white),
//                                                         ),
//                                                         Text(
//                                                           //" ₹ 22,000",
//                                                           " ₹ " +
//                                                               server1.price
//                                                                   .toString(),
//                                                           style: TextStyle(
//                                                               fontSize:
//                                                                   16.sp,
//                                                               fontFamily:
//                                                                   "SegoeUI",
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                               color: Color(
//                                                                   0xff69FF87)),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                     Row(
//                                                       children: [
//                                                         Icon(
//                                                           Icons.star,
//                                                           color:
//                                                               Colors.white,
//                                                           size: 15.sp,
//                                                         ),
//                                                         Icon(
//                                                           Icons.star,
//                                                           color:
//                                                               Colors.white,
//                                                           size: 15.sp,
//                                                         ),
//                                                         Icon(
//                                                           Icons.star,
//                                                           color:
//                                                               Colors.white,
//                                                           size: 15.sp,
//                                                         ),
//                                                         Icon(
//                                                           Icons.star_border,
//                                                           color:
//                                                               Colors.white,
//                                                           size: 15.sp,
//                                                         ),
//                                                         Icon(
//                                                           Icons.star_border,
//                                                           color:
//                                                               Colors.white,
//                                                           size: 15,
//                                                         ),
//                                                         SizedBox(
//                                                           width: 50.w,
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: EdgeInsets.only(
//                                                   left: 20.w,
//                                                   right: 50.w,
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                   children: [
//                                                     Text(
//                                                       // "Date: 25/11/2021",
//                                                       server1.date.toString(),
//                                                       style: TextStyle(
//                                                           fontSize: 16.sp,
//                                                           fontFamily:
//                                                               "SegoeUI",
//                                                           fontWeight:
//                                                               FontWeight
//                                                                   .bold,
//                                                           color:
//                                                               Colors.white),
//                                                     ),
//                                                     Text(
//                                                       "Total Reviews: 12",
//                                                       style: TextStyle(
//                                                           fontSize: 16.sp,
//                                                           fontFamily:
//                                                               "SegoeUI",
//                                                           fontWeight:
//                                                               FontWeight
//                                                                   .bold,
//                                                           color:
//                                                               Colors.white),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Positioned(
//                                           bottom: 50.h,
//                                           right: 15.w,
//                                           // left: 340.w,
//                                           child: Container(
//                                             height: 17.h,
//                                             width: 17.w,
//                                             color: Colors.white,
//                                             child: Checkbox(
//                                               splashRadius: 5.r,
//                                               //value: checkbox,
//                                               value: selectedIndexs.contains(index),
//                                               activeColor: Color(0xff0A6A73),
//                                               onChanged: (value) {
//                                                 if (selectedIndexs.contains(index)) {
//                                                   selectedIndexs.remove(index);
//                                                 } else {
//                                                   selectedIndexs.add(index);
//                                                   print("<-------------selectedIndexs-------------->" + selectedIndexs.toString());
//                                                 }
//                                                 setState(() {
//                                                   // checkbox = value!;
//                                                 });
//                                               },
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               }),
//                         )
//                       : Center(child: CircularProgressIndicator());
//                 }),
//           ]),
//         ],
//       )
//     );
//   }
// }

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/Get_custom_requirementtt_model.dart';
import 'package:syt/models/chechkbox_model.dart';
import 'package:syt/models/display_userbid_model.dart';
import 'package:syt/screens/biddetails.dart';
import 'package:syt/screens/comparebids.dart';
import 'package:syt/screens/drawerScreen.dart';
import 'package:syt/screens/update_customrequirements.dart';
import '../Api.dart';
import '../models/Get_custom_requirementtt_model.dart';
import '../models/delete_custom_requirement_model.dart';
import '../models/display_review_model.dart';
import 'budget(Per Head)Screen.dart';

const custompackage_display = """
// query custompackage_display(\$id:String!,){
//   custompackage_display(id:\$id){
//      _id
//     userId
//     departurelocation
//     destinationlocation
//     category
//     adult
//     child
//     infont
//     personalcare
//     travelby
//     departurebetween
//     hoteltype
//     meals
//     mealtype
//     additionalrequirements
//     name
//     email
//     phone
//     city
//     budget
//     custompackage_status
//     createdAt
//     updatedAt
//     __typename
//   }
// }
// """;

class CustomPackages extends StatefulWidget {
  @override
  _CustomPackagesState createState() => _CustomPackagesState();
}

class _CustomPackagesState extends State<CustomPackages> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  //var Id = "";
  var getbid_id = "";
  var departure = "";
  var destination = "";
  var adult = "";
  var childe = "";
  var infant = "";
  var care = "";
  var fristid = "";
  var fristprice = "";
  var fristagency = "";
  var fristdate = "";
  var secondid = "";
  var secondprice = "";
  var secondagency = "";
  var seconddate = "";
  var tripId = "";
  var agencyid = "";
  // String id = "63107fc93f5ce620fc00cfeb";
  // var therddid ="";
  //  var therdprice = "";
  //  var therdagency = "";
  //  var therddate = "";
  String star = "";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var selectedIndexs = [];
  List<CheckboxModel> checkboxList = [];
  String rating_no = "0.0";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      getbid_id = (prefs.getString("customid")) ?? "";
      print(getbid_id + "+++++++++++++++++++++++++++++");
      departure = (prefs.getString("departure")) ?? "";
      destination = (prefs.getString("destination")) ?? "";
      adult = (prefs.getString("adult")) ?? "";
      childe = (prefs.getString("childe")) ?? "";
      infant = (prefs.getString("infant")) ?? "";
      care = (prefs.getString("care")) ?? "";
      fristid = (prefs.getString("fristid")) ?? "";
      fristprice = (prefs.getString("fristprice")) ?? "";
      fristagency = (prefs.getString("fristagency")) ?? "";
      fristdate = (prefs.getString("fristdate")) ?? "";
      secondid = (prefs.getString("secondid")) ?? "";
      secondprice = (prefs.getString("secondprice")) ?? "";
      secondagency = (prefs.getString("secondagency")) ?? "";
      seconddate = (prefs.getString("seconddate")) ?? "";
      star = (prefs.getString("star")) ?? "";
      agencyid = (prefs.getString("agencyid")) ?? "";
      // Id = (prefs.getString("Id")) ?? "";
      print(star + "*****************************");
      //print(Id + "*****************************");
      //  therddid = (prefs.getString("therddid"))!;
      //  therdprice = (prefs.getString("therdprice"))!;
      // therdagency = (prefs.getString("therdagency"))!;
      //  therddate = (prefs.getString("therddate"))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButton: Stack(
        //   children: [
        //     Positioned(
        //       top: 750.h,
        //       right: 10.w,
        //       child: FloatingActionButton(
        //         onPressed: () {
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => BudgetPerHead()));
        //         },
        //         backgroundColor: Color(0xff004351),
        //         child: Icon(
        //           Icons.filter_list_alt,
        //           color: Colors.white,
        //           size: 30.sp,
        //         ),
        //       ),
        //     ),
        //   ],
        //   //  overflow: Overflow.visible,
        // ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          height: 60.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  print(checkboxList.toString());
                  print("hiiiiiiiiiiiiiiiiiii");
                  print(selectedIndexs.length);
                  print(selectedIndexs);

                  if (checkboxList.length == 2) {
                    print("--------------->>>> ashok");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CompareBids(
                              checkboxList[0].id,
                              checkboxList[0].agency,
                              checkboxList[0].date,
                              checkboxList[0].price,
                              checkboxList[1].id,
                              checkboxList[1].agency,
                              checkboxList[1].date,
                              checkboxList[1].price,
                            )));
                  } else {
                    // for(var i=0;i<=checkboxList.length;i++){
                    //   print(checkboxList[i].agency+ "agency - added ");
                    // }
                    Fluttertoast.showToast(
                      msg: "Please select at least 2 items",
                      backgroundColor: Color(0xff005C63),
                      textColor: Colors.white,
                    );
                  }

                  // (checkbox == true && checkbox2 == true)
                  //     ? Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => CompareBids()))
                  //     : Fluttertoast.showToast(
                  //   msg: "Please select at least 2 items",
                  //   backgroundColor: Color(0xff005C63),
                  //   textColor: Colors.white,
                  // );
                },
                child: Container(
                  height: 35.h,
                  width: 175.w,
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
                    child: Text(
                      "Compare Quotes",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "SegoeUI",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
            "Custom Packages",
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        // centerTitle: true,

        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              FutureBuilder<Get_custom_requirementtt_model>(
                  future: GetCustomRequirement().getcustomrequirementlist(),
                  builder: (context, snapshots) {
                    return (snapshots.hasData)
                        ? Container(
                            height: 250.h,
                            margin: EdgeInsets.only(right: 10.w),
                            //color: Colors.deepPurple,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshots.data?.data?.length,
                                itemBuilder: (context, index) {
                                  var server = snapshots.data!.data![index];

                                  return Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: InkWell(
                                      onTap: () async {
                                        final SharedPreferences prefs =
                                            await _prefs;
                                        var departure =
                                            server.departure.toString();
                                        var tripId = server.tripId.toString();
                                        var arrival = server.arival.toString();
                                        var ondate = server.onDate.toString();
                                        var category = server.customRequirement!.destinationCategory
                                            .toString();
                                        var adult = server.customRequirement!.totalAdult
                                            .toString();
                                        var child = server.customRequirement!.totalChild
                                            .toString();
                                        var infant = server.customRequirement!.infant
                                            .toString();
                                        var parsnalcar = server.customRequirement!.personalCare
                                            .toString();
                                        var travalby = server.customRequirement!.travelBy
                                            .toString();
                                        prefs.setString("tripId", tripId);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    update_customrequirements(
                                                        departure,
                                                        tripId,
                                                        arrival,
                                                        ondate,
                                                        category,
                                                        adult,
                                                        child,
                                                        infant,
                                                        parsnalcar,
                                                        travalby)));
                                        print(tripId +
                                            "aaaaaaaaaaaa==================================");
                                        print(category.toString() +
                                            "++++++++++++++++++++++++++++++");
                                      },
                                      child: Container(
                                        height: 180.h,
                                        //MediaQuery.of(context).size.height / 20,
                                        width: 350.w,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 3.r,
                                                offset: Offset(1, 2)),
                                          ],
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xff047B99),
                                                Color(0xff023E4D),
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: 30.h,
                                                  width: 90.w,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 3.r,
                                                          offset: Offset(1, 2))
                                                    ],
                                                    color: Color(0xffF3F3F3),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(14.r),
                                                      bottomLeft:
                                                          Radius.circular(14.r),
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      // "active",
                                                      server.customRequirement!
                                                          .status
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 16.sp,
                                                          fontFamily: "SegoeUI",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color(
                                                              0xffFF0000)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 7.h,
                                                  left: 13.w,
                                                  bottom: 5.h),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .perm_contact_calendar_rounded,
                                                      size: 22.sp,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        // "Trip ID: 621cc7c8f3b13d254786ceed",
                                                        "Trip ID: " +
                                                            server.tripId
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontFamily:
                                                                "SegoeUI",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 13.w, bottom: 5.h),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .airplanemode_active_sharp,
                                                      size: 22.sp,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  Text(
                                                    //"Departure: Ahmedabad",
                                                    "Departure: " +
                                                        server.departure
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontFamily: "SegoeUI",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 13.w, bottom: 5.h),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.location_pin,
                                                      size: 22.sp,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  Text(
                                                    //"Arrival: Delhi",
                                                    "Arrival: " +
                                                        server.arival
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontFamily: "SegoeUI",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 13.w,
                                              ),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.calendar_today,
                                                      size: 22.sp,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 12.w,
                                                  ),
                                                  Text(
                                                    //"On Date: 28/02/2022 - 09/03/2022",
                                                    "On Date: " +
                                                        server.onDate
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontFamily: "SegoeUI",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 17.h,
                                            ),
                                            Stack(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        top: 20,
                                                      ),
                                                      child: InkWell(
                                                        onTap: () async {
                                                          // if(server.tripId!.isEmpty){
                                                          //   var customid = server.tripId.toString();
                                                          //   final SharedPreferences prefs = await _prefs;
                                                          //   prefs.setString("customid", customid);
                                                          //   print(customid + "<-------------------------screen-----------------------screen------------------------->");
                                                          //   setState(() {
                                                          //     loaddata();
                                                          //     selectedIndexs = [];
                                                          //   });
                                                          //
                                                          //
                                                          //   var departure = server.customRequirement!.departure.toString();
                                                          //   var destination = server.customRequirement!.destination.toString();
                                                          //   var adult = server.customRequirement!.totalAdult.toString();
                                                          //   var childe = server.customRequirement!.totalChild.toString();
                                                          //   var infant = server.customRequirement!.infant.toString();
                                                          //   var care = server.customRequirement!.personalCare.toString();
                                                          //
                                                          //   prefs.setString("departure", departure);
                                                          //   prefs.setString("destination", destination);
                                                          //   prefs.setString("adult", adult);
                                                          //   prefs.setString("childe", childe);
                                                          //   prefs.setString("infant", infant);
                                                          //   prefs.setString("care", care);
                                                          // }else{
                                                          //   ScaffoldMessenger.of(
                                                          //       context)
                                                          //       .showSnackBar(
                                                          //       SnackBar(
                                                          //         content: Text(
                                                          //             "No More Packeges ..."),
                                                          //         backgroundColor:
                                                          //         Colors.red,
                                                          //       ));
                                                          // }

                                                          var customid = server
                                                              .tripId
                                                              .toString();
                                                          final SharedPreferences
                                                              prefs =
                                                              await _prefs;
                                                          prefs.setString(
                                                              "customid",
                                                              customid);
                                                          print(customid +
                                                              "<-------------------------screen-----------------------screen------------------------->");
                                                          setState(() {
                                                            loaddata();
                                                            selectedIndexs = [];
                                                          });

                                                          var departure = server
                                                              .customRequirement!
                                                              .departure
                                                              .toString();
                                                          var destination = server
                                                              .customRequirement!
                                                              .destination
                                                              .toString();
                                                          var adult = server
                                                              .customRequirement!
                                                              .totalAdult
                                                              .toString();
                                                          var childe = server
                                                              .customRequirement!
                                                              .totalChild
                                                              .toString();
                                                          var infant = server
                                                              .customRequirement!
                                                              .infant
                                                              .toString();
                                                          var care = server
                                                              .customRequirement!
                                                              .personalCare
                                                              .toString();

                                                          prefs.setString(
                                                              "departure",
                                                              departure);
                                                          prefs.setString(
                                                              "destination",
                                                              destination);
                                                          prefs.setString(
                                                              "adult", adult);
                                                          prefs.setString(
                                                              "childe", childe);
                                                          prefs.setString(
                                                              "infant", infant);
                                                          prefs.setString(
                                                              "care", care);

                                                          print(departure +
                                                              "<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
                                                          print(destination +
                                                              "<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
                                                          print(adult +
                                                              "<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
                                                          print(childe +
                                                              "<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
                                                          print(infant +
                                                              "<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
                                                          print(care +
                                                              "<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
                                                        },
                                                        child: Container(
                                                          height: 35.h,
                                                          width: 150.w,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.r),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .black38,
                                                                  blurRadius:
                                                                      3.r,
                                                                  offset:
                                                                      Offset(
                                                                          1, 2))
                                                            ],
                                                          ),
                                                          child: Center(
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          2.h),
                                                              child: Text(
                                                                "Show packages",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
                                                                    fontFamily:
                                                                        "SegoeUI",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color(
                                                                        0xff09646D)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 60.h),
                                                      child: InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return Dialog(
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.r),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          250.h,
                                                                      width:
                                                                          250.w,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.h),
                                                                        child:
                                                                            Column(
                                                                          children: [
                                                                            Text(
                                                                              "are you sure you want to cancel your tour plan?",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(fontSize: 18.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Color(0xff004351)),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 70.h,
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                String delete_id = server.tripId.toString();
                                                                                print(delete_id + "+++++++++++++++++++++++++++++++++++++");

                                                                                delete_custom_requirement_model data = await delete_requirement().deleterequirementlist(delete_id);
                                                                                Navigator.of(context).pop();
                                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Costompackage Delete Successfully ...'), backgroundColor: Colors.red));
                                                                                setState(() {});
                                                                              },
                                                                              child: Container(
                                                                                height: 40.h,
                                                                                width: 120.w,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xff09646D),
                                                                                  borderRadius: BorderRadius.circular(10.r),
                                                                                  boxShadow: [
                                                                                    BoxShadow(color: Colors.grey, blurRadius: 3.r, offset: Offset(1, 2))
                                                                                  ],
                                                                                ),
                                                                                child: Center(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(bottom: 2.h),
                                                                                    child: Text(
                                                                                      "Yes",
                                                                                      style: TextStyle(fontSize: 18.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
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
                                                                                      blurRadius: 3.r,
                                                                                      offset: Offset(1, 2),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                child: Center(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.only(bottom: 2.h),
                                                                                    child: Text(
                                                                                      "No",
                                                                                      style: TextStyle(fontSize: 18.sp, fontFamily: "SegoeUI", fontWeight: FontWeight.bold, color: Colors.white),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ));
                                                              });
                                                        },
                                                        child: CircleAvatar(
                                                          radius: 12.5.r,
                                                          backgroundColor:
                                                              Color(0xffFF0000),
                                                          child: Center(
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 19.sp,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
              SizedBox(
                height: 10.h,
              ),
              Column(children: [
                Container(
                  width: 50.w,
                  child: Divider(
                    color: Colors.grey.shade200,
                    height: 10.h,
                    thickness: 1.w,
                  ),
                ),
                Text(
                  "You can compare maximum two Quotes",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7F7F7F)),
                ),
                SizedBox(
                  height: 20.h,
                ),
                FutureBuilder<display_userbid_model>(
                    future: Display_userbid().userbidlist(getbid_id),
                    builder: (context, snapshots) {
                      print(getbid_id + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
                      return (snapshots.hasData)
                          ? Container(
                              // color: Colors.green,
                              height: 300.h,
                              width: 350.w,
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshots.data!.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    // print(snapshots.data!.data?.length.toString() + "item length");
                                    var server1 = snapshots.data!.data![index];
                                    print("ankit");
                                    //print(index.toString() + ">>>>>>>>>>>>>>>>>>>>");
                                    print(snapshots.data!.data!.length
                                            .toString() +
                                        ">>>>>>>>>>>>>>>>>>>>");
                                    print("ankit");
                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      child: Container(
                                        width: 365.w,
                                        // color: Colors.orange,
                                        child: InkWell(
                                          onTap: () async {
                                            var agencyname =
                                                server1.agency.toString();
                                            var agencyprice =
                                                server1.price.toString();
                                            var agencydate =
                                                server1.date.toString();
                                            var agencyid =
                                                server1.sId.toString();

                                            print(agencyname +
                                                "<><><>><><><><><><><><><><><><><><><");
                                            print(agencyprice +
                                                "<><><>><><><><><><><><><><><><><><><");
                                            print(agencydate +
                                                "<><><>><><><><><><><><><><><><><><><");
                                            print(agencyid +
                                                "<><><>><><><><><><><><><><><><><><><");

                                            final SharedPreferences prefs =
                                                await _prefs;
                                            prefs.setString(
                                                "agencyname", agencyname);
                                            prefs.setString(
                                                "agencyprice", agencyprice);
                                            prefs.setString(
                                                "agencydate", agencydate);
                                            prefs.setString(
                                                "agencyid", agencyid);

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BidDetails(
                                                          departure,
                                                          destination,
                                                          adult,
                                                          childe,
                                                          infant,
                                                          care,
                                                        )));
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 110.h,
                                                width: 360.w,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 3.r,
                                                        offset: Offset(1, 2))
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter,
                                                      colors: [
                                                        Color(0xff047B99),
                                                        Color(0xff023E4D),
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.r),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8.h,
                                                          left: 20.w,
                                                          bottom: 9.h),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            //"Agency: NR Travels",
                                                            server1.agency
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 18.sp,
                                                                fontFamily:
                                                                    "SegoeUI",
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 20.w,
                                                          bottom: 8.h),
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Price:",
                                                                  //server1.price.toString(),
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
                                                                Text(
                                                                  //" ₹ 22,000",
                                                                  " ₹ " +
                                                                      server1
                                                                          .price
                                                                          .toString(),
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16.sp,
                                                                      fontFamily:
                                                                          "SegoeUI",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Color(
                                                                          0xff69FF87)),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:  EdgeInsets.only(right: 70.w),
                                                              child: RatingBar.builder(
                                                                ignoreGestures:
                                                                    true,
                                                                itemSize: 20,
                                                                initialRating: 5.0,
                                                                //  double.parse("${star[index]}")
                                                                //double.parse("${snapshots.data?.data?[index].star?[index].toString()}")
                                                                //!= null ?
                                                                //.parse("${star[index]}")
                                                                // double.parse("${snapshots.data?.data?[index].star?[index].toString()}")
                                                                // :double.parse("0.0"),
                                                                // double.parse("${snapshots.data?.data?[index].star?[index].toString()??""}"),

                                                                minRating: 1,
                                                                direction: Axis
                                                                    .horizontal,
                                                                allowHalfRating:
                                                                    true,
                                                                itemCount: 5,
                                                                itemBuilder:
                                                                    (context,
                                                                            _) =>
                                                                        Icon(
                                                                  Icons
                                                                      .star_rate_rounded,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                onRatingUpdate:
                                                                    (star) {
                                                                  rating_no = star
                                                                      .toString();
                                                                },
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                        left: 20.w,
                                                        right: 50.w,
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            // "Date: 25/11/2021",
                                                            server1.date
                                                                .toString(),
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
                                                          Text(
                                                            "Total Reviews: ${star}",
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
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 50.h,
                                                right: 15.w,
                                                child: Container(
                                                  height: 17.h,
                                                  width: 17.w,
                                                  color: Colors.white,
                                                  child: Checkbox(
                                                    splashRadius: 5.r,
                                                    value: selectedIndexs
                                                        .contains(index),
                                                    activeColor:
                                                        Color(0xff0A6A73),
                                                    onChanged: (value) async {
                                                      setState(() {});
                                                      if (selectedIndexs
                                                          .contains(index)) {
                                                        // checkboxList.removeAt(index);
                                                        selectedIndexs
                                                            .remove(index);

                                                        checkboxList.removeWhere(
                                                            (element) =>
                                                                element.index ==
                                                                index);
                                                        print(value.toString() +
                                                            "  value");
                                                        // print(checkboxList[index].agency+ "agency removed - "+ index.toString());
                                                        // for(var i=0;i<=checkboxList.length;i++){
                                                        //   print(checkboxList[i].agency+ "agency - added ");
                                                        // }
                                                        print(
                                                            "<-------------selectedIndexs-------------->" +
                                                                selectedIndexs
                                                                    .toString());
                                                      } else {
                                                        selectedIndexs
                                                            .add(index);
                                                        print(value.toString() +
                                                            "  value");

                                                        checkboxList.add(
                                                            CheckboxModel(
                                                                id: server1.sId
                                                                    .toString(),
                                                                price: server1
                                                                    .price
                                                                    .toString(),
                                                                agency: server1
                                                                    .agency
                                                                    .toString(),
                                                                date: server1
                                                                    .date
                                                                    .toString(),
                                                                index: index));
                                                        // print(checkboxList[index].agency+ "agency added - "+ index.toString());
                                                        // for(var i=0;i<=checkboxList.length;i++){
                                                        //   print(checkboxList[i].agency+ "agency - added ");
                                                        // }
                                                        // if(selectedIndexs[index] == 0) {
                                                        //   var fristid = server1.sId.toString();
                                                        //   var fristprice = server1.price.toString();
                                                        //   var fristagency = server1.agency.toString();
                                                        //   var fristdate = server1.date.toString();
                                                        //
                                                        //   print(fristagency);
                                                        //   final SharedPreferences prefs = await _prefs as SharedPreferences;
                                                        //   prefs.setString("fristid", fristid);
                                                        //   prefs.setString("fristprice", fristprice);
                                                        //   prefs.setString("fristagency", fristagency);
                                                        //   prefs.setString("fristdate", fristdate);
                                                        // }
                                                        // if(selectedIndexs[index] == 1){
                                                        //   var secondid = server1.sId.toString();
                                                        //   var secondprice = server1.price.toString();
                                                        //   var secondagency = server1.agency.toString();
                                                        //   var seconddate = server1.date.toString();
                                                        //
                                                        //   print(secondagency);
                                                        //   final SharedPreferences prefs = await _prefs as SharedPreferences;
                                                        //   prefs.setString("secondid", secondid);
                                                        //   prefs.setString("secondprice", secondprice);
                                                        //   prefs.setString("secondagency", secondagency);
                                                        //   prefs.setString("seconddate", seconddate);
                                                        // }
                                                        // if(selectedIndexs[index] == 2){
                                                        //   var therddid = server1.sId.toString();
                                                        //   var therdprice = server1.price.toString();
                                                        //   var therdagency = server1.agency.toString();
                                                        //   var therddate = server1.date.toString();
                                                        //
                                                        //   print(therdagency);
                                                        //   final SharedPreferences prefs = await _prefs as SharedPreferences;
                                                        //   prefs.setString("therddid", therddid);
                                                        //   prefs.setString("therdprice", therdprice);
                                                        //   prefs.setString("therdagency", therdagency);
                                                        //   prefs.setString("therddate", therddate);
                                                        // }
                                                        print(
                                                            "<-------------selectedIndexs-------------->" +
                                                                selectedIndexs
                                                                    .toString());
                                                        setState(() {
                                                          loaddata();
                                                        });
                                                      }
                                                    },
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
                          : Center(child: CircularProgressIndicator());
                    }),
              ]),
            ],
          ),
        ));
  }
}
