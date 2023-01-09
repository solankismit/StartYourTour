class login_model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  Data? data;

  login_model({this.code, this.status, this.message, this.metadata, this.data});

  login_model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Metadata {
  int? length;

  Metadata({this.length});

  Metadata.fromJson(Map<String, dynamic> json) {
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['length'] = this.length;
    return data;
  }
}

class Data {
  String? token;
  List<Result>? result;

  Data({this.token, this.result});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? sId;
  String? userName;
  String? emailAddress;
  String? mobileNumber;
  String? password;
  String? referalCode;
  String? gender;
  String? photo;
  String? state;
  String? city;
  String? status;
  int? iV;
  // int role=0;

  Result(
      {this.sId,
        // required this.role,
        this.userName,
        this.emailAddress,
        this.mobileNumber,
        this.password,
        this.referalCode,
        this.gender,
        this.photo,
        this.state,
        this.city,
        this.status,
        this.iV
      });

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userName = json['user_name'];
    emailAddress = json['email_address'];
    mobileNumber = json['mobile_number'];
    password = json['password'];
    referalCode = json['referal_code'];
    gender = json['gender'];
    photo = json['photo'];
    state = json['state'];
    city = json['city'];
    status = json['status'];
    iV = json['__v'];
    // role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user_name'] = this.userName;
    data['email_address'] = this.emailAddress;
    data['mobile_number'] = this.mobileNumber;
    data['password'] = this.password;
    data['referal_code'] = this.referalCode;
    data['gender'] = this.gender;
    data['photo'] = this.photo;
    data['state'] = this.state;
    data['city'] = this.city;
    data['status'] = this.status;
    data['__v'] = this.iV;
    // data['role'] = this.role;
    return data;
  }
}