class ExercisesResultRespon {
  final int? status;
  final String? message;
  final ExercisesResultData? data;

  ExercisesResultRespon({
    this.status,
    this.message,
    this.data,
  });

  factory ExercisesResultRespon.fromJson(Map<String, dynamic> json) =>
      ExercisesResultRespon(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : ExercisesResultData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class ExercisesResultData {
  final ExerciseResult? exercise;
  final Result? result;

  ExercisesResultData({
    this.exercise,
    this.result,
  });

  factory ExercisesResultData.fromJson(Map<String, dynamic> json) =>
      ExercisesResultData(
        exercise: json["exercise"] == null
            ? null
            : ExerciseResult.fromJson(json["exercise"]),
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "exercise": exercise?.toJson(),
        "result": result?.toJson(),
      };
}

class ExerciseResult {
  final String? exerciseId;
  final String? exerciseCode;
  final String? fileCourse;
  final String? icon;
  final String? exerciseTitle;
  final String? exerciseDescription;
  final String? exerciseInstruction;
  final String? countQuestion;
  final String? classFk;
  final String? courseFk;
  final String? courseContentFk;
  final String? subCourseContentFk;
  final String? creatorId;
  final String? creatorName;
  final String? examFrom;
  final String? accessType;
  final String? exerciseOrder;
  final String? exerciseStatus;
  final DateTime? dateCreate;
  final DateTime? dateUpdate;

  ExerciseResult({
    this.exerciseId,
    this.exerciseCode,
    this.fileCourse,
    this.icon,
    this.exerciseTitle,
    this.exerciseDescription,
    this.exerciseInstruction,
    this.countQuestion,
    this.classFk,
    this.courseFk,
    this.courseContentFk,
    this.subCourseContentFk,
    this.creatorId,
    this.creatorName,
    this.examFrom,
    this.accessType,
    this.exerciseOrder,
    this.exerciseStatus,
    this.dateCreate,
    this.dateUpdate,
  });

  factory ExerciseResult.fromJson(Map<String, dynamic> json) => ExerciseResult(
        exerciseId: json["exercise_id"],
        exerciseCode: json["exercise_code"],
        fileCourse: json["file_course"],
        icon: json["icon"],
        exerciseTitle: json["exercise_title"],
        exerciseDescription: json["exercise_description"],
        exerciseInstruction: json["exercise_instruction"],
        countQuestion: json["count_question"],
        classFk: json["class_fk"],
        courseFk: json["course_fk"],
        courseContentFk: json["course_content_fk"],
        subCourseContentFk: json["sub_course_content_fk"],
        creatorId: json["creator_id"],
        creatorName: json["creator_name"],
        examFrom: json["exam_from"],
        accessType: json["access_type"],
        exerciseOrder: json["exercise_order"],
        exerciseStatus: json["exercise_status"],
        dateCreate: json["date_create"] == null
            ? null
            : DateTime.parse(json["date_create"]),
        dateUpdate: json["date_update"] == null
            ? null
            : DateTime.parse(json["date_update"]),
      );

  Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "exercise_code": exerciseCode,
        "file_course": fileCourse,
        "icon": icon,
        "exercise_title": exerciseTitle,
        "exercise_description": exerciseDescription,
        "exercise_instruction": exerciseInstruction,
        "count_question": countQuestion,
        "class_fk": classFk,
        "course_fk": courseFk,
        "course_content_fk": courseContentFk,
        "sub_course_content_fk": subCourseContentFk,
        "creator_id": creatorId,
        "creator_name": creatorName,
        "exam_from": examFrom,
        "access_type": accessType,
        "exercise_order": exerciseOrder,
        "exercise_status": exerciseStatus,
        "date_create": dateCreate?.toIso8601String(),
        "date_update": dateUpdate?.toIso8601String(),
      };
}

class Result {
  final String? jumlahBenar;
  final String? jumlahSalah;
  final String? jumlahTidak;
  final String? jumlahScore;

  Result({
    this.jumlahBenar,
    this.jumlahSalah,
    this.jumlahTidak,
    this.jumlahScore,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        jumlahBenar: json["jumlah_benar"],
        jumlahSalah: json["jumlah_salah"],
        jumlahTidak: json["jumlah_tidak"],
        jumlahScore: json["jumlah_score"],
      );

  Map<String, dynamic> toJson() => {
        "jumlah_benar": jumlahBenar,
        "jumlah_salah": jumlahSalah,
        "jumlah_tidak": jumlahTidak,
        "jumlah_score": jumlahScore,
      };
}
