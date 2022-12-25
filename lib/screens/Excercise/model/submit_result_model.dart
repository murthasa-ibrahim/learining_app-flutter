
import 'dart:convert';


String submitResultModelToJson(SubmitResultModel data) => json.encode(data.toJson());

class SubmitResultModel {
    SubmitResultModel({
        required this.category,
        required this.subjectId,
        required this.testId,
        required this.exerciseId,
        required this.questions,
    });

    final String category;
    final int subjectId;
    final int testId;
    final int exerciseId;
    final List<Question> questions;


    Map<String, dynamic> toJson() => {
        "category": category,
        "subject_id": subjectId,
        "test_id": testId,
        "exercise_id": exerciseId,
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
    };
}

class Question {
    Question({
        required this.questionId,
        required this.answer,
        required this.audioAnswerFile,
        required this.rightAnswer,
        required this.audioRightAnswer,
        required this.points,
        required this.scoredPoints,
        required this.status,
    });

    final int questionId;
    final String answer;
    final dynamic audioAnswerFile;
    final String rightAnswer;
    final String audioRightAnswer;
    final dynamic points;
    final dynamic scoredPoints;
    final String status;

    Map<String, dynamic> toJson() => {
        "question_id": questionId,
        "answer": answer,
        "audio_answer_file": audioAnswerFile,
        "right_answer": rightAnswer,
        "audio_right_answer": audioRightAnswer,
        "points": points,
        "scored_points": scoredPoints,
        "status": status,
    };
}
