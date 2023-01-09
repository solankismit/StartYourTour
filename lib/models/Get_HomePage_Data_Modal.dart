class Get_HomePage_Data_Model {
  int? code;
  String? status;
  String? message;
  Metadata? metadata;
  List<Data>? data;

  Get_HomePage_Data_Model(
      {this.code, this.status, this.message, this.metadata, this.data});

  Get_HomePage_Data_Model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });

    }
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
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  List<DestinationData>? destinationData;
  List<MostLovaedDestionation>? mostLovaedDestionation;
  List<Saftyinformation>? saftyinformation;

  Data(
      {this.destinationData,
        this.mostLovaedDestionation,
        this.saftyinformation});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['DestinationData'] != null) {
      destinationData = <DestinationData>[];
      json['DestinationData'].forEach((v) {
        destinationData!.add(new DestinationData.fromJson(v));
      });
      print("Length of destination data is ${destinationData?.length}");
    }
    if (json['most_lovaed_destionation'] != null) {
      mostLovaedDestionation = <MostLovaedDestionation>[];
      json['most_lovaed_destionation'].forEach((v) {
        mostLovaedDestionation!.add(new MostLovaedDestionation.fromJson(v));
      });
    }
    if (json['Saftyinformation'] != null) {
      saftyinformation = <Saftyinformation>[];
      json['Saftyinformation'].forEach((v) {
        saftyinformation!.add(new Saftyinformation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.destinationData != null) {
      data['DestinationData'] =
          this.destinationData!.map((v) => v.toJson()).toList();
    }
    if (this.mostLovaedDestionation != null) {
      data['most_lovaed_destionation'] =
          this.mostLovaedDestionation!.map((v) => v.toJson()).toList();
    }
    if (this.saftyinformation != null) {
      data['Saftyinformation'] =
          this.saftyinformation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DestinationData {
  String? sId;
  String? categoryName;
  String? photo;
  bool? status;
  int? iV;

  DestinationData(
      {this.sId, this.categoryName, this.photo, this.status, this.iV});

  DestinationData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    categoryName = json['category_name'];
    photo = json['photo'];
    status = json['status'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['category_name'] = this.categoryName;
    data['photo'] = this.photo;
    data['status'] = this.status;
    data['__v'] = this.iV;
    return data;
  }
}

class MostLovaedDestionation {
  String? sId;
  String? destinationName;
  String? placeToVisits;

  MostLovaedDestionation({this.sId, this.destinationName, this.placeToVisits});

  MostLovaedDestionation.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destinationName = json['destination_name'];
    placeToVisits = json['place_to_visits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination_name'] = this.destinationName;
    data['place_to_visits'] = this.placeToVisits;
    return data;
  }
}

class Saftyinformation {
  Info? info;
  List<Safetyinfo>? safetyinfo;

  Saftyinformation({this.info, this.safetyinfo});

  Saftyinformation.fromJson(Map<String, dynamic> json) {
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
    if (json['safetyinfo'] != null) {
      safetyinfo = <Safetyinfo>[];
      json['safetyinfo'].forEach((v) {
        safetyinfo!.add(new Safetyinfo.fromJson(v));
        print(safetyinfo!.length.toString() + ">>>>>>>>>>>>>");
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.info != null) {
      data['info'] = this.info!.toJson();
    }
    if (this.safetyinfo != null) {
      data['safetyinfo'] = this.safetyinfo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Info {
  String? sId;
  String? description;
  int? iV;

  Info({this.sId, this.description, this.iV});

  Info.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['__v'] = this.iV;
    return data;
  }
}

class Safetyinfo {
  String? sId;
  String? safetyinfoPhoto;
  String? safetyinfoTitle;
  String? descriptionId;
  int? iV;

  Safetyinfo(
      {this.sId,
        this.safetyinfoPhoto,
        this.safetyinfoTitle,
        this.descriptionId,
        this.iV});

  Safetyinfo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    safetyinfoPhoto = json['safetyinfo_photo'];
    safetyinfoTitle = json['safetyinfo_title'];
    descriptionId = json['description_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['safetyinfo_photo'] = this.safetyinfoPhoto;
    data['safetyinfo_title'] = this.safetyinfoTitle;
    data['description_id'] = this.descriptionId;
    data['__v'] = this.iV;
    return data;
  }
}
