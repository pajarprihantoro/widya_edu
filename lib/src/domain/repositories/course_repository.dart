import 'dart:math';

import 'package:dio/dio.dart';

import '../../data/models/course_model.dart';


abstract class CourseRepository {
  Future<CourseRespon> getCourseList();
}
