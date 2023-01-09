import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syt/Base%20Url.dart';
import 'package:http/http.dart' as http;
import 'package:syt/models/Add_requirement_model.dart';
import 'package:syt/models/display_userbid_model.dart';
import 'package:syt/models/get_bid_model.dart';
import 'package:syt/models/get_destinationdata_model.dart';
import 'package:syt/models/get_pakege_details_modal.dart';
import 'package:syt/models/getdestination_catagory_model.dart';
import 'package:syt/models/getdestination_list_model.dart';
import 'dart:convert';
import 'package:syt/models/login_model.dart';
import 'package:syt/models/ragister_model.dart';
import 'package:syt/models/update_profil_model.dart';
import 'package:syt/models/user_info_model.dart';
import 'models/Get_HomePage_Data_Modal.dart';
import 'models/Get_custom_requirementtt_model.dart';
import 'models/Notification_Dispaly_Model.dart';
import 'models/bidpakege_comper_model.dart';
import 'models/bookpakege_model.dart';
import 'models/delete_custom_requirement_model.dart';
import 'models/display_review_model.dart';
import 'models/get_bookpakeges_model.dart';
import 'models/gethoteltype_catagory_model.dart';
import 'models/getmeal_catagory_model.dart';
import 'models/getmealtype_catagory_model.dart';
import 'models/getmostloveddestinations_catagory_model.dart';
import 'models/gettravelby_catagory_model.dart';
import 'models/mobile_no_mach_model.dart';
import 'models/policy_model.dart';
import 'models/safetyinfo_model.dart';
import 'models/submit_review_model.dart';
import 'models/updateBidStatus_model.dart';
import 'models/update_password_model.dart';

class Login {
  Login();
  Future<login_model> userList(mobile_number, password, role) async {
    var url = (LURL + "/admin/login");
    print("=====================================================");
    print(url);
    http.Response response = await http.post(Uri.parse(url),
        //
        //
        // headers: {"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNjA4OTQsImV4cCI6MTY3ODc5Njg5NH0.4fwO04O0RUs5ltoZOQ_d_OOpnfgtl9H2vgXOUkRNi6o"},
        headers: {"content-type": "application/json"

        },
        body: json.encode({
          "mobile_number": mobile_number,
          "password": password,
          "role": 0,
        }));
    print(response.body);
    var data = json.decode(response.body);
    print("Login" + response.body);
    print("=====================================================");
    return login_model.fromJson(data);
    print("=====================================================");
    //return loginmodel.fromJson({"name":"syt"});
  }
}

class Ragister {
  Ragister();
  Future<register_model> userdetails(name, email_address, mobile_number,
      password, referal_code, gender, state, city) async {
    var url = (LURL + "/user");
    http.Response response = await http.post(Uri.parse(url),
        //headers: {"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"},
        headers: {"content-type": "application/json"},
        body: json.encode({
          "name": name,
          "email_address": email_address,
          "mobile_number": mobile_number,
          "password": password,
          "referal_code": referal_code,
          "gender": gender,
          "state": state,
          "city": city,
        }));
    var data = json.decode(response.body);
    print("Ragister" + response.body);
    return register_model.fromJson(data);
  }
}

class Getdestination_catagory {
  Getdestination_catagory();
  Future<getdestination_catagoty_model> getcategoryList() async {
    var url = (LURL + "/destinationcategory");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
       // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"
      },
    );
    var data = json.decode(response.body);
    print("Getdestination_catagory" + response.body);
    return getdestination_catagoty_model.fromJson(data);
  }
}

class Gettravelby_catagory {
  Gettravelby_catagory();
  Future<gettravelby_catagory_model> gettravelbyList() async {
    var url = (LURL + "/travelby");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"
      },
    );
    var data = json.decode(response.body);
    print("Gettravelby_catagory" + response.body);
    return gettravelby_catagory_model.fromJson(data);
  }
}

