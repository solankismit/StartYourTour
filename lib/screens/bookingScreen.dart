import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/screens/paymant_screen/New_payment.dart';
import 'package:syt/screens/paymentdetailsScreen.dart';

class BookingScreen extends StatefulWidget {
  // String departure, destination,infant,adult,childe;
  //
  // BookingScreen(this.departure, this.destination, this.infant,this.childe,this.adult,
  // {Key? key}) : super(key: key);
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Razorpay _razorpay;
  var adults = 1;
  var child = 0;
  var infant = 0;
  String name = "";
  String email = "";
  String phoneNo = "";
  String bid_package_id = "";
  String total_adult = "";
  String total_child = "";
  String total_infant = "";
  String departure = "";
  String agencyprice = "";
  String destination = "";
  String totalday = "";
  TextEditingController _duration = TextEditingController();

  // TextEditingController _email = TextEditingController();
  // TextEditingController _departure = TextEditingController();
  //TextEditingController _mobile = TextEditingController();
  ScrollController _scrollController = ScrollController();
  late TextEditingController _name;
  late TextEditingController _email;
  late TextEditingController _mobile;
  late TextEditingController _departure;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loaddata();
  }

  void loaddata() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      name = (prefs.getString("name")) ?? "";
      email = (prefs.getString("email")) ?? "";
      phoneNo = (prefs.getString("phoneNo")) ?? "";
      bid_package_id = (prefs.getString("bid_package_id")) ?? "";
      total_adult = (prefs.getString("total_adult")) ?? "";
      total_child = (prefs.getString("total_child")) ?? "";
      total_infant = (prefs.getString("total_infant")) ?? "";
      departure = (prefs.getString("departure")) ?? "";
      agencyprice = (prefs.getString("agencyprice")) ?? "";
      destination = (prefs.getString("destination")) ?? "";
      totalday = (prefs.getString("totalday")) ?? "";

      _name = TextEditingController(text: name);
      _email = TextEditingController(text: email);
      _mobile = TextEditingController(text: phoneNo);
      _departure = TextEditingController(text: departure);

      print(name.toString() + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(email + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(phoneNo + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(bid_package_id + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(total_adult + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(total_child + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(total_infant + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(departure + ">>>>>>>>>>>>>>>>>>>>>>>>");
      print(destination + ">>>>>>>>>>>>>>>>>>>>>>>>");
    });
  }

  int def_index = 0;
  void openCheckout() async {
    if (def_index == 1) {
      var options = {
        'key': 'rzp_live_ILgsfZCZoFIKMb',
        'amount': num.parse(agencyprice) * 100,
        'name': 'StartYourTour',
        'description': 'payment',
        'retry': {'enabled': true, 'max_count': 1},
        'send_sms_hash': true,
        'prefill': {'contact': '${phoneNo}', 'email': '${email}'},
        'external': {
          'wallets': ['paytm']
        }
      };
      try {
        _razorpay.open(options);
      } catch (e) {
        debugPrint('Error: e');
      }
    }
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
          "Booking",
          style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "SegoeUI",
              fontWeight: FontWeight.bold,
              color: Color(0xff004351)),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: 70.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {

                if (!_formkey.currentState!.validate()) {
                  return;
                    //openCheckout();
                }
                else {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => payment(name, email, phoneNo, agencyprice)));


                }
              },
              child: Container(
                height: 40.h,
                width: 180.w,
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
                    "Proceed To Pay",
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
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 200.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        bottomRight: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                        topLeft: Radius.circular(10.r),
                      ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/canadaDetails.png"))),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Row(
                        children: [
                          Container(
                            width: 200.w,
                            child: Text(
                              "${departure} ${"to"} ${destination}",
                              // "Canada Package with CN Tower Tour",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xff1F08B1),
                            size: 20.sp,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xff1F08B1),
                            size: 20.sp,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xff1F08B1),
                            size: 20.sp,
                          ),
                          Icon(
                            Icons.star,
                            color: Color(0xff1F08B1),
                            size: 20.sp,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xff1F08B1),
                            size: 20.sp,
                          ),
                          Text(
                            "(2074)",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "SegoeUI",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 10.w),
                  height: 80.h,
                  width: 380.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.w, left: 5.w),
                        child: Row(
                          children: [
                            Text(
                              //"₹ 1,98,000/- ₹ 2,50,000/-",
                              "${"₹"}${agencyprice}",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "SegoeUI",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Row(
                              children: [
                                Text(
                                  "Per Person on twin sharing",
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "SegoeUI",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${destination} ($totalday)",
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
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Booking Details",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: "SegoeUI",
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Form(
                  key: _formkey,
                  child: Container(
                    width: 340.w,
                    // height: 267.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff013C43),
                              Color(0xff18676D),
                            ])),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 35.h, right: 45.w, bottom: 35.h, left: 45.w),
                      child: Column(
                        children: [
                          TextFormField(
                            readOnly: false,
                            controller: _name,
                            // initialValue: name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Name is Required';
                              }
                            },
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                                suffixIcon: Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          TextFormField(
                            controller: _departure,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Departure location is Required';
                              }
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "Departure",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                                suffixIcon: Icon(
                                  CupertinoIcons.airplane,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          TextFormField(
                            readOnly: false,
                            controller: _email,
                            //initialValue: email,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Email is Required';
                              }
                              if (!EmailValidator.validate(value)) {
                                return 'Email is not valid';
                              }
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                hintText: "EmailId",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                                suffixIcon: Icon(
                                  CupertinoIcons.mail_solid,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          TextFormField(
                            // readOnly: true,
                            controller: _mobile,
                            // initialValue:phoneNo,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Mobile No is Required';
                              }
                              if (value.length < 10) {
                                return "Enter valid mobile number";
                              }
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                counterText: "",
                                hintText: "Mobile",
                                //"+91 Mobile No",
                                hintStyle: TextStyle(
                                    color: Colors.white, fontSize: 16.sp),
                                suffixIcon: Icon(
                                  Icons.mobile_friendly_outlined,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white))),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Adult :- $adults",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Child :- $child",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Infant :- $infant",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  Text(
                                    "Total :- ${(int.parse(total_adult) + int.parse(total_child) + int.parse(total_infant)).toString()}",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: "SegoeUI",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
//    var startDate = dateRangePickerSelectionChangedArgs.value.startDate;
//    var endDate = dateRangePickerSelectionChangedArgs.value.endDate;
//     var date1=(endDate==null)? "${DateFormat('dd-MM-yyyy').format(startDate)}": DateFormat('dd-MM-yyyy').format(endDate);
// setState(() {
//   String date="${DateFormat('dd-MM-yyyy').format(startDate)} to $date1";
//   _duration.text=date;
//   //"${DateFormat.yMd().format(monthlyPicker)} to ${DateFormat.yMd().format(dateRangePickerSelectionChangedArgs.value.endDate)}";
//
// });
//
//
//   }

}
