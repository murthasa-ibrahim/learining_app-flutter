import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:learning_app/const/constant.dart';
import 'package:learning_app/screens/Excercise/model/excercise_model.dart';
import 'package:learning_app/screens/Excercise/reading/view/sub_questions_view.dart';
import 'package:learning_app/services/excercise_service/get_excercise.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({
    Key? key,
    required this.testId, required this.subjectId,
  }) : super(key: key);
  final int testId;
  final int subjectId;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.red, kwhight]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: FutureBuilder<ExcercisesModel>(
              future: ExcerciseServices().getExcercise(testId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data!.data;
                  return ExcerciseCard(
                    exercise: data.exercises.last,subjectId: subjectId,testId:testId,
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ExcerciseCard extends StatelessWidget {
  const ExcerciseCard({
    Key? key,
    required this.exercise, required this.subjectId, required this.testId,
  }) : super(key: key);
  final Exercise exercise;
  final int subjectId;
  final int testId;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>
              SubQuestionView(excercise: exercise,subjectId:subjectId,testId: testId, ),
        ),
      ),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
                iconSize: 20,
              ),
              const Text("25.00"),
              const Text(
                "Quit Exam",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'REad the passage and Answer more than five para and the com',
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Card(
          
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ksmallHeight,
                  Html(
                    data: exercise.question,
                  ),
                  // kheight,
                  // kheight,
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).push(MaterialPageRoute(
                  //       builder: (context) => SubQuestionView(
                  //           subQuestion: exercise.subQuestions[1]),
                  //     ));
                  //   },
                  //   child: const Text('Go to question'),
                  // )
                ],
              ),
            ),
          ),
          ksmallHeight
        ],
      ),
    );
  }
}
