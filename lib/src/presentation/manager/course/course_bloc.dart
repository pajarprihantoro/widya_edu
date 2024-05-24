import 'package:app_widya_edu/src/domain/entities/course_entity.dart';
import 'package:app_widya_edu/src/domain/usecases/get_course_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/course_model.dart';
import '../../../domain/repositories/course_repository.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;

  CourseBloc(GetCourseUsecase getCourseUsecase,
      {required this.courseRepository})
      : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseEvent) {
        emit(CourseLoading());
        print("proses pengambilan data");
        final result = await courseRepository.getCourseList();
        if (result == null) {
          emit(CourseEror(message: 'pengambilan data gagal'));
        }
        emit(CourseSuccess(
            // courseList: result
            //     .map(
            //       (e) => CourseEntity(
            //           courseId: e.courseId ?? '',
            //           majorName: e.majorName ?? '',
            //           courseCategory: e.courseCategory ?? '',
            //           courseName: e.courseName ?? '',
            //           urlCover: e.urlCover ?? '',
            //           jumlahMateri: e.jumlahMateri ?? '',
            //           jumlahDone: e.jumlahDone ?? '',
            //           progress: e.progress ?? ''),
            //     )
            //     .toList(),
            courseList: result.data ?? []));
      }
    });
  }
}
