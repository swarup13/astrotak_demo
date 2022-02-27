// To parse this JSON data, do
//
//     final questionsDataModel = questionsDataModelFromJson(jsonString);

import 'dart:convert';

QuestionListDataModel questionsDataModelFromJson(String str) =>
    QuestionListDataModel.fromJson(json.decode(str));

String questionsDataModelToJson(QuestionListDataModel data) =>
    json.encode(data.toJson());

class QuestionListDataModel {
  QuestionListDataModel({
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
  List<QuestionObject>? data;

  factory QuestionListDataModel.fromJson(Map<String, dynamic> json) =>
      QuestionListDataModel(
        httpStatus: json["httpStatus"],
        httpStatusCode: json["httpStatusCode"],
        success: json["success"],
        message: json["message"],
        apiName: json["apiName"],
        data: List<QuestionObject>.from(
            json["data"].map((x) => QuestionObject.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "httpStatus": httpStatus,
        "httpStatusCode": httpStatusCode,
        "success": success,
        "message": message,
        "apiName": apiName,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class QuestionObject {
  QuestionObject({
    this.id,
    this.name,
    this.description,
    this.price,
    this.suggestions,
  });

  int? id;
  String? name;
  String? description;
  double? price;
  List<String>? suggestions;

  factory QuestionObject.fromJson(Map<String, dynamic> json) => QuestionObject(
        id: json["id"],
        name: json["name"],
        description: json["description"] == null ? null : json["description"],
        price: json["price"],
        suggestions: List<String>.from(json["suggestions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description == null ? null : description,
        "price": price,
        "suggestions": List<dynamic>.from(suggestions!.map((x) => x)),
      };
}
