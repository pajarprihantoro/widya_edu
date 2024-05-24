import 'package:app_widya_edu/src/data/repository/exercises_repository_impl.dart';
import 'package:dio/dio.dart';

import '../models/exercises_model.dart';

class ExercisesDataSource {
  final String courseId;
  ExercisesDataSource(this.courseId);

  static Future<ExercisesRespon> getExercisesList(courseId) async {
    try {
      final headers = {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a3'};
      final response = await Dio().get(
        'https://edspert.widyaedu.com/exercise/data_exercise',
        queryParameters: {
          'sub_course_content_id': courseId,
          'user_email': 'testerngbayu@gmail.com'
        },
        options: Options(headers: headers),
      );

      ExercisesRespon data = ExercisesRespon.fromJson(response.data);
      print(response.data);
      return data;
    } catch (e, stackTrace) {
      // Cetak pesan kesalahan dan jejak balik ke konsol
      print('Error dalam pengambilan data: $e');
      print(stackTrace);

      // Mengembalikan objek CourseRespon kosong
      return ExercisesRespon();
    }
  }
}
