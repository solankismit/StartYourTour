import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Api.dart';
import '../models/policy_model.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
            "Privacy Policy",
            style: TextStyle(
                fontSize: 18.sp,
                fontFamily: "SegoeUI",
                fontWeight: FontWeight.bold,
                color: Color(0xff004351)),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<policy_model>(
            future: policy().policylist(),
            builder: (context, snapshots) {
              return (snapshots.hasData)
                  ? Padding(
                    padding:  EdgeInsets.all(20.r),
                    child: Container(
                        color: Colors.white,
                        child: ListView(
                          children: [
                            // SizedBox(height: 15.h,),
                            // Text("policy_type : ${snapshots.data?.data?.policyData?[0].policyType.toString()}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            // SizedBox(
                            //   height: 30.h,
                            // ),
                            // Text("policy_for : ${snapshots.data?.data?.policyData?[0].policyFor.toString()}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 30.h,
                            ),
                            // Container(
                            //   padding: EdgeInsets.all(8.r),
                            //     width: 400.h,
                            //    decoration: BoxDecoration(
                            //      border: Border.all(style:BorderStyle.solid,color: Colors.black,width: 2 ),
                            //      borderRadius: BorderRadius.circular(10.r),
                            //    //gradient: LinearGradient(colors:[Colors.green,Colors.greenAccent])
                            //    ),
                            //    // color: Colors.indigoAccent,
                            //     child:
                            //     ),
                            Text( "${snapshots.data?.data?.policyData?[0].policyContent.toString()}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                  )
                  : Center(child: CircularProgressIndicator());
            }));
  }
}
