import 'dart:async';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/screens/otpScreen.dart';
import '../Api.dart';
import '../models/update_password_model.dart';
import 'forgot_password_with_otp.dart';
import 'loginScreen.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool password = true;
  bool newpassword = true;
  String phone = "";
  String countrycode = "+91";
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  FocusNode _passwordFocus = FocusNode();
  FocusNode _confirmPasswordFocus = FocusNode();


  @override
  void initState() {
    super.initState();
    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      //emailAddress = prefs.getString("emailAddress");
      phone = prefs.getString("phone").toString();
      print(prefs.getString("phone").toString());
    });
    setState(() {});
  }


  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              Column(
                children: [
                  Stack(
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
                      IconButton(
                        onPressed: () {
                         // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xff004351),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "NEW PASSWORD",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 42,
                      right: 40,
                    ),
                    child: TextFormField(
                      maxLength: 10,
                      //keyboardType: TextInputType.number,
                      obscureText: password,
                      focusNode: _confirmPasswordFocus,

                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Mobile No is required";
                      //   }
                      //   if (value.length < 10) {
                      //     return "Enter valid Mobile No.";
                      //   }
                      // },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              print(password.toString() + "1111111111111111111111111111");
                              password = !password;
                            });
                          },
                          icon: Icon((password != true)
                              ? Icons.remove_red_eye_rounded
                              : Icons.remove_red_eye_outlined),
                        ),
                        counterText: "",
                        hintText: "New Password",
                        hintStyle: TextStyle(fontSize: 18.sp),
                        labelText: "New Password",
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
                      controller: _passwordController,
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 42,
                      right: 40,
                    ),
                    child: TextFormField(
                      maxLength: 10,
                      obscureText: newpassword,
                    //  keyboardType: TextInputType.text,
                      focusNode: _passwordFocus,
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Mobile No is required";
                      //   }
                      //   if (value.length < 10) {
                      //     return "Enter valid Mobile No.";
                      //   }
                      // },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              newpassword = !newpassword;
                            });
                          },
                          icon: Icon((newpassword != true)
                              ? Icons.remove_red_eye_rounded
                              : Icons.remove_red_eye_outlined),
                        ),
                        counterText: "",
                        hintText: "Conform Password",
                        hintStyle: TextStyle(fontSize: 18.sp),
                        labelText: "Conform Password",
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
                      controller: _confirmPasswordController,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),



                  SizedBox(
                    height: 70.h,
                  ),
                  InkWell(
                    onTap: () {
                      if (!_formkey.currentState!.validate()) {
                        return;
                      } else {
                        continueClick();
                      }
                    },
                    child: Container(
                      height: 35.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(1, 2))
                          ],
                          color: Color(0xff09646D),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Text(
                            "Submit",
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
            ],
          ),
        ),
      ),
    );
  }
  continueClick() async {
    final SharedPreferences prefs = await _prefs;

    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text.trim();
    if (password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('PHONE_MUST_BE_REQUIRED', ),
        backgroundColor: Colors.red,
      ));
    } else if (confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content:
        Text('CONFIRM_PASSWORD_MUST_BE_REQUIRED',),
        backgroundColor: Colors.red,
      ));
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('PASSWORD_DID_NOT_MATCH', ),
        backgroundColor: Colors.red,
      ));
    } else {
      ///post Api

      String mobile_number = phone;
      print(mobile_number + "++++++++++++++++++++++++++++++");
      String newpassword = _confirmPasswordController.text.trim();
      print(newpassword + "+++++++++++++++++++++++++++++++++");
     // String role = "customer";

      Update_password data = await UpdatePassword().UpdatePasswordList(mobile_number, newpassword);
       print(data.message.toString() + "+++++++++++++++++++++++++++++++++++++++++");
      if (data.message.toString() == "data retrived") {
        print("SUCCESS 😊👌👌👌👌👌");
        print("+++++++xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx+++++++++++");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
          Text("your password is updated & LogIn With New Password..."),
          backgroundColor: Colors.black,
        ));
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen(),
        ));
      }

      FocusScope.of(context).requestFocus(new FocusNode());
    }
  }
}