class Gethoteltype_catagory {
  Gethoteltype_catagory();
  Future<gethoteltype_catagory_model> gethoteltypeList() async {
    var url = (LURL + "/hoteltype");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"
      },
    );
    var data = json.decode(response.body);
    print("Gethoteltype_catagory" + response.body);
    return gethoteltype_catagory_model.fromJson(data);
  }
}

class Getmeal_catagory {
  Getmeal_catagory();
  Future<getmeal_catagory_model> getmealList() async {
    var url = (LURL + "/meal");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"
      },
    );
    var data = json.decode(response.body);
    print("Getmeal_catagory" + response.body);
    return getmeal_catagory_model.fromJson(data);
  }
}

class Getmealtype_catagory {
  Getmealtype_catagory();
  Future<getmealtype_catagory_model> getmealtypeList() async {
    var url = (LURL + "/mealtype");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"
      },
    );
    var data = json.decode(response.body);
    print("Getmealtype_catagory" + response.body);
    return getmealtype_catagory_model.fromJson(data);
  }
}

class Getmostloveddestinations_catagory {
  Getmostloveddestinations_catagory();
  Future<getmostloveddestinations_catagory_model> getmostloveddestinationsList() async {
    var url = (LURL + "/destination/mostloveddestionation");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
       // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoidXNlciIsImlkIjoiNjJhYWM2NzAzZThiMzE2ZWYxZDA3MjcyIiwiZW1haWxfYWRkcmVzcyI6ImFua0BnbWFpbC5jb20iLCJpYXQiOjE2NTUzNTkxMjcsImV4cCI6MTY4Njg5NTEyN30.UxAmpQC1sDQdjzX6Utfzpv-p9JV2GXi-EkiJ_cmxjoU"
      },
    );
    var data = json.decode(response.body);
    print("Getmostloveddestinations_catagory" + response.body);
    return getmostloveddestinations_catagory_model.fromJson(data);
  }
}


class Getseftyinfo{
  Getseftyinfo();
  Future<safetyinfo_model> getseftyinfoList() async {
    var url = (LURL + "/safetyinfo");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoidXNlciIsImlkIjoiNjJhYWM2NzAzZThiMzE2ZWYxZDA3MjcyIiwiZW1haWxfYWRkcmVzcyI6ImFua0BnbWFpbC5jb20iLCJpYXQiOjE2NTUzNTkxMjcsImV4cCI6MTY4Njg5NTEyN30.UxAmpQC1sDQdjzX6Utfzpv-p9JV2GXi-EkiJ_cmxjoU"
      },
    );
    var data = json.decode(response.body);
    print("Getseftyinfo" + response.body);
    return safetyinfo_model.fromJson(data);
  }
}


class Getdestination_List {
  Getdestination_List();
  Future<getdestination_list_model> dataList(cat_id_api) async {
    // 622ef2b10eec039c9852863e
    var url = (LURL + "/destination/getDestinations?category_id=$cat_id_api");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDc4Mzg4MzIsImV4cCI6MTY3OTM3NDgzMn0.n6qcZcqoOYnggmCwIxFMvlm98frYi4mZJvwzCwPZuvM"
      },
    );
    var data = json.decode(response.body);
    print("Parikshit*******************************"+prefs.getString("UserId").toString()??"");

    print("Getdestination_List" + response.body);

    return getdestination_list_model.fromJson(data);
  }
}

class UserInfo {
  UserInfo();
  Future<user_info_model> userinfolist(UserId_token) async {
    var url = (LURL + "/user/userprofile");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(Uri.parse(url),
      // headers: {"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDc4Mzg4MzIsImV4cCI6MTY3OTM3NDgzMn0.n6qcZcqoOYnggmCwIxFMvlm98frYi4mZJvwzCwPZuvM" + "$UserId_token"},
      headers: {"Authorization": "$UserId_token"},
     // headers: {"Authorization": prefs.getString("UserId")??"",},
    );
    var data = json.decode(response.body);
    print("UserInfo" + response.body);
    return user_info_model.fromJson(data);
  }
}

