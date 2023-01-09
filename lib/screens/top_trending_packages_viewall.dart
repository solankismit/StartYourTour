import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/screens/packagedetailsScreen.dart';
import 'package:syt/Api.dart';

class top_trading_packages_viewall extends StatefulWidget {
  const top_trading_packages_viewall({Key? key}) : super(key: key);

  @override
  State<top_trading_packages_viewall> createState() => _top_trading_packages_viewallState();
}

class _top_trading_packages_viewallState extends State<top_trading_packages_viewall> {


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  //var Packages_id = "";
  var destination_id = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      //Packages_id = (prefs.getString("Packages_id"))!;
      destination_id = (prefs.getString("destination_id"))!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Packages",
          style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body:  FutureBuilder<get_destinationdata_model>(
      future: GetDestinationData().destinationdatalist(destination_id),
      builder: (context, snapshot) {
        return (snapshot.hasData)?
        ListView.builder(
            itemCount:snapshot.data!.data!.length,
            itemBuilder: (context,index){
              var server = snapshot.data!.data![index];
              return Container(
                child: InkWell(
                  onTap: ()  {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackageDetails()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 10.w, bottom: 7.h, top: 4.h, left: 10.h),
                    height: 380.h,
                    width: 380.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        // border: Border.all(color: Color(0xff707070)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(0, 2))
                        ]),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              top: 15.h, right: 4.w, left: 4.w),
                          height: 130.h,
                          width: 370.w,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff707070)),
                              borderRadius:
                              BorderRadius.circular(5.r),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                //image: AssetImage("assets/Baga Beach.jpg")
                                image: NetworkImage(server.packages![index].place.toString()),
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 4.w, left: 15.w, top: 15.h),
                          child: Row(
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
                          padding: EdgeInsets.fromLTRB(15.w, 5.h, 5.w, 0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                //"₹ 2,50,000/ Per Person",
                                "₹ "+server.packages![index].pricePerPerson.toString() + "/Person",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.h),
                                child: Text(
                                  //"7 D-6 N",
                                  server.packages![index].days.toString(),
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.h),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.home_filled,
                                    color: Color(0xff4D2981),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    //"Upto 3 Stars",
                                    "Upto "+server.packages![index].hotelType.toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    CupertinoIcons.airplane,
                                    color: Color(0xff4D2981),
                                  ),
                                  Text(
                                    // "Flights",
                                    "By "+server.packages![index].travelBy.toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.restaurant,
                                    color: Color(0xff4D2981),
                                  ),
                                  Text(
                                    //"Meals",
                                    server.packages![index].mealRequired.toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.map,
                                    color: Color(0xff4D2981),
                                  ),
                                  Text(
                                    //"Sightseeing",
                                    server.packages![index].sightseeing.toString(),
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             MyPlaniing()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 25.h),
                            height: 40.h,
                            width: 250.w,
                            decoration: BoxDecoration(
                              color: Color(0xff09646D),
                              borderRadius:
                              BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(1, 2))
                              ],
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                const EdgeInsets.only(bottom: 2),
                                child: Text(
                                  "Customize & Get Quote",
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
            }
        ):Center(child: CircularProgressIndicator());

      }),
    );
  }
}
