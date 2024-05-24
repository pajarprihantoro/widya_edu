class Exercises {
  final String? exerciseId;
  final String? exerciseTitle;
  final String? accessType;
  final String? icon;
  final String? exerciseUserStatus;
  final String? jumlahSoal;
  final int? jumlahDone;

  Exercises({
    this.exerciseId,
    this.exerciseTitle,
    this.accessType,
    this.icon,
    this.exerciseUserStatus,
    this.jumlahSoal,
    this.jumlahDone,
  });

  factory Exercises.fromJson(Map<String, dynamic> json) {
    return Exercises(
      exerciseId: json['exercise_id'] as String?,
      exerciseTitle: json['exercise_title'] as String?,
      accessType: removeHtmlTags(json['access_type'] as String?),
      icon: removeHtmlTags(json['icon'] as String?),
      exerciseUserStatus:
          removeHtmlTags(json['exercise_user_status'] as String?),
      jumlahSoal: removeHtmlTags(json["jumlah_soal"] as String?),
      jumlahDone: json["jumlah_done"] as int?,
    );
  }

  static String removeHtmlTags(String? htmlText) {
    if (htmlText == null) {
      return '';
    }
    return htmlText.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '').trim();
  }
}