class GetDestinationData {
  GetDestinationData();
  Future<get_destinationdata_model> destinationdatalist(destination_id) async {
    var url = (LURL + "/destination/getDestinationData?destination_id=$destination_id");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    // var url = "192.168.200.132:3000/destination/getDestinationData?destination_id=$getdestinationdata_name_api";
    //6229d23413790a85a23a08e9
    http.Response response = await http.get(Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDc4Mzg4MzIsImV4cCI6MTY3OTM3NDgzMn0.n6qcZcqoOYnggmCwIxFMvlm98frYi4mZJvwzCwPZuvM"
      },
    );
    var data = json.decode(response.body);
    print("GetDestinationData" + response.body);
    return get_destinationdata_model.fromJson(data);
  }
}

class GetPackageDetails {
  GetPackageDetails();
  Future<get_pakege_details_modal> pakegedetailsList(getpackagedetails_api) async {
    var url = (LURL + "/package/getPackageData?package_id=$getpackagedetails_api");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    http.Response response = await http.get(Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDc4Mzg4MzIsImV4cCI6MTY3OTM3NDgzMn0.n6qcZcqoOYnggmCwIxFMvlm98frYi4mZJvwzCwPZuvM"
      },
    );
    var data = json.decode(response.body);
    print("GetPackageDetails" + response.body);
    return get_pakege_details_modal.fromJson(data);
  }
}

class AddRequirement {
  AddRequirement();
  Future<Add_requirement_model> requirementList(
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
      budget_per_person) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var url = (LURL + "/customrequirements");
    http.Response response = await http.post(Uri.parse(url),
        headers: {"content-type": "application/json",
          "Authorization": prefs.getString("UserId")??"",
          //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDc4Mzg4MzIsImV4cCI6MTY3OTM3NDgzMn0.n6qcZcqoOYnggmCwIxFMvlm98frYi4mZJvwzCwPZuvM"
        },
        // headers: {"Authorization": "application/json"},
        body: json.encode({
          "departure": departure,
          "destination": destination,
          "category": category,
          "total_adult": total_adult,
          "total_child": total_child,
          "Infant": Infant,
          "personal_care": personal_care,
          "travel_by": travel_by,
          "start_date": start_date,
          "end_date": end_date,
          "total_travel_days": total_travel_days,
          "hotel_type": hotel_type,
          "meal_require": meal_require,
          "meal_type": meal_type,
          "additional_requirement": additional_requirement,
          "user_id": user_id,
          "full_name": full_name,
          "email_address": email_address,
          "mobile_no": mobile_no,
          "city": city,
          "budget_per_person": budget_per_person
        }));
    var data = json.decode(response.body);
    print("AddRequirement" + response.body);
    print("---------------------------------------------------------------");
    print( prefs.getString("UserId")??"" + "tokan=====================================>");
    return Add_requirement_model.fromJson(data);
  }
}

class Display_userbid {
  Display_userbid();
  Future<display_userbid_model> userbidlist(getuserbid_id) async {
    print(getuserbid_id + "<------------------API.dart------------------>");
    var url = (LURL + "/bidpackage/displaybidpackages?custom_requirement_id=$getuserbid_id");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(
      Uri.parse(url),
      //62b2c4e54cb9c14f14dd45be
      //62ac1cf5c0c9aa4e5631677c
      //621de9ae081dd76aad84d289
      //62ab34699d1baba80a311aae
      //display_userbid
      headers: {
        "Authorization":prefs.getString("UserId")??"",
        //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyM2FlNjFkZTE5MWMzMjNiZTYwODEzNCIsImVtYWlsX2FkZHJlc3MiOiJoZXJyeTEyM0BnbWFpbC5jb20iLCJpYXQiOjE2NDgxMTA4MjIsImV4cCI6MTY3OTY0NjgyMn0.xtOD_5D3FiYF2Jt-QbaoN-14zw-IIJ2IncL90xjGZ08"
      },
      // headers: {"Authorization": "application/json"},
    );
    var data = json.decode(response.body);

    print("Display_userbid" + response.body);
    //print( prefs.getString("UserId")??"" + "===========================ankit");
    return display_userbid_model.fromJson(data);
  }
}


