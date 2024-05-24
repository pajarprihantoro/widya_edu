class QuestionsRespon {
  String? exerciseIdFk;
  String? email;
  final int? status;
  final String? message;
  final List<Question>? data;

  QuestionsRespon({
    this.exerciseIdFk,
    this.email,
    this.status,
    this.message,
    this.data,
  });

  factory QuestionsRespon.fromJson(Map<String, dynamic> json) =>
      QuestionsRespon(
        exerciseIdFk: 'exerciseIdFk',
        email: 'email',
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Question>.from(
                json["data"]!.map((x) => Question.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Question {
  final String? exerciseIdFk;
  final String? bankQuestionId;
  final String? questionTitle;
  final dynamic questionTitleImg;
  final String? optionA;
  final dynamic optionAImg;
  final String? optionB;
  final dynamic optionBImg;
  final String? optionC;
  final dynamic optionCImg;
  final String? optionD;
  final dynamic optionDImg;
  final String? optionE;
  final dynamic optionEImg;
  final StudentAnswer? studentAnswer;

  Question({
    this.exerciseIdFk,
    this.bankQuestionId,
    this.questionTitle,
    this.questionTitleImg,
    this.optionA,
    this.optionAImg,
    this.optionB,
    this.optionBImg,
    this.optionC,
    this.optionCImg,
    this.optionD,
    this.optionDImg,
    this.optionE,
    this.optionEImg,
    this.studentAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      exerciseIdFk: json['exercise_id_fk'],
      bankQuestionId: json['bank_question_id'],
      questionTitle: removeHtmlTags(json['question_title']),
      optionA: removeHtmlTags(json['option_a']),
      optionB: removeHtmlTags(json['option_b']),
      optionC: removeHtmlTags(json['option_c']),
      optionD: removeHtmlTags(json['option_d']),
      optionE: removeHtmlTags(json['option_e']),
      studentAnswer: json['student_answer'],
    );
  }

  static String removeHtmlTags(String? htmlText) {
    if (htmlText == null) {
      return '';
    }
    return htmlText.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '').trim();
  }

  Map<String, dynamic> toJson() => {
        "exercise_id_fk": exerciseIdFk,
        "bank_question_id": bankQuestionId,
        "question_title": questionTitle,
        "question_title_img": questionTitleImg,
        "option_a": optionA,
        "option_a_img": optionAImg,
        "option_b": optionB,
        "option_b_img": optionBImg,
        "option_c": optionC,
        "option_c_img": optionCImg,
        "option_d": optionD,
        "option_d_img": optionDImg,
        "option_e": optionE,
        "option_e_img": optionEImg,
        "student_answer": studentAnswerValues.reverse[studentAnswer],
      };
}

enum StudentAnswer { D }

final studentAnswerValues = EnumValues({"D": StudentAnswer.D});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
