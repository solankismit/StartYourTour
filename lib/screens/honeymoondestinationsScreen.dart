import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/getdestination_list_model.dart';
import 'package:syt/screens/budget(Per%20Head)Screen.dart';
import 'package:syt/screens/packagesScreen.dart';

class HoneymoonDestinations extends StatefulWidget {
  @override
  _HoneymoonDestinationsState createState() => _HoneymoonDestinationsState();
}

class _HoneymoonDestinationsState extends State<HoneymoonDestinations> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var cat_id = "";
  var cat_name = "";

  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      cat_id = (prefs.getString("cat_id"))!;
      cat_name = (prefs.getString("cat_name"))!;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(cat_id);
    print("and and and");
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => BudgetPerHead()));
          },
          backgroundColor: Color(0xffFF4C04),
          child: Icon(
            Icons.filter_list_alt,
            color: Colors.white,
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
            cat_name,
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          // centerTitle: true,
        ),
        body: Container(
            color: Colors.white,
            child: FutureBuilder<getdestination_list_model>(
                future: Getdestination_List().dataList(cat_id),
                builder: (context, snapshots) {
                  return (snapshots.hasData)
                      ? ListView.builder(
                      itemCount: snapshots.data!.data?.length,
                      itemBuilder: (context, index) {
                        var server = snapshots.data!.data![index];
                        return Column(
                          children: [
                            SizedBox(height: 20.h),
                            InkWell(
                              onTap: () async{
                                var destination_id = server.sId.toString();
                                var destination_name = server.destinationName.toString();
                                var destination_package= server.package.toString();
                                var destination_placeToVisit =server.placeToVisit.toString();

                                final SharedPreferences prefs = await _prefs;
                                prefs.setString("destination_id", destination_id);
                                prefs.setString("destination_name", destination_name);
                                prefs.setString("destination_package", destination_package);
                                prefs.setString("destination_placeToVisit", destination_placeToVisit);

                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PackagesScreen()));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width: 390.w,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 3,
                                            offset: Offset(1, 2))
                                      ],
                                      color: Color(0xffF7F7F7),
                                      borderRadius:
                                      BorderRadius.circular(15.r),
                                    ),
                                  ),
                                  Container(
                                    width: 340.w,
                                    height: 150.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15.r),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          //image: AssetImage("assets/Baga Beach.jpg"),
                                          image:NetworkImage(server.placeToVisit.toString()),
                                        )),
                                  ),
                                  Positioned(
                                    top: 4.h,
                                    left: 15.w,
                                    child: Text(
                                      //"MALDIVES",
                                      server.destinationName.toString(),
                                      //server.howToReach.toString(),
                                      style: TextStyle(
                                          fontSize: 18.sp,
                                          fontFamily: "SegoeUI",
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFFCC).withOpacity(0.7)),
                                    ),
                                  ),
                                  Positioned(
                                    top: 18.h,
                                    left: 348.w,
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Text(
                                        //"35,000/Person",
                                        "₹ "+ server.package.toString() + "/Person",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: "SegoeUI",
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffFF7307)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        );
                      })
                      : Center(child: CircularProgressIndicator());
                })));
  }
}
