import 'package:app_widya_edu/src/domain/repositories/course_repository.dart';

import '../../data/models/course_model.dart';



class GetCourseUsecase {
  final CourseRepository repository;

  GetCourseUsecase(this.repository);

  Future<CourseRespon?> call() {
    return repository.getCourseList();
  }
}
