class CourseEntity {
  final String courseId;
  final String majorName;
  final String courseCategory;
  final String courseName;
  final String urlCover;
  final int jumlahMateri;
  final int jumlahDone;
  final int progress;

  CourseEntity(
      {required this.courseId,
      required this.majorName,
      required this.courseCategory,
      required this.courseName,
      required this.urlCover,
      required this.jumlahMateri,
      required this.jumlahDone,
      required this.progress});

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is CourseEntity &&
  //       other.courseId == courseId &&
  //       other.majorName == majorName &&
  //       other.courseCategory == courseCategory &&
  //       other.courseName == courseName &&
  //       other.urlCover == urlCover &&
  //       other.jumlahMateri == jumlahMateri &&
  //       other.jumlahDone == jumlahDone &&
  //       other.progress == progress;
  // }

  // @override
  // int get hashCode =>
  //     courseId.hashCode ^
  //     majorName.hashCode ^
  //     courseCategory.hashCode ^
  //     courseName.hashCode ^
  //     urlCover.hashCode ^
  //     jumlahMateri.hashCode ^
  //     jumlahDone.hashCode ^
  //     progress.hashCode;
}
