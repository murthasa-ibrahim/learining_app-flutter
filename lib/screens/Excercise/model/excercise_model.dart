
import 'dart:convert';

ExcercisesModel excercisesModelFromJson(String str) => ExcercisesModel.fromJson(json.decode(str));


class ExcercisesModel {
    ExcercisesModel({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final Data data;
    final String message;

    factory ExcercisesModel.fromJson(Map<String, dynamic> json) => ExcercisesModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

}

class Data {
    Data({
        required this.test,
        required this.exercises,
    });

    final Test test;
    final List<Exercise> exercises;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        test: Test.fromJson(json["test"]),
        exercises: List<Exercise>.from(json["exercises"].map((x) => Exercise.fromJson(x))),
    );
}

class Exercise {
    Exercise({
        required this.id,
        required this.institutionId,
        required this.type,
        required this.testId,
        required this.question,
        required this.image,
        required this.audio,
        required this.answerKey,
        required this.defaultAccess,
        required this.createdAt,
        required this.updatedAt,
        required this.status,
        required this.userExercisesCount,
        required this.subQuestions,
    });

    final int id;
    final String institutionId;
    final String type;
    final String testId;
    final String question;
    final dynamic image;
    final String? audio;
    final dynamic answerKey;
    final String defaultAccess;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String status;
    final String userExercisesCount;
    final List<SubQuestion> subQuestions;

    factory Exercise.fromJson(Map<String, dynamic> json) => Exercise(
        id: json["id"],
        institutionId: json["institution_id"],
        type: json["type"],
        testId: json["test_id"],
        question: json["question"],
        image: json["image"],
        audio: json["audio"]??'',
        answerKey: json["answer_key"],
        defaultAccess: json["default_access"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        userExercisesCount: json["user_exercises_count"],
        subQuestions: List<SubQuestion>.from(json["sub_questions"].map((x) => SubQuestion.fromJson(x))),
    );

}

class SubQuestion {
    SubQuestion({
        required this.id,
        required this.exerciseId,
        required this.question,
        required this.image,
        required this.audio,
        required this.typeId,
        required this.noOfOptions,
        required this.answer,
        required this.audioAnswer,
        required this.explanation,
        required this.type,
        required this.options,
    });

    final int id;
    final String exerciseId;
    final String question;
    final dynamic image;
    final dynamic audio;
    final String typeId;
    final String noOfOptions;
    final String answer;
    final dynamic audioAnswer;
    final dynamic explanation;
    final Type type;
    final List<dynamic> options;

    factory SubQuestion.fromJson(Map<String, dynamic> json) => SubQuestion(
        id: json["id"],
        exerciseId: json["exercise_id"],
        question: json["question"],
        image: json["image"],
        audio: json["audio"],
        typeId: json["type_id"],
        noOfOptions: json["no_of_options"],
        answer: json["answer"],
        audioAnswer: json["audio_answer"],
        explanation: json["explanation"],
        type: Type.fromJson(json["type"]),
        options: List<dynamic>.from(json["options"].map((x) => x)),
    );
}

class Type {
    Type({
        required this.id,
        required this.name,
    });

    final int id;
    final String? name;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json["id"],
        name: json["name"],
    );

}



class Test {
    Test({
        required this.id,
        required this.name,
        required this.duration,
    });

    final int id;
    final String name;
    final String duration;

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
    );


}



