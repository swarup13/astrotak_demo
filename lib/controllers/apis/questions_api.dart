import 'dart:developer';
import 'dart:io';

import 'package:astrotak_demo/constants.dart';
import 'package:astrotak_demo/models/relative_list_data_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import 'package:astrotak_demo/models/question_list_data_model.dart';

Future<QuestionListDataModel?> getQuestions(context) async {
  QuestionListDataModel? result;
  try {
    final response = await http.get(
      Uri.https(kBaseUrl, '/api/question/category/all'),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      result = questionsDataModelFromJson(response.body);
    } else {
      log(response.body);

      EasyLoading.showError('Something went wrong, please try again');
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}

Future<RelativesListDataModel?> getRelatives(context) async {
  RelativesListDataModel? result;
  try {
    final response = await http.get(
      Uri.https(kBaseUrl, '/api/relative/all'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiI4ODA5NzY1MTkxIiwiUm9sZXMiOltdLCJleHAiOjE2NzY0NjE0NzEsImlhdCI6MTY0NDkyNTQ3MX0.EVAhZLNeuKd7e7BstsGW5lYEtggbSfLD_aKqGFLpidgL7UHZTBues0MUQR8sqMD1267V4Y_VheBHpxwKWKA3lQ'
      },
    );
    if (response.statusCode == 200) {
      result = relativesListDataModelFromJson(response.body);
    } else {
      log(response.body);
      EasyLoading.showError('Something went wrong, please try again');
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}
