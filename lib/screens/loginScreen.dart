import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/login_model.dart';
import 'package:syt/screens/forgotpasswordScreen.dart';
import 'package:syt/screens/navigationbar.dart';
import 'package:syt/screens/signupScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final userlogin = """
query userlogin(\$username:String!,\$password:String!,\$userType:String!){
  userlogin(username:\$username,password:\$password,userType:\$userType){
    userId
    token
    userType
    tokenExpiration
  }
}
""";
  bool password = true;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    late login_model _loginmodel;

    FocusNode _mobile = FocusNode();
    FocusNode _pass = FocusNode();

    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          content: Text("Tap back again to live"),
        ),
        child: Container(
          color: Colors.white,
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 320.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  "assets/undraw_Traveling_re_weve.png"))),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "LOG IN",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.w, right: 50.w),
                      child: TextFormField(
                        maxLength: 10,
                        controller: mobile,
                        // focusNode: _mobile,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Mobile number is required ";
                          }
                          if (value.length < 10) {
                            return "Enter valid Mobile No.";
                          }
                        },

                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          // counterText: "",
                          hintText: "Mobile No.",
                          hintStyle: TextStyle(fontSize: 18.sp),

                          labelText: "Mobile No.",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.r),
                            borderSide: BorderSide(color: Color(0xff0A6A73)),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0A6A73)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50.w, right: 50.w),
                      child: TextFormField(
                        obscureText: password,
                        controller: _password,
                        // focusNode: _pass,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is required";
                          }
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                password = !password;
                              });
                            },
                            icon: Icon((password != true)
                                ? Icons.remove_red_eye_rounded
                                : Icons.remove_red_eye_outlined),
                          ),
                          hintText: "Password",
                          labelText: "Password",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff0A6A73)),
                              borderRadius: BorderRadius.circular(15.r)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.r)),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff0A6A73)),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 240.w,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                          },
                          child: Text(
                            "Forgot Password?",
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
                      height: 30.h,
                    ),
                    InkWell(
                      onTap: () async {
                        dynamic mobileNumber = mobile.text;
                        String password = _password.text;
                        var role = 0;

                        final SharedPreferences prefs = await _prefs;

                        login_model? data = (await Login().userList(mobileNumber, password, role)) as login_model;

                        setState(() {
                          _loginmodel = data;
                          print("cross check");

                          if (!_formkey.currentState!.validate()) {
                            return;
                          } else {

                            if (data.toJson()["message"] ==
                                "successfully login") {
                              print("SUCCESS 😊👌👌👌👌👌");
                              print(data.toJson()["data"]["token"]);

                              prefs.setString("UserId", data.toJson()["data"]["token"]);
                             // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigationBars()));
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavigationBars()));
                            } else {
                              const snackBar = SnackBar(
                                  content: Text(
                                      "Mobile number or password is wrong"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        });
                      },
                      child: Container(
                        height: 35.h,
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
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              "Log in",
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
                      height: 30.h,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Are you a travel agency?",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                          },
                          child: Text(
                            "Create Account ",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0A6A73)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
