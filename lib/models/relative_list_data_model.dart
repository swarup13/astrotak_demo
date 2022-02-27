// To parse this JSON data, do
//
//     final relativesListDataModel = relativesListDataModelFromJson(jsonString);

import 'dart:convert';

RelativesListDataModel relativesListDataModelFromJson(String str) =>
    RelativesListDataModel.fromJson(json.decode(str));

String relativesListDataModelToJson(RelativesListDataModel data) =>
    json.encode(data.toJson());

class RelativesListDataModel {
  RelativesListDataModel({
    this.httpStatus,
    this.httpStatusCode,
    this.success,
    this.message,
    this.apiName,
    this.data,
  });

  String? httpStatus;
  int? httpStatusCode;
  bool? success;
  String? message;
  String? apiName;
  Data? data;

  factory RelativesListDataModel.fromJson(Map<String, dynamic> json) =>
      RelativesListDataModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.pageNo,
    this.numberOfElements,
    this.pageSize,
    this.totalElements,
    this.totalPages,
    this.allRelatives,
  });

  int? pageNo;
  int? numberOfElements;
  int? pageSize;
  int? totalElements;
  int? totalPages;
  List<RelativeObject>? allRelatives;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageNo: json["pageNo"],
        numberOfElements: json["numberOfElements"],
        pageSize: json["pageSize"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        allRelatives: List<RelativeObject>.from(
            json["allRelatives"].map((x) => RelativeObject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNo": pageNo,
        "numberOfElements": numberOfElements,
        "pageSize": pageSize,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "allRelatives":
            List<dynamic>.from(allRelatives!.map((x) => x.toJson())),
      };
}

class RelativeObject {
  RelativeObject({
    this.uuid,
    this.relation,
    this.relationId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.fullName,
    this.gender,
    this.dateAndTimeOfBirth,
    this.birthDetails,
    this.birthPlace,
  });

  String? uuid;
  String? relation;
  int? relationId;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? fullName;
  String? gender;
  DateTime? dateAndTimeOfBirth;
  BirthDetails? birthDetails;
  BirthPlace? birthPlace;

  factory RelativeObject.fromJson(Map<String, dynamic> json) => RelativeObject(
        uuid: json["uuid"],
        relation: json["relation"],
        relationId: json["relationId"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        fullName: json["fullName"],
        gender: json["gender"],
        dateAndTimeOfBirth: DateTime.parse(json["dateAndTimeOfBirth"]),
        birthDetails: BirthDetails.fromJson(json["birthDetails"]),
        birthPlace: BirthPlace.fromJson(json["birthPlace"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "relation": relation,
        "relationId": relationId,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "fullName": fullName,
        "gender": gender,
        "dateAndTimeOfBirth": dateAndTimeOfBirth?.toIso8601String(),
        "birthDetails": birthDetails?.toJson(),
        "birthPlace": birthPlace?.toJson(),
      };
}

class BirthDetails {
  BirthDetails({
    this.dobYear,
    this.dobMonth,
    this.dobDay,
    this.tobHour,
    this.tobMin,
    this.meridiem,
  });

  int? dobYear;
  int? dobMonth;
  int? dobDay;
  int? tobHour;
  int? tobMin;
  String? meridiem;

  factory BirthDetails.fromJson(Map<String, dynamic> json) => BirthDetails(
        dobYear: json["dobYear"],
        dobMonth: json["dobMonth"],
        dobDay: json["dobDay"],
        tobHour: json["tobHour"],
        tobMin: json["tobMin"],
        meridiem: json["meridiem"],
      );

  Map<String, dynamic> toJson() => {
        "dobYear": dobYear,
        "dobMonth": dobMonth,
        "dobDay": dobDay,
        "tobHour": tobHour,
        "tobMin": tobMin,
        "meridiem": meridiem,
      };
}

class BirthPlace {
  BirthPlace({
    this.placeName,
    this.placeId,
  });

  String? placeName;
  String? placeId;

  factory BirthPlace.fromJson(Map<String, dynamic> json) => BirthPlace(
        placeName: json["placeName"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
      };
}