class GetCustomRequirement {
  GetCustomRequirement();
  Future<Get_custom_requirementtt_model> getcustomrequirementlist() async {
    var url = (LURL + "/customrequirements");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization":
          prefs.getString("UserId")??"",
        // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8",
        });
    var data = json.decode(response.body);
    print("GetCustomRequirement" + response.body);
    print( prefs.getString("UserId")??"" + "===========================ankit");

    return Get_custom_requirementtt_model.fromJson(data);
  }
}

class GetBid {
  GetBid();
  Future<Get_bid_model> GetbidList(getbid_id) async {
    var url = (LURL + "/bidpackage/biddetails?_id=$getbid_id");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    //
    //621de9ae081dd76aad84d289
    http.Response response = await http.get(Uri.parse(url),
        headers: {
      "Authorization":prefs.getString("UserId")??"",
     // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
    });
    print("------------------>");
    print(getbid_id + "AnkitChangela>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    var data = json.decode(response.body);
    print("GetBid" + response.body);
    return Get_bid_model.fromJson(data);
  }
}



class updateProfile{
  updateProfile();
  Future<update_profile>updateprofileList() async{
    var url = (LURL + "/user/updateprofile");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "Authorization":prefs.getString("UserId")??"",
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
        }
    );
    var data = json.decode(response.body);
    print("GetBid" + response.body);
    return update_profile.fromJson(data);
  }
}


class MobileMach {
  MobileMach();
  Future<mobileno_mach_model> MobileMachdata( mobile_number) async {
    var url = (LURL + "/user/checkmobilenumber");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.post(Uri.parse(url),
        //headers: {"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"},
        headers: {"content-type": "application/json",
        "Authorization":
       // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoidXNlciIsImlkIjoiNjJlMzlhZGJmYThkNzg0ODc2MDI1MGEwIiwiZW1haWxfYWRkcmVzcyI6InBhcmlrc2hpdEBnbWFpbC5jb20iLCJpYXQiOjE2NTkwODgzODcsImV4cCI6MTY5MDYyNDM4N30.4lyZHJkOieLtVJELj_MlNCs3DXF2YfUIg7PPU_0wQd8"
        prefs.getString("UserId")??"",
        },
        body: json.encode({
          "mobile_number": mobile_number,

        }));
    var data = json.decode(response.body);
    print("MobileMach" + response.body);
    return mobileno_mach_model.fromJson(data);
  }
}
class UpdatePassword {
  UpdatePassword();
  Future<Update_password> UpdatePasswordList(
      mobile_number, newpassword) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var url = LURL + "/user/chengepassword";
    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "Authorization":  prefs.getString("UserId")??"",
        },
        body: json.encode({
          "mobile_number": mobile_number,
          "newpassword": newpassword,
        }));
    var data = json.decode(response.body);
    print("UpdatePassword " + response.body);
    return Update_password.fromJson(data);
  }
}


class delete_requirement {
  delete_requirement();
  Future<delete_custom_requirement_model> deleterequirementlist(delete_id) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var url = LURL + "/customrequirements?_id=$delete_id";
    http.Response response = await http.delete(
      Uri.parse(url),
      headers: {
        "Authorization":prefs.getString("UserId")??"",

      },
    );
    var data = json.decode(response.body);
    print("delete_requirement" + response.body);
    return delete_custom_requirement_model.fromJson(data);
  }
}


