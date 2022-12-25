import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:learning_app/const/constant.dart';
import 'package:learning_app/screens/Excercise/reading/view/excercise_view.dart';
import 'package:learning_app/screens/dashbord/model/dashbord_model.dart';
import 'package:learning_app/screens/test/controller/test_controller.dart';
import 'package:learning_app/screens/test/model/test_model.dart';
import 'package:learning_app/services/get_tests/get_tests.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key, required this.subject}) : super(key: key);
final Subject subject;
  @override
  Widget build(BuildContext context) {
  
     return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
              end: Alignment.center,
        colors: [
        Colors.red,
        kwhight
      ])),
       child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(onPressed: ()=>Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("EPT"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            kheight,
            Text(subject.subject.name),
            kheight,
            Expanded(
              child: FutureBuilder<TestsModel>(
                future: GetTestServices().getTests(subject.id),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    
                    return  ListView.builder(
                  padding: const EdgeInsets.all(15),
                  itemCount: snapshot.data?.data.tests.length,
                  itemBuilder: (context, index) => TestCard(test: snapshot.data!.data.tests[index],subjectId: subject.id,index: index,),);
                  
                  }
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()));
                  }
                  return const Center(child: CircularProgressIndicator(),);
                }
                
              ),
            )
          ],
        ),
       ),
     );
  }
}

class TestCard extends StatelessWidget {
  const TestCard({
    Key? key, required this.test, required this.subjectId, required this.index,
  }) : super(key: key);
final Test test;
final int subjectId;
final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ExerciseView(testId: test.id,subjectId: subjectId),)),
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 10),
        child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
              kwidth,
              Text(test.name),
             const Spacer(),
             const Icon( Icons.lock) ,
              kwidth
              ],
            ),
          
            const Divider(thickness: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(test.duration),
               Text(test.exercisesCount),
               const  Text('4 try left',),
              ],
            ),
          ],
        ),
                  ),
      ),
    );
  }
}