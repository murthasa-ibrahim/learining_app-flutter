import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/screens/Excercise/model/excercise_model.dart';
import 'package:learning_app/screens/Excercise/model/submit_result_model.dart';
import 'package:learning_app/screens/result/view/result_view.dart';
import 'package:learning_app/services/submit_result/submit_result.dart';
import 'package:learning_app/utils/utils.dart';

class SubmitResultController extends GetxController {
  RxBool isLoading = false.obs;

  List<String> answersList = [];
  List<Question> questions = [];
  List<int> scores = [];
  List<String> options = [];
  int totalScore = 0;
  final formKey = GlobalKey<FormState>();

  void onSubmit(BuildContext context, int subjectId, int exerciseId, int testId,
      List<SubQuestion> subqustions) {
    formKey.currentState!.save();

    isLoading.value = true;
    log('here');
    findScores(subqustions);

    for (int i = 0; i < subqustions.length; i++) {
      questions.add(Question(
          questionId: subqustions[i].id,
          answer: answersList[i],
          audioAnswerFile: null,
          rightAnswer: subqustions[i].answer ?? '',
          audioRightAnswer: '',
          points: scores[i],
          scoredPoints: totalScore,
          status: 'Right'));
    }

    final data = SubmitResultModel(
        category: 'IELTS',
        subjectId: subjectId,
        testId: testId,
        exerciseId: exerciseId,
        questions: questions);

    SubmitResultService()
        .submitResultApi(data)
        .whenComplete(() => isLoading.value = false)
        .then(
      (value) {
        if (value.success == true) {
          log('succcessfully added ');
          clearData();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => ResultView(testId: testId),
            ),
          );
        } else {
          Utils.showSnackBar(context, value.message ?? '', Colors.red);
        }
      },
    );
  }

  void addAnswersToList(String? value, int index) {
    answersList.add(value ?? '');
  }

  void findScores(List<SubQuestion> subqustions) {
    for (int i = 0; i < subqustions.length; i++) {
      if (subqustions[i].answer == answersList[i]) {
        scores.add(1);
        totalScore++;
        log('enteerd 1');
      } else {
        scores.add(0);
      }
    }
    log('result------------------${totalScore}------$answersList');
  }

  getOptions(dynamic data) {
    if(data != null){
       final da = List<Map<String, dynamic>>.from(data);
    options = da.map<String>((e) => e['option']).toList();
    }
    
  }


  void clearData(){
    answersList.clear();
    totalScore =0;
    scores.clear();
  }
}
