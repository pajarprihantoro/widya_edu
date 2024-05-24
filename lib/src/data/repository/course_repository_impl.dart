import 'dart:math';

import 'package:dio/dio.dart';

import '../../domain/repositories/course_repository.dart';

import '../data_source/course_data_source.dart';
import '../models/course_model.dart';

class CourseRepositoryImpl implements CourseRepository {
  final CourseDataSource courceDataSource;
CourseRepositoryImpl(this.courceDataSource, courseRepository);
  @override
  Future<CourseRespon> getCourseList() async {
    return courceDataSource.getCourseList();
  }
}
