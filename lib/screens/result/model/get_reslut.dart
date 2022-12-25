
import 'dart:convert';

GetResultModel getResultModelFromJson(String str) => GetResultModel.fromJson(json.decode(str));


class GetResultModel {
    GetResultModel({
        required this.success,
        required this.data,
        required this.message,
    });

    final bool success;
    final Data data;
    final String message;

    factory GetResultModel.fromJson(Map<String, dynamic> json) => GetResultModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
    );

}

class Data {
    Data({
        required this.result,
    });

    final Result result;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: Result.fromJson(json["result"]),
    );
}

class Result {
    Result({
        required this.id,
        required this.institutionId,
        required this.userId,
        required this.subjectId,
        required this.testId,
        required this.points,
        required this.scoredPoints,
        required this.band,
        required this.comment,
        required this.createdAt,
        required this.updatedAt,
        required this.status,
        required this.exercises,
    });

    final int id;
    final String institutionId;
    final String userId;
    final String subjectId;
    final String testId;
    final String points;
    final String scoredPoints;
    final dynamic band;
    final dynamic comment;
    final DateTime createdAt;
    final DateTime updatedAt;
    final String status;
    final List<ExerciseElement> exercises;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        institutionId: json["institution_id"],
        userId: json["user_id"],
        subjectId: json["subject_id"],
        testId: json["test_id"],
        points: json["points"],
        scoredPoints: json["scored_points"],
        band: json["band"],
        comment: json["comment"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        exercises: List<ExerciseElement>.from(json["exercises"].map((x) => ExerciseElement.fromJson(x))),
    );

}

class ExerciseElement {
    ExerciseElement({
        required this.id,
        required this.userTestId,
        required this.exerciseId,
        required this.points,
        required this.scoredPoints,
        required this.status,
        required this.exercise,
        required this.subQuestions,
    });

    final int id;
    final String userTestId;
    final String exerciseId;
    final String points;
    final String scoredPoints;
    final String status;
    final ExerciseExercise exercise;
    final List<dynamic> subQuestions;

    factory ExerciseElement.fromJson(Map<String, dynamic> json) => ExerciseElement(
        id: json["id"],
        userTestId: json["user_test_id"],
        exerciseId: json["exercise_id"],
        points: json["points"],
        scoredPoints: json["scored_points"],
        status: json["status"],
        exercise: ExerciseExercise.fromJson(json["exercise"]),
        subQuestions: List<dynamic>.from(json["sub_questions"].map((x) => x)),
    );

}

class ExerciseExercise {
    ExerciseExercise({
        required this.question,
    });

    final String question;

    factory ExerciseExercise.fromJson(Map<String, dynamic> json) => ExerciseExercise(
        question: json["question"],
    );
}
