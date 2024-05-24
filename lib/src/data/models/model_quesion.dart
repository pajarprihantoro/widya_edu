class Question {
  final String exerciseId;
  final String bankQuestionId;
  final String questionTitle;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;
  final String optionE;
  final String studentAnswer;

  Question({
    required this.exerciseId,
    required this.bankQuestionId,
    required this.questionTitle,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.optionE,
    required this.studentAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      exerciseId: json['exercise_id_fk'],
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
}
