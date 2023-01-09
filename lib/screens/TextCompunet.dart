

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class font extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Text( "Next",
         style: TextStyle(
             fontSize: 16.sp,
             fontFamily: "SegoeUI",
             fontWeight: FontWeight.bold,
             color: Colors.white),)
      ],
    );
  }
}