part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState {}

class CourseSuccess extends CourseState {
  final List<CourseData> courseList;

  CourseSuccess({required this.courseList});
}

class CourseEror extends CourseState {
  final String? message;

  CourseEror({this.message = 'coba lagi'});
}
