import 'dart:convert';

import 'package:delta_to_html/delta_to_html.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:syt/screens/Budget%20and%20Details.dart';

import 'TextCompunet.dart';

class AdditionalRequirements extends StatefulWidget {
  String departure,
      destination,
      adult,
      childe,
      infant,
      mealtype,
      startrange,
      personal_care,
      endrange,
      days;
  List<String> travelby, category;
  List<String> meals, hotel;
  AdditionalRequirements(
      this.departure,
      this.destination,
      this.adult,
      this.childe,
      this.infant,
      this.personal_care,
      this.travelby,
      this.meals,
      this.mealtype,
      this.hotel,
      this.startrange,
      this.endrange,
      this.days,
      this.category,
      {Key? key})
      : super(key: key);

  @override
  _AdditionalRequirementsState createState() => _AdditionalRequirementsState();
}

class _AdditionalRequirementsState extends State<AdditionalRequirements> {

  final FocusNode _focusNode = FocusNode();
  var json = "";
  final ScrollController _scrollController = ScrollController();
  static Document quillDoc = Document()..insert(0, '');
  final _addrequirement = QuillController(document: quillDoc, selection: TextSelection.collapsed(offset: 0));
 // String html = DeltaToHTML.encode(quillDoc.toDelta());

  //late FocusNode _focusNode;
  //TextEditingController _addrequirement = TextEditingController();

  String result = '';

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
            InkWell(
              onTap: () {
                //json = jsonEncode(_addrequirement.document.toDelta().toJson());
               // print(html + "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<,");
               //  Navigator.of(context).push(MaterialPageRoute(
               //      builder: (context) => DetailsandBudget(
               //          widget.departure,
               //          widget.destination,
               //          widget.adult,
               //          widget.childe,
               //          widget.infant,
               //          widget.personal_care,
               //          widget.travelby,
               //          widget.meals,
               //          widget.mealtype,
               //          _addrequirement.document.toDelta().toJson().toString(),
               //          //json,
               //          widget.hotel,
               //          widget.startrange,
               //          widget.endrange,
               //          widget.days,
               //          widget.category))
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsandBudget(
                    widget.departure,
                    widget.destination,
                    widget.adult,
                    widget.childe,
                    widget.infant,
                    widget.personal_care,
                    widget.travelby,
                    widget.meals,
                    widget.mealtype,
                    _addrequirement.document.toDelta().toJson().toString(),
                    //json,
                    widget.hotel,
                    widget.startrange,
                    widget.endrange,
                    widget.days,
                    widget.category
                ),

                ));
              },
              child: Container(
                height: 35.h,
                width: 150.w,
                decoration: BoxDecoration(
                  color: Color(0xff09646D),
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 3, offset: Offset(1, 2))
                  ],
                ),
                child: Center(
                  child:Padding(
                    padding:  EdgeInsets.only(top: 5.h),
                    child: font(),
                  )
                ),
              ),
            ),
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
        // title: Text(
        //   "Additional Requirements",
        //   style: TextStyle(
        //       fontSize: 18.sp,
        //       fontFamily: "SegoeUI",
        //       fontWeight: FontWeight.bold,
        //       color: Color(0xff004351)),
        // ),
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
                    height: 30.h,
                  ),

                  Center(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(20)),
                      height: 400,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: QuillToolbar.basic(
                              toolbarIconSize: 20,
                              showUnderLineButton: true,
                              controller: _addrequirement,
                              multiRowsDisplay: false,
                              showColorButton: false,
                              showStrikeThrough: false,
                              showVideoButton: false,
                              showImageButton: false,
                              showBackgroundColorButton: false,
                              showCodeBlock: false,
                              // showInlineCode: false,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: QuillEditor(
                                  placeholder: "Type Your Requirement",
                                  controller: _addrequirement,
                                  focusNode: _focusNode,
                                  scrollController: _scrollController,
                                  scrollable: true,
                                  padding: EdgeInsets.zero,
                                  autoFocus: false,
                                  readOnly: false,
                                  expands: false),
                            ),
                          ),
                          // MarkdownBody(data: quillToMarkdown(json),shrinkWrap: true,)
                        ],
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
