
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/const/constant.dart';
import 'package:learning_app/screens/dashbord/view/dashbord_view.dart';
import 'package:learning_app/screens/result/controller/result_controller.dart';
import 'package:learning_app/screens/result/model/get_reslut.dart';
import 'package:learning_app/services/get_result/get_reslut.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key, required this.testId}) : super(key: key);
final int testId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResultviewController());
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Result'),
            centerTitle: true,
            leading: IconButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DashBordView(),));
            }, icon: const Icon(Icons.arrow_back_ios)),
            backgroundColor:  const Color.fromARGB(255, 255, 223, 129),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 223, 129),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<GetResultModel>(
              future:GetResultService().getResultApi(testId),
              builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Congratulations',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                    Text('Your Score',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: kblack, fontWeight: FontWeight.bold)),
                    Text(
                      "${double.parse(snapshot.data!.data.result.points).round()}/10",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          )),
        ),
        ConfettiWidget(
            confettiController: controller.confiController,
            blastDirectionality: BlastDirectionality.explosive)
      ],
    );
  }
}