class Comper_bidpakege {
  Comper_bidpakege();
  Future<bid_pakege_comper_model> Comperbidpakegeslist(fristid,secondid) async {
    var url = (LURL + "/bidpackage?id=$fristid&_id=$secondid");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    //
    //621de9ae081dd76aad84d289
    http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization":prefs.getString("UserId")??"",
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
        });
    print(fristid + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print(secondid + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print("------------------>");

    var data = json.decode(response.body);


    print("Comper_bidpakege" + response.body);
    print("ANkit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    print( data.toString() + "ANkitData>>>>>>>>>>>>>");
    print("ANkit>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    return bid_pakege_comper_model.fromJson(data);
  }

}


class updateBidStatus{
  updateBidStatus();
  Future<updateBidStatus_model>updateBidStatuslist(BidstatusId) async{
    var url = (LURL + "/bidpackage/updateBidStatus/$BidstatusId");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.put(Uri.parse(url),
        headers: {
          "Authorization":prefs.getString("UserId")??"",
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
        }
    );
    var data = json.decode(response.body);
    print("updateBidStatus" + response.body);
    return updateBidStatus_model.fromJson(data);
  }
}


class book_pakege {
  book_pakege();
  Future<bookpakege_model> bookpakegedata(
      payment_type,
      bid_package_id,
      total_adult,
      total_child,
      total_infant,
      contact_number,
      email_id,
      approx_start_date,
      totaldays,
      totalnight,
      meal,
      meal_type,
      siteseeing,
      transport_mode,
      transport_include_exclude,
      hoteltype,
      priceperperson,
      category,
      booked_include,
      booked_exclude,
      personal_care,
      othere_requirement,
      custom_package_id,
      departure,
      approx_end_date,
      user_name,
      total_person,
      agency_contect_no,
      ) async {
    var url = (LURL + "/bookpackage");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.post(Uri.parse(url),
        //headers: {"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"},
        headers: {"content-type": "application/json",
          "Authorization":
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoidXNlciIsImlkIjoiNjJlMzlhZGJmYThkNzg0ODc2MDI1MGEwIiwiZW1haWxfYWRkcmVzcyI6InBhcmlrc2hpdEBnbWFpbC5jb20iLCJpYXQiOjE2NTkwODgzODcsImV4cCI6MTY5MDYyNDM4N30.4lyZHJkOieLtVJELj_MlNCs3DXF2YfUIg7PPU_0wQd8"
          prefs.getString("UserId")??"",
        },
        body: json.encode({
          "payment_type":payment_type,
          "bid_package_id":bid_package_id,
          "total_adult":total_adult,
          "total_child":total_child,
          "total_infant":total_infant,
          "contact_number":contact_number,
          "email_id":email_id,
          "approx_start_date":approx_start_date,
          "totaldays":totaldays,
          "totalnight":totalnight,
          "meal":meal,
          "meal_type":meal_type,
          "siteseeing":siteseeing,
          "transport_mode":transport_mode,
          "transport_include_exclude":transport_include_exclude,
          "hoteltype":hoteltype,
          "priceperperson":priceperperson,
          "category":category,
          "booked_include":booked_include,
          "booked_exclude":booked_exclude,
          "personal_care":personal_care,
          "othere_requirement":othere_requirement,
          "custom_package_id":custom_package_id,
          "departure":departure,
          "approx_end_date":approx_end_date,
          "user_name":user_name,
          "total_person":total_person,
          "agency_contect_no":agency_contect_no,

        }));
    var data = json.decode(response.body);
    print("book_pakege" + response.body);
    return bookpakege_model.fromJson(data);
  }
}



class get_book {
  get_book();
  Future<get_bookpakege_model> Getbooklist() async {
    var url = (LURL + "/bookpackage");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    //
    //621de9ae081dd76aad84d289
    http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization":
          prefs.getString("UserId")??"",
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
        });
    print("------------------>");
    var data = json.decode(response.body);
    print("get_book" + response.body);
    return get_bookpakege_model.fromJson(data);
  }
}

