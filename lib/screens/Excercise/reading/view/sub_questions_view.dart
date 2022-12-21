import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:learning_app/const/constant.dart';
import 'package:learning_app/screens/Excercise/model/excercise_model.dart';

class SubQuestionView extends StatelessWidget {
  const SubQuestionView({
    Key? key, required this.subQuestion,
  }) : super(key: key);
final SubQuestion subQuestion;
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
            child: Column(
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
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'REad the passage and Answer more than five para and the com',
                    maxLines: 2,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          ksmallHeight,
                          Html(
                          data: subQuestion.question ,
                          
                          ),
                          kheight,
                          
                        ],
                      ),
                    ),
                  ),
                ),
                ksmallHeight
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 25, 76, 117)),
            onPressed: (){},child: Text('Submit',style: TextStyle(color: kwhight),)),
        ),
      ),
    );
  }
}
