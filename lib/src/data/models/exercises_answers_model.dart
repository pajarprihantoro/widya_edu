class ExercisesAnswersRespon {
    final int? status;
    final String? message;

    ExercisesAnswersRespon({
        this.status,
        this.message,
    });

    factory ExercisesAnswersRespon.fromJson(Map<String, dynamic> json) => ExercisesAnswersRespon(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}