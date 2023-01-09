import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/user_info_model.dart';
import 'package:syt/screens/additionaldetails.dart';
import 'package:syt/screens/drawerScreen.dart';
import 'package:image_picker/image_picker.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? regid;
  String? id;

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String UserId = "";
  String name = "";
  String email = "";
  String phoneNo = "";

  @override
  void initState() {
    super.initState();
    loaddata();
    data(name, email, phoneNo);

  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      UserId = (prefs.getString("UserId"))!;
      print(UserId);
    });
  }

  void data(String name,String email,String phoneNo) async{
    final SharedPreferences prefs = await  _prefs;  SharedPreferences;
    setState(() {
      prefs.setString("name",name);
      prefs.setString("email",email);
      prefs.setString("phoneNo",phoneNo);

      // brand_product_id = "6243eb1cf23aa4d9caf33abf";
      // print(userphoto + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
      // print(username + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print("Ankit");
      print(phoneNo + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print(email + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print(name + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
      print("Ankit");
    });
  }

  late String base64image;
  final picker = ImagePicker();
  File? image;
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
            "Profile",
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<user_info_model>(
            future: UserInfo().userinfolist(UserId),
            builder: (context, snapshots) {
              return (snapshots.hasData)
                  ? Container(
                      height: 900.h,
                      color: Colors.red,
                      child: ListView.builder(
                          itemCount: snapshots.data?.data?.length,
                          itemBuilder: (context, index) {
                            var server = snapshots.data!.data![index];

                            String name  = server.name.toString();
                            String email = server.emailAddress.toString();
                            String phoneNo = server.mobileNumber.toString();
                            data(name,email,phoneNo);
                            return Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        pickImage();
                                      });
                                    },
                                    child: (image != null)
                                        ? Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50.r),
                                                border: Border.all(
                                                    color: Color(0xff004351),
                                                    width: 2.0)),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50.r),
                                              child: Image.file(
                                                image!,
                                                height: 100.h,
                                                width: 100.h,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: 90.h,
                                            width: 90.w,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "assets/profile.png")
                                                    // image: AssetImage(server.photo.toString())
                                                    ),
                                                shape: BoxShape.circle),
                                          ),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    //"Hardik Kanzariya",
                                    server.name.toString(),
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff004351)),
                                  ),
                                  Text(
                                    //"User ID: 62299d020a738f523fc0b844",
                                    "User Id: " + server.sId.toString(),
                                    //"User Id: " + UserId,

                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Container(
                                    width: 250.w,
                                    child: Divider(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 45.h,
                                                width: 45.w,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/myBooking.png")),
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Text(
                                                "My Bookings",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 45.h,
                                                width: 45.w,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/editprofile.png")),
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: 16.w,
                                              ),
                                              Text(
                                                "Change Password",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontFamily: "SegoeUI",
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 40.h,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    //height: MediaQuery.of(context).size.height * 0.78,
                                    height: 750.h,
                                    width: 334.w,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Text(
                                          "Edit Profile",
                                          //server.userName.toString(),
                                          style: TextStyle(
                                              fontFamily: "Franklin_Gothic",
                                              color: Colors.black,
                                              fontSize: 18.sp),
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        Container(
                                          width: 250.w,
                                          child: TextFormField(
                                            initialValue:
                                                server.name.toString(),
                                            //controller: _name,
                                            decoration: InputDecoration(
                                                labelText: "Full Name",
                                                hintStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                                labelStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.person,
                                                  size: 20.sp,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Container(
                                          width: 250.w,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: 247.w,
                                                child: TextFormField(
                                                  initialValue: server
                                                      .mobileNumber
                                                      .toString(),
                                                  //controller: _mobile,
                                                  decoration: InputDecoration(
                                                      labelText: "Mobile No",
                                                      labelStyle: TextStyle(
                                                        fontSize: 14.sp,
                                                      ),
                                                      hintStyle: TextStyle(
                                                        fontSize: 14.sp,
                                                      ),
                                                      suffixIcon: Icon(Icons
                                                          .mobile_screen_share_sharp)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Container(
                                          width: 250.w,
                                          child: TextFormField(
                                            initialValue:
                                                server.emailAddress.toString(),
                                            //controller: _email,
                                            decoration: InputDecoration(
                                                labelText: "Email Id",
                                                labelStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                                hintStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.mail_outline,
                                                  size: 20.sp,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Container(
                                          width: 250.w,
                                          child: TextFormField(
                                            initialValue:
                                                server.city.toString(),
                                            decoration: InputDecoration(
                                                labelText: "City"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Container(
                                          width: 250.w,
                                          child: TextFormField(
                                            initialValue:
                                                server.state.toString(),
                                            decoration: InputDecoration(
                                                labelText: "State"),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.event_note),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              "Edit Address",
                                              style: TextStyle(
                                                  fontFamily: "Franklin_Gothic",
                                                  color: Colors.grey,
                                                  fontSize: 16.sp),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                        Container(
                                          height: 100.h,
                                          width: 300.w,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              cursorColor: Color(0xff09646D),
                                              decoration: InputDecoration(
                                                  border: InputBorder.none),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30.h,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            var ProfileId =
                                                server.sId.toString();
                                            final SharedPreferences prefs =
                                                await _prefs;
                                            prefs.setString(
                                                "ProfileId", ProfileId);
                                            print("&&&&&&&&&");
                                            print(ProfileId);

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        AdditionalDetails()));
                                          },
                                          child: Container(
                                            height: 35.h,
                                            width: 180.w,
                                            decoration: BoxDecoration(
                                              color: Color(0xff09646D),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 3,
                                                    offset: Offset(1,2))
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Update Profile",
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
                                  SizedBox(
                                    height: 30.h,
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  : Center(child: CircularProgressIndicator());
            }));
  }

  Future<void> pickImage() async {
    final _image = await ImagePicker().pickImage(source: ImageSource.gallery);

    final imageTemporary = File(_image!.path);
    setState(() {
      this.image = imageTemporary;
      base64image = base64Encode(image!.readAsBytesSync());
      print(image!.path);
    });
  }
}
