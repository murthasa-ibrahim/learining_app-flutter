import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import 'package:learning_app/const/constant.dart';
import 'package:learning_app/screens/Excercise/model/excercise_model.dart';
import 'package:learning_app/screens/Excercise/reading/controller/submit_result_controller.dart';

class SubQuestionView extends StatelessWidget {
  const SubQuestionView({
    Key? key,
    required this.excercise,
    required this.testId,
    required this.subjectId,
  }) : super(key: key);
  final Exercise excercise;
  final int testId;
  final int subjectId;
  @override
  Widget build(BuildContext context) {
    final submitController = Get.put(SubmitResultController());
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.center,
          colors: [Colors.red, kwhight],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    key: submitController.formKey,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: excercise.subQuestions.length,
                        itemBuilder: (context, index) {
                          final data = excercise.subQuestions[index];
                          submitController.getOptions(data.options);
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Html(
                                  data: data.question,
                                ),
                                Text(data.answer.toString()),
                                data.noOfOptions != '0'
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: data.options?.length,
                                        itemBuilder: (context, index) =>
                                            Text(submitController
                                                .options[index]),
                                      )
                                    : const SizedBox(),
                                kheight,
                                TextFormField(
                                  onSaved: (newValue) => submitController
                                      .addAnswersToList(newValue, index),
                                  maxLines: 2,
                                  decoration: const InputDecoration(
                                      hintText: 'Type Here...',
                                      border: OutlineInputBorder()),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                ksmallHeight
              ],
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 25, 76, 117)),
              onPressed: () {
                submitController.onSubmit(context, subjectId,
                    excercise.id, testId, excercise.subQuestions);
              },
              child: submitController.isLoading.value == false
                  ? const Text(
                      'Submit',
                      style: TextStyle(color: kwhight),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
