import 'package:app_widya_edu/src/data/repository/course_repository_impl.dart';
import 'package:dio/dio.dart';

import '../models/course_model.dart';

class CourseDataSource {
  CourseDataSource(CourseDataSource? courseDataSource,
      CourseRepositoryImpl? courseRepositoryImpl);

  Future<CourseRespon> getCourseList() async {
    try {
      final headers = {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a3'};
      final response = await Dio().get(
        'https://edspert.widyaedu.com/exercise/data_course',
        queryParameters: {
          'major_name': 'IPA',
          'user_email': 'testerngbayu@gmail.com'
        },
        options: Options(headers: headers),
      );
      final data = CourseRespon.fromJson(response.data);
      return data;
    } catch (e, stackTrace) {
      // Cetak pesan kesalahan dan jejak balik ke konsol
      print('Error dalam pengambilan data: $e');
      print(stackTrace);

      // Mengembalikan objek CourseRespon kosong
      return CourseRespon();
    }
  }
}
