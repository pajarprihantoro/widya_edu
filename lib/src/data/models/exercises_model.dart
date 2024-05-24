class ExercisesRespon {
  final int? status;
  final String? message;
  final List<Exercises>? data;

  ExercisesRespon({
    this.status,
    this.message,
    this.data,
  });

  factory ExercisesRespon.fromJson(Map<String, dynamic> json) =>
      ExercisesRespon(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Exercises>.from(
                json["data"]!.map((x) => Exercises.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

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

  factory Exercises.fromJson(Map<String, dynamic> json) => Exercises(
        exerciseId: json["exercise_id"],
        exerciseTitle: json["exercise_title"],
        accessType: json["access_type"],
        icon: json["icon"],
        exerciseUserStatus: json["exercise_user_status"],
        jumlahSoal: json["jumlah_soal"],
        jumlahDone: json["jumlah_done"],
      );

  Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_title": exerciseTitle,
        "access_type": accessType,
        "icon": icon,
        "exercise_user_status": exerciseUserStatus,
        "jumlah_soal": jumlahSoal,
        "jumlah_done": jumlahDone,
      };
}
