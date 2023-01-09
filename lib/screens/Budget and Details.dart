import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/models/Add_requirement_model.dart';
import 'package:syt/screens/navigationbar.dart';
import '../Api.dart';

const createCustompackage = """
mutation createCustompackage(\$userId:String!,\$departurelocation:String!,\$destinationlocation:String!,\$category:String!,\$adult:String!,\$child:String!,\$infont:String!,\$personalcare:Boolean!,\$travelby:String!,\$departurebetween:String!,\$hoteltype:String!,\$meals:String!,\$mealtype:String!,\$additionalrequirements:String!,\$name:String!,\$email:String!,\$phone:String!,\$city:String!,\$budget:String!,\$custompackage_status:String!,)
{
  createCustompackage(custompackageInput:{userId:\$userId,departurelocation:\$departurelocation,destinationlocation:\$destinationlocation,category:\$category,adult:\$adult,child:\$child,infont:\$infont,personalcare:\$personalcare,travelby:\$travelby,departurebetween:\$departurebetween,hoteltype:\$hoteltype,meals:\$meals,mealtype:\$mealtype,additionalrequirements:\$additionalrequirements,name:\$name,email:\$email,phone:\$phone,city:\$city,budget:\$budget,custompackage_status:\$custompackage_status,}){
    _id
    userId
    departurelocation
    destinationlocation
    category
    adult
    child
    infont
    personalcare
    travelby
    departurebetween
    hoteltype
    meals
    mealtype
    additionalrequirements
    name
    email
    phone
    city
    budget
    custompackage_status
    createdAt
    updatedAt
    __typename
}
}""";

class DetailsandBudget extends StatefulWidget {
  String departure,
      destination,
      adult,
      childe,
      infant,
      mealtype,
      requirement,
      personal_care,
      startrange,
      endrange,
      days;
  List<String> travelby, category;
  List<String> meals, hotel;
  DetailsandBudget(
      this.departure,
      this.destination,
      this.adult,
      this.childe,
      this.infant,
      this.personal_care,
      this.travelby,
      this.meals,
      this.mealtype,
      this.requirement,
      this.hotel,
      this.startrange,
      this.endrange,
      this.days,
      this.category,
      {Key? key})
      : super(key: key);

  @override
  _DetailsandBudgetState createState() => _DetailsandBudgetState();
}

