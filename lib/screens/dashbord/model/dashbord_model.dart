
import 'dart:convert';

DashbordModel dashbordModelFromJson(String str) => DashbordModel.fromJson(json.decode(str));


class DashbordModel {
    DashbordModel({
        required this.user,
        required this.subjects,
        required this.lessons,
        required this.latestNews,
    });

    final User user;
    final List<Subject> subjects;
    final List<Lesson> lessons;
    final List<LatestNews> latestNews;

    factory DashbordModel.fromJson(Map<String, dynamic> json) => DashbordModel(
        user: User.fromJson(json["user"]),
        subjects: List<Subject>.from(json["subjects"].map((x) => Subject.fromJson(x))),
        lessons: List<Lesson>.from(json["lessons"].map((x) => Lesson.fromJson(x))),
        latestNews: List<LatestNews>.from(json["latest_news"].map((x) => LatestNews.fromJson(x))),
    );


}

class LatestNews {
    LatestNews({
        required this.id,
        required this.institutionId,
        required this.image,
        required this.title,
        required this.description,
        required this.createdAt,
        required this.updatedAt,
        required this.status,
    });

    final int id;
    final String institutionId;
    final String image;
    final String title;
    final String description;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String status;

    factory LatestNews.fromJson(Map<String, dynamic> json) => LatestNews(
        id: json["id"],
        institutionId: json["institution_id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "institution_id": institutionId,
        "image": image,
        "title": title,
        "description": description,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "status": status,
    };
}

class Lesson {
    Lesson({
        required this.id,
        required this.icon,
        required this.title,
    });

    final int id;
    final String icon;
    final String title;

    factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
        id: json["id"],
        icon: json["icon"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "icon": icon,
        "title": title,
    };
}

class Subject {
    Subject({
        required this.id,
        required this.subjectId,
        required this.userTestsCount,
        required this.testsCount,
        required this.subject,
    });

    final int id;
    final String subjectId;
    final String userTestsCount;
    final int testsCount;
    final User subject;

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["id"],
        subjectId: json["subject_id"],
        userTestsCount: json["user_tests_count"]??'0',
        testsCount: json["tests_count"],
        subject: User.fromJson(json["subject"]),
    );


}

class User {
    User({
        required this.id,
        required this.name,
    });

    final int id;
    final String name;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"] ?? "",
    );

 
}
