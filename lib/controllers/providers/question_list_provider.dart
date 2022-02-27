import 'package:astrotak_demo/controllers/apis/questions_api.dart';
import 'package:astrotak_demo/models/question_list_data_model.dart';
import 'package:astrotak_demo/models/relative_list_data_model.dart';
import 'package:flutter/foundation.dart';

class AstrotakProvider with ChangeNotifier {
  QuestionListDataModel? questions = QuestionListDataModel();
  RelativesListDataModel? relatives = RelativesListDataModel();

  bool loading = false;

  getQuestionData(context) async {
    loading = true;
    questions = await getQuestions(context);
    loading = false;

    notifyListeners();
  }

  getRelativesData(context) async {
    loading = true;
    relatives = await getRelatives(context);
    loading = false;

    notifyListeners();
  }
}
