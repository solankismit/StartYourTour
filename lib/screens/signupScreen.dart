import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Api.dart';
import 'package:syt/models/ragister_model.dart';
import 'package:syt/screens/loginScreen.dart';
import 'package:syt/screens/privacypolicyScreen.dart';
import 'package:syt/screens/termsandconditionScreen.dart';

import 'otpScreen.dart';

// const createUser = """
// mutation createUser(\$fullname:String!, \$email:String!,\$phone:String!,\$password:String!){
//   createUser(userInput:{fullname:\$fullname,email:\$email,phone:\$phone,password:\$password}){
// _id
// fullname
// email
// phone
// password
// }
// }""";

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController _controller = TextEditingController();
  late String verificationid;

  final userlogin = "";
  //final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _referal_code = TextEditingController();
  //TextEditingController radiogroup1 = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();

  bool checkbox = false;
  bool password = true;
  int val = 1;

  String radiogroup1 = "1"; //Male
  //String radiogroup2 = "2"; //Female

  late register_model _register_model;
  @override
  void initState() {
    super.initState();
    UserRagister();
    // _formKey = GlobalKey<FormState>();
  }

  UserRagister() async {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
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
                    height: 30.h,
                  ),
                  Text(
                    "SIGN UP",
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
                    padding: EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: _name,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Name is required";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        labelText: "Full Name",
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
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email is required";
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Email is not valid';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Email ID",
                        labelText: "Email ID",
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
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      maxLength: 10,
                      controller: _mobile,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Mobile number is required";
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "Mobile No",
                        labelText: "Mobile No",
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
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 40),
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
                    // TextFormField(
                    //   controller: _password,
                    //   validator: (value) {
                    //     if (value!.isEmpty) {
                    //       return "Password is required";
                    //     }
                    //   },
                    //   decoration: InputDecoration(
                    //     hintText: "Password",
                    //     labelText: "Password",
                    //     enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Color(0xff0A6A73)),
                    //         borderRadius: BorderRadius.circular(15.r)),
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(15.r)),
                    //     disabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: Color(0xff0A6A73)),
                    //     ),
                    //   ),
                    // ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      controller: _referal_code,
                      validator: (value) {
                        if (value != _password.text) {
                          return "";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
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
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 50.w),
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            // color: Color(0xff0A6A73)
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 32.w),
                          Radio(
                            activeColor: Colors.blue,
                            value: "1",
                            groupValue: radiogroup1,
                            onChanged: (value) {
                              setState(() {
                                radiogroup1 = value.toString();
                                print(radiogroup1);
                              });
                            },
                          ),
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                // color: Color(0xff0A6A73)
                                color: Colors.black45),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 42.w),
                          Radio(
                            activeColor: Colors.blue,
                            value: "2",
                            groupValue: radiogroup1,
                            onChanged: (value) {
                              setState(() {
                                radiogroup1 = value.toString();
                                print(radiogroup1);
                              });
                            },
                          ),
                          Text(
                            "Female",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      controller: _state,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "State is required";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: " State",
                        labelText: " State",
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
                  SizedBox(
                    height: 25.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 42, right: 40),
                    child: TextFormField(
                      controller: _city,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "City is required";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: " City",
                        labelText: " City",
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
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 32.w,
                      ),
                      Container(
                        child: Checkbox(
                          splashRadius: 5.r,
                          value: checkbox,
                          activeColor: Color(0xff0A6A73),
                          onChanged: (value) {
                            setState(() {
                              this.checkbox = value!;
                            });
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 5.w),
                                child: Text(
                                  'I Accept',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => TermsAndCondition()));
                                },
                                child: Text(
                                  'T&C',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff0A6A73)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.w,right: 5.w),
                                child: Text(
                                  'And',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: "SegoeUI",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PrivacyPolicy()));
                                },
                                child: Text(
                                    "Privacy Policy",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff0A6A73)),
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () async {
                          final SharedPreferences prefs = await _prefs;
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            String name = _name.text;
                            String email_address = _email.text;
                            String mobile_number = _mobile.text;
                            String password = _password.text;
                            String referal_code = _referal_code.text;
                            String gender = radiogroup1;
                            String state = _state.text;
                            String city = _city.text;
                           // String ref = "233828";

                            prefs.setString("name", name);
                            prefs.setString("email_address", email_address);
                            prefs.setString("mobile_number", mobile_number);
                            prefs.setString("password", password);
                            prefs.setString("referal_code", referal_code);
                            prefs.setString("gender", gender);
                            prefs.setString("state", state);
                            prefs.setString("city", city);



                            if (name.isEmpty) {
                              print(name + "++++++++++++++++++++++");
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('name_field_is_required',), backgroundColor: Colors.red,),

                              );
                            } else if (email_address.isEmpty) {
                              print(email_address + "++++++++++++++++++++++");
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('email_address_is_required',), backgroundColor: Colors.red,),

                              );

                            } else if (mobile_number.isEmpty) {
                              print(mobile_number + "++++++++++++++++++++++");
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('mobile_number_MUST_BE_REQUIRED',),backgroundColor: Colors.red,),

                              );
                            } else if (password.isEmpty) {
                              print(password + "++++++++++++++++++++++");

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('PASSWORD_MUST_BE_REQUIRED'),
                                backgroundColor: Colors.red,),

                              );

                            } else if (gender.isEmpty) {
                              print(gender + "++++++++++++++++++++++");

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('gender_DID_NOT_MATCH'),
                                backgroundColor: Colors.red,
                              ));

                            } else if (state.isEmpty) {
                              print(state + "++++++++++++++++++++++");

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('state_DID_NOT_MATCH'),
                                backgroundColor: Colors.red,
                              ));
                            }else if (city.isEmpty) {
                              print(city + "++++++++++++++++++++++");

                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('city_DID_NOT_MATCH'),
                                backgroundColor: Colors.red,
                              ));
                            }

                            else if (referal_code.isEmpty) {
                              print(referal_code + "++++++++++++++++++++++");

                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('referal_code_DID_NOT_MATCH'),
                                    backgroundColor: Colors.red,
                                  ));
                            }



                            else {
                              print(
                                  "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");



                              continueClick();
                              //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OtpScreen(this._controller.text, mobile: null,)));

                            }
                          }
                      // String name = _name.text;
                      // String email_address = _email.text;
                      // String mobile_number = _mobile.text;
                      // String password = _password.text;
                      // String referal_code = _referal_code.text;
                      // String gender = radiogroup1;
                      // String state = _state.text;
                      // String city = _city.text;
                      //
                      // register_model data = await Ragister().userdetails(
                      //     name,
                      //     email_address,
                      //     mobile_number,
                      //     password,
                      //     referal_code,
                      //     gender,
                      //     state,
                      //     city);
                      //
                      // setState(() async {
                      //   _register_model = data;
                      //   print("syt");
                      //
                      //   if (data.toJson()["message"] == "user registered") {
                      //     print("SUCCESS 😊👌👌👌👌👌");
                      //     continueClick();
                      //   } else {
                      //     print("User is already registerd");
                      //   }
                      // });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 40.h),
                      height: 35.h,
                      width: 120.h,
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
                            "Sign up ",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
  continueClick() {
    FocusScope.of(context).requestFocus(new FocusNode());
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VerificationScreen(
          mobile: _mobile.text.trim(),
          countrycode: "+91",
        ),
      ),
    );
  }
}
