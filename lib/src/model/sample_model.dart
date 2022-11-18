
class SampleModelResponse {
  bool? hasError;
  String? errorMessage;
  SampleModel? sampleModel;

  SampleModelResponse({this.hasError, this.errorMessage, this.sampleModel});

  SampleModelResponse.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    errorMessage = json['errorMessage'];
    sampleModel = json['sampleModel'] != null ? SampleModel.fromJson(json['sampleModel']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasError'] = this.hasError;
    data['errorMessage'] = this.errorMessage;
    if (this.sampleModel != null) {
      data['sampleModel'] = this.sampleModel!.toJson();
    }
    return data;
  }
}

class SampleModel {
  int? page;
  int? perPage;
  int? totalrecord;
  int? totalPages;
  List<TouristModel>? data;
  Error? error;

  SampleModel(
      {this.page, this.perPage, this.totalrecord, this.totalPages, this.data});

  SampleModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    totalrecord = json['totalrecord'];
    totalPages = json['total_pages'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;

    if (json['data'] != null) {
      data = <TouristModel>[];
      json['data'].forEach((v) {
        data!.add(new TouristModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['totalrecord'] = this.totalrecord;
    data['total_pages'] = this.totalPages;
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TouristModel {
  int? id;
  String? touristName;
  String? touristEmail;
  String? touristProfilepicture;
  String? touristLocation;
  String? createdat;

  TouristModel(
      {this.id,
        this.touristName,
        this.touristEmail,
        this.touristProfilepicture,
        this.touristLocation,
        this.createdat});

  TouristModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    touristName = json['tourist_name'];
    touristEmail = json['tourist_email'];
    touristProfilepicture = json['tourist_profilepicture'];
    touristLocation = json['tourist_location'];
    createdat = json['createdat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tourist_name'] = this.touristName;
    data['tourist_email'] = this.touristEmail;
    data['tourist_profilepicture'] = this.touristProfilepicture;
    data['tourist_location'] = this.touristLocation;
    data['createdat'] = this.createdat;
    return data;
  }
}
class Error {
  bool? error;
  String? errorMessage;

  Error({this.error, this.errorMessage});

  Error.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorMessage = json['errorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['errorMessage'] = this.errorMessage;
    return data;
  }
}

