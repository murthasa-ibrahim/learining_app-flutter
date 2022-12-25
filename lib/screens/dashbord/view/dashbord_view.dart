import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/const/constant.dart';
import 'package:learning_app/screens/dashbord/controller/dashbord_controller.dart';
import 'package:learning_app/screens/dashbord/model/dashbord_model.dart';
import 'package:learning_app/screens/splash/controller/splash_controller.dart';
import 'package:learning_app/services/api_urls/api_urls.dart';
import 'package:learning_app/services/get_dashbord/get_dashbord.dart';
import 'package:learning_app/utils/utils.dart';

import '../../my_account/controller/controller.dart';
import '../../test/view/test_view.dart';

class DashBordView extends StatelessWidget {
  const DashBordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.put(DashBordController());
    final accountController = Get.put(MyAccountController(),);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [Colors.red, Colors.white]),),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: GetBuilder<SplahController>(
            builder: (spcontroller) => 
             Utils.hasInternet ? FutureBuilder<DashbordModel>(
                future: DashbordService().getDashbord(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ListTile(
                          leading:
                              IconButton(onPressed: (){
                                accountController.logout();
                              }, icon: const Icon(Icons.directions_boat_filled_outlined)),
                          trailing: Container(
                            height: 47,
                            width: 150,
                            decoration: BoxDecoration(
                              color: kblack,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color: kwhight,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'General',
                                      style:
                                          TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Education',
                                  style: TextStyle(
                                      color: kwhight,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome,',
                                  style: Theme.of(context).textTheme.headline6),
                              ksmallHeight,
                              Obx(() => 
                                 Text(
                                  '${controller.userName}!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                'Subjects',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * .17,
                          child: ListView.builder(
                            itemCount: snapshot.data?.subjects.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(left: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SubjectsCard(size: size,subject: snapshot.data!.subjects[index],index: index,);
                            },
                          ),
                        ),
                        ListTile(
                          leading: Text('Lessons',
                              style: Theme.of(context).textTheme.headline6),
                          trailing: const Text('See all'),
                        ),
                        SizedBox(
                          height: size.height * .17,
                          child: ListView.builder(
                            itemCount: snapshot.data?.lessons.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(left: 16),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return LessonsCard(size: size,lesson: snapshot.data!.lessons[index],);
                            },
                          ),
                        ),
                        kheight,
                        ListTile(
                          leading: Text('Latest News',
                              style: Theme.of(context).textTheme.headline6),
                          trailing: const Text('See all'),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.latestNews.length,
                          itemBuilder: (context, index) {
                            return NewsCard(size: size,latestNew: snapshot.data!.latestNews[index],);
                          },
                        ),
                      ],
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
                })
                : const Center(child: Text('No internet !\ncheck your network',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          )
        ),
      ),
    );
  }
}

class SubjectsCard extends StatelessWidget {
  const SubjectsCard({
    Key? key,
    required this.size, required this.subject, required this.index,
  }) : super(key: key);

  final Size size;
  final Subject subject;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestView(subject: subject,),)),
      child: Container(
        width: size.width * .45,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color:colors[index],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ksmallHeight,
              Row(
                children: [
                  Text(subject.subject.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: kwhight, fontSize: 20)),
                  const Spacer(),
                   Text(
                    "${subject.userTestsCount}/${subject.testsCount}",
                    style: const TextStyle(color: kwhight),
                  )
                ],
              ),
              const Spacer(),
               Text(
                '${Get.find<DashBordController>().getPercentage(int.parse(subject.userTestsCount), subject.testsCount)}%',
                style: const TextStyle(color: kwhight),
              ),
              const SizedBox(
                height: 6,
              ),
               LinearProgressIndicator(
                backgroundColor: kwhight,
                value: int.parse(subject.userTestsCount) / subject.testsCount,
                minHeight: 6,
                valueColor:  const AlwaysStoppedAnimation(Colors.amber),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LessonsCard extends StatelessWidget {
  const LessonsCard({
    Key? key,
    required this.size, required this.lesson,
  }) : super(key: key);

  final Size size;
  final Lesson lesson;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .4,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(6),
                ),
                child:  const Icon(Icons.ad_units),
              ),
              const Spacer(),
               Text(lesson.title)
            ],
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.size, required this.latestNew,
  }) : super(key: key);

  final Size size;
  final LatestNews latestNew;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashBordController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: size.height * .17,
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                         ApiUrls.imageBaseUrl+ latestNew.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      latestNew.title,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      maxLines: 2,
                    ),
                    Text(
                      latestNew.description,
                      style: const TextStyle(fontSize: 10),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children:  [
                        Text( controller.getdate(latestNew.updatedAt) , style: const TextStyle(fontSize: 13)),
                        const Spacer(),
                        Text(
                          controller.getTime(latestNew.updatedAt),
                          style: const TextStyle(fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
