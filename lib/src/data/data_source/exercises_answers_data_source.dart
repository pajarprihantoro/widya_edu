import 'package:dio/dio.dart';

import '../models/exercises_answers_model.dart';
import '../models/exercises_model.dart';

class ExercisesAnswersDataSource {
  ExercisesAnswersDataSource(String exercisesIdFk);

  // post sumbit exersises answers
  @override
  Future<ExercisesAnswersRespon> submitExercisesAnswers(
      String exercisesIdFk) async {
    try {
      final headers = {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a3'};
      final response = await Dio().post(
        'https://edspert.widyaedu.com/exercise/data_exercise',
        queryParameters: {
          'sub_course_content_id': '132',
          'user_email': 'testerngbayu@gmail.com'
        },
        options: Options(headers: headers),
      );

      final data = ExercisesAnswersRespon.fromJson(response.data);
      print(response.data);
      return data;
    } catch (e, stackTrace) {
      // Cetak pesan kesalahan dan jejak balik ke konsol
      print('Error dalam pengambilan data: $e');
      print(stackTrace);

      // Mengembalikan objek CourseRespon kosong
      return ExercisesAnswersRespon();
    }
  }
}
