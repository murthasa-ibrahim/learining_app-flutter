
import 'dart:convert';

TestsModel testsModelFromJson(String str) => TestsModel.fromJson(json.decode(str));

class TestsModel {
    TestsModel({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final Data data;
    final String message;

    factory TestsModel.fromJson(Map<String, dynamic> json) => TestsModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "message": message,
    };
}

class Data {
    Data({
        required this.tests,
    });

    final List<Test> tests;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tests: List<Test>.from(json["tests"].map((x) => Test.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tests": List<dynamic>.from(tests.map((x) => x.toJson())),
    };
}

class Test {
    Test({
        required this.id,
        required this.name,
        required this.duration,
        required this.exercisesCount,
        required this.userTest,
    });

    final int id;
    final String name;
    final String duration;
    final String exercisesCount;
    final dynamic userTest;

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        exercisesCount: json["exercises_count"],
        userTest: json["user_test"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "exercises_count": exercisesCount,
        "user_test": userTest,
    };
}