class _DetailsandBudgetState extends State<DetailsandBudget> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  var height = 565.h;
  var width = 352.w;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _mobile = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _budget = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  _showDialog(String id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Container(
                height: 380.h,
                width: 260.w,
                child: Padding(
                  padding: EdgeInsets.only(right: 25.w, left: 25.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "Thank You..",
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff004351)),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        "Your request has been submitted successfully. We will get In touch with you in 24hrs",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff7FAAAE)),
                      ),
                      SizedBox(height: 70.h),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff005B62),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xff005B62),
                                spreadRadius: 10,
                                blurRadius: 25,
                                offset: Offset(0, 0),
                              )
                            ]),
                        child: Center(
                          child: Image.asset("assets/thank-you.png"),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        "Request ID :- ${id}",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: "SegoeUI",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff004351)),
                      ),
                      SizedBox(height: 15.h),
                      InkWell(
                        onTap: () {
                         // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigationBars(),
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavigationBars()
                         //  Navigator.of(context).push
                              // CustomPackages(
                              //   widget.departure,
                              //   widget.destination,
                              //   widget.adult,
                              //   widget.childe,
                              //   widget.infant,
                              //   widget.care,
                              //   widget.travelby,
                              //   widget.meals,
                              //   widget.mealtype,
                              //   widget.requirement,
                              //   _name.text,
                              //   _email.text,
                              //   _mobile.text,
                              //   _city.text,
                              //   _budget.text,
                              // ),
                            ),
                              (route)=> false
                          );
                        },
                        child: Container(
                          height: 35.h, // empty
                          width: 120.w, // empty
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
                                "Done",
                                style: TextStyle(
                                    fontSize: 18.sp,
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
                ),
              ));
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _budget.text = "5000";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 90.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Mutation(
              options: MutationOptions(
                  document: gql(createCustompackage),
                  fetchPolicy: FetchPolicy.noCache,
                  onCompleted: (resultdata) {
                    var data = resultdata[("createCustompackage")];
                   // print("AAA:${data}");

                    if (data != null) {
                      _showDialog(data["_id"]);
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OtpScreen()));
                    }
                  }),
              builder: (RunMutation runMutation, QueryResult? result) {
                return
                    // return(result!.isLoading)?Center(child: CircularProgressIndicator(),):
                    // InkWell(onTap: (){
                    //   if(!_formkey.currentState!.validate()){
                    //     return;
                    //   }
                    //   else {
                    //     if (checkbox == true ) {
                    //       print("aaa:");
                    //       runMutation(
                    //           {
                    //
                    //             "fullname":_name.text,
                    //             "email":_email.text,
                    //             "phone":_mobile.text,
                    //             "password":_password.text
                    //
                    //
                    //           }
                    //
                    //       );
                    //       print(result.exception);
                    //
                    //
                    //     }
                    //   }
                    // },
                    //
                    //   child: Container(
                    //     margin: EdgeInsets.only(bottom: 20),
                    //     height: 35.h,
                    //     width: 120.w,
                    //     decoration: BoxDecoration(
                    //       color: Color(0xff09646D),
                    //       borderRadius: BorderRadius.circular(10.r),
                    //       boxShadow: [BoxShadow(
                    //           color: Colors.grey,
                    //           blurRadius: 3,
                    //           offset: Offset(1,2)
                    //
                    //       )
                    //       ],
                    //     ),
                    //     child:  Center(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(bottom: 2),
                    //         child: Text("Sign up ",style: TextStyle(
                    //             fontSize: 18.sp,
                    //             fontFamily: "SegoeUI",
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white
                    //
                    //         ),),
                    //       ),
                    //     ),
                    //   ),
                    // );
                    (result!.isLoading)
                        ? CupertinoActivityIndicator()
                        : InkWell(
                            onTap: () async {
                              String departure = widget.departure.toString();
                              String destination = widget.destination.toString();
                              List<String> category = widget.category;
                              String total_adult = widget.adult;
                              String total_child = widget.childe;
                              String Infant = widget.infant;
                              String personal_care = widget.personal_care;
                             // String travel_by = widget.travelby.toString();
                               List<String> travel_by = widget.travelby;
                              String start_date = widget.startrange.toString();
                              String end_date = widget.endrange.toString();
                              String total_travel_days = widget.days;
                              print(widget.days + ">>>>>>>>>>>>>>>>>>>>>");
                              List<String> hotel_type = widget.hotel;
                               List<String> meal_require = widget.meals;
                              // String hotel_type = widget.hotel.toString();
                              // String meal_require = widget.meals.toString();
                              String meal_type = widget.mealtype;
                              String additional_requirement = widget.requirement;
                              String user_id = "622ca5ed6e0ea05607ef1acc";
                              String full_name = _name.text;
                              String email_address = _email.text;
                              String mobile_no = _mobile.text;
                              String city = _city.text;
                              String budget_per_person = _budget.text;

                              // final SharedPreferences prefs = await _prefs;
                              // prefs.setString("departure", departure);
                              // prefs.setString("destination", destination);
                              // prefs.setString("total_adult", total_adult);
                              // prefs.setString("total_child", total_child);
                              // prefs.setString("Infant", Infant);
                              // prefs.setString("personal_care", personal_care);




                              Add_requirement_model data = await AddRequirement().requirementList(
                                departure,
                                destination,
                                category,
                                total_adult,
                                total_child,
                                Infant,
                                personal_care,
                                travel_by,
                                start_date,
                                end_date,
                                total_travel_days,
                                hotel_type,
                                meal_require,
                                meal_type,
                                additional_requirement,
                                user_id,
                                full_name,
                                email_address,
                                mobile_no,
                                city,
                                budget_per_person,
                              );

                              print(widget.departure);
                              print(widget.destination);
                              print(widget.category);
                              print(widget.adult);
                              print(widget.childe);
                              print(widget.infant);
                              print(widget.personal_care);
                              print(widget.travelby);
                              print(widget.startrange);
                              print(widget.endrange);
                              print(widget.days);
                              print(widget.hotel);
                              print(widget.meals);
                              print(widget.mealtype);
                              print(widget.requirement);
                              print(_name.text);
                              print(_email.text);
                              print(_mobile.text);
                              print(_city.text);
                              print(_budget.text);

                              if (!_formkey.currentState!.validate()) {
                                setState(() {
                                  this.height = 570.h;
                                });
                                return;
                              } else {
                                runMutation({
                                  "userId": "61a5c0ea77330873dc9fe3b9",
                                  "departurelocation": "${widget.departure}",
                                  "destinationlocation":
                                      "${widget.destination}",
                                  "category": "${widget.category}",
                                  "adult": "${widget.adult}",
                                  "child": "${widget.childe}",
                                  "infont": "${widget.infant}",
                                  "personalcare":
                                      (widget.personal_care == "yes")
                                          ? true
                                          : false,
                                  "travelby": "${widget.travelby}",
                                  "departurebetween": "${widget.startrange}",
                                  "hoteltype": "${widget.hotel}",
                                  "meals": "${widget.meals}",
                                  "mealtype": "${widget.mealtype}",
                                  "additionalrequirements":
                                      "${widget.requirement}",
                                  "name": "${_name.text}",
                                  "email": "${_email.text}",
                                  "phone": "${_mobile.text}",
                                  "city": "${_city.text}",
                                  "budget": "${_budget.text}",
                                  "custompackage_status": "active",
                                });
                                print(result.exception);
                              }

                              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TravelBy()));
                            },
                            child: Container(
                              height: 35.h,
                              width: 150.w,
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
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          );
              },
            ),
            // InkWell(
            //   onTap: (){
            //     print(widget.departure);
            //     print(widget.destination);
            //     print(widget.category);
            //     print(widget.adult);
            //     print(widget.childe);
            //     print(widget.infant);
            //     print(widget.care);
            //     print(widget.travelby);
            //     print(widget.date);
            //     print(widget.hotel);
            //     print(widget.meals);
            //     print(widget.mealtype);
            //     print(widget.requirement);
            //     print(_name.text);
            //     print(_email.text);
            //     print(_mobile.text);
            //     print(_city.text);
            //     print(_budget.text);
            //
            //
            //     if(!_formkey.currentState!.validate()){
            //       setState(() {
            //         this.height =570.h;
            //       });
            //
            //       return;
            //     }
            //     else{
            //       _showDialog();
            //     }
            //
            //     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TravelBy()));
            //   },
            //   child: Container(
            //     height: 35.h,
            //     width: 180.w,
            //     decoration: BoxDecoration(
            //       color: Color(0xff09646D),
            //       borderRadius: BorderRadius.circular(10.r),
            //       boxShadow: [BoxShadow(
            //           color: Colors.grey,
            //           blurRadius: 3,
            //           offset: Offset(1,2)
            //
            //       )
            //       ],
            //     ),
            //     child: Center(
            //       child:  Text(
            //         "Submit",
            //         style: TextStyle(
            //
            //             fontSize: 16.sp,
            //             fontFamily: "SegoeUI",
            //             fontWeight: FontWeight.bold,
            //             color:Colors.white),
            //       ),
            //     ),
            //
            //   ),
            // ),
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
          "Budget & Details",
          style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 17.h, right: 26.w, left: 26.w),
              child: Column(
                children: [
                  Container(
                    height: 95.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      // fit: BoxFit.cover,
                      image: AssetImage("assets/navigate.png"),
                    )),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 600.h,
                    width: 370.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff1DD9B7),
                              Color(0xff004148),
                            ])),
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 25.w, left: 25.w, top: 36.h),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "User Details",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffFFFFFF)),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 11.w, left: 11.w),
                              child: TextFormField(
                                controller: _name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name is required';
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff09646D),
                                          width: 1.5)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintText: "Full Name",
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(right: 11.w, left: 11.w),
                              child: TextFormField(
                                controller: _email,
                                validator: (value) {
                                  if (!EmailValidator.validate(value!)) {
                                    return 'Email is not valid';
                                  }
                                  if (value.isEmpty) {
                                    return 'Email is required';
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xff09646D),
                                            width: 1.5)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(color: Colors.white),
                                    suffixIcon: Icon(
                                      CupertinoIcons.mail_solid,
                                      color: Colors.white,
                                      size: 20.sp,
                                    )),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(right: 11.w, left: 11.w),
                              child: TextFormField(
                                maxLength: 10,
                                controller: _mobile,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Mobile number is required';
                                  }
                                  if (value.length < 10) {
                                    return "Enter valid Mobile No.";
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff09646D),
                                          width: 1.5)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  counterText: "",
                                  hintText: "Mobile No",
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon: Icon(
                                    Icons.mobile_friendly_outlined,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(right: 11.w, left: 11.w),
                              child: TextFormField(
                                controller: _city,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'City is required';
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff09646D),
                                          width: 1.5)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintText: "City",
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon: Icon(
                                    Icons.location_city,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Budget",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                               SizedBox(width: 5.w,),
                                Text(
                                  "(Minimum Budget Must be 5000)",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: "SegoeUI",
                                      //fontWeight: FontWeight.bold,
                                      color: Color(0xffFFFFFF)),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.only(
                                  right: 11.w, left: 11.w, bottom: 5.h),
                              child: TextFormField(
                                controller: _budget,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Budget is Required';
                                  }
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff09646D),
                                          width: 1.5)),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintText: "Your Budget",
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon: Icon(
                                    Icons.money,
                                    color: Colors.white,
                                    size: 20.sp,
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
