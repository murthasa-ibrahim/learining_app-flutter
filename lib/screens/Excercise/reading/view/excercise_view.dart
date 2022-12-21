

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:learning_app/const/constant.dart';
import 'package:learning_app/screens/Excercise/model/excercise_model.dart';
import 'package:learning_app/screens/Excercise/reading/view/sub_questions_view.dart';
import 'package:learning_app/services/excercise_service/get_excercise.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({
    Key? key,
    required this.testId,
  }) : super(key: key);
  final int testId;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Colors.red, kwhight])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<ExcercisesModel>(
              future: ExcerciseServices().getExcercise(testId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ExcerciseCard(
                    exercise: snapshot.data!.data.exercises[1],
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
    required this.exercise,
  }) : super(key: key);
  final Exercise exercise;
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
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
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            exercise.question,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView(
                children: [
                  ksmallHeight,
                  Html(
                    data: exercise.question,
                  ),
                  kheight,
                  kheight,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SubQuestionView(
                            subQuestion: exercise.subQuestions[1]),
                      ));
                    },
                    child: const Text('Go to question'),
                  )
                ],
              ),
            ),
          ),
        ),
        ksmallHeight
      ],
    );
  }
}