class policy {
  policy();
  Future<policy_model> policylist() async {
    var url = (LURL + "/policy");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    //
    //621de9ae081dd76aad84d289
    http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization":prefs.getString("UserId")??"",
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
        });
    print("------------------>");
    var data = json.decode(response.body);
    print("get_book" + response.body);
    return policy_model.fromJson(data);
  }
}


class submitreview {
  submitreview();
  Future<submit_review_model> submitreviewlist( book_package_id,star,comment_box) async {
    var url = (LURL + "/review");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    http.Response response = await http.post(Uri.parse(url),
        //headers: {"Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMmNhNWVkNmUwZWEwNTYwN2VmMWFjYyIsImVtYWlsX2FkZHJlc3MiOiJoYXJkaWsud2ViZWFybEBnbWFpbC5jb20iLCJpYXQiOjE2NDcyNDA1MTYsImV4cCI6MTY3ODc3NjUxNn0.s8dyFqrl0mOOB-DuzzY05ytaedpG1HYaKV5Rpx9PHsA"},
        headers: {"content-type": "application/json",
          "Authorization":
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoidXNlciIsImlkIjoiNjJlMzlhZGJmYThkNzg0ODc2MDI1MGEwIiwiZW1haWxfYWRkcmVzcyI6InBhcmlrc2hpdEBnbWFpbC5jb20iLCJpYXQiOjE2NTkwODgzODcsImV4cCI6MTY5MDYyNDM4N30.4lyZHJkOieLtVJELj_MlNCs3DXF2YfUIg7PPU_0wQd8"
          prefs.getString("UserId")??"",
        },
        body: json.encode({
          "book_package_id": book_package_id,
          "star": star,
          "comment_box": comment_box,

        }));
    var data = json.decode(response.body);
    print("submitreview" + response.body);
    return submit_review_model.fromJson(data);
  }
}


class Display_review {
  Display_review();
  Future<display_review_model> Displayreviewlist(agencyid) async {
    var url = (LURL + "/review?bid_id=$agencyid");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    //
    //621de9ae081dd76aad84d289
    http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization":prefs.getString("UserId")??"",
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
        });

    var data = json.decode(response.body);
    print("Display_review" + response.body);
    print(agencyid + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Ankit");
    return display_review_model.fromJson(data);

  }

}

class Notification_Display {
  Notification_Display();
  Future<Notification_dispaly_Model> Notification_DisplayList() async {
    var url = (LURL + "/notification");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    //
    //621de9ae081dd76aad84d289
    http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization":prefs.getString("UserId")??"",
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
        });

    var data = json.decode(response.body);
    print("Notification_Display" + response.body);
   // print(agencyid + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Ankit");
    return Notification_dispaly_Model.fromJson(data);

  }

}


class HomePage_Data {
  HomePage_Data();
  Future<Get_HomePage_Data_Model> HomePage_DataList() async {
    var url = (LURL + "/home");
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    //
    //621de9ae081dd76aad84d289
    http.Response response = await http.get(Uri.parse(url),
        headers: {
          "Authorization":prefs.getString("UserId")??"",
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYyMTYyODNkZjRkZGM4ZWYzYmIwMDQ2MSIsImVtYWlsX2FkZHJlc3MiOiJhYmMxQGdtYWlsLmNvbSIsImlhdCI6MTY0NjY0NTA3NywiZXhwIjoxNjc4MTgxMDc3fQ.wS4ogGle3YChwqEBnK-QReJPBhhVQNJ2rHJnjGug_a8"
        }
        );

    var data = json.decode(response.body);
    debugPrint("HomePageDisplay" + response.body);
     print(response.body + ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Ankit");
    return Get_HomePage_Data_Model.fromJson(data);

  }

}




