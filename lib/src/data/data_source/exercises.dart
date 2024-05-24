import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/model_exercises.dart'; // Assuming you've renamed models_exercises.dart to exercise_model.dart

class GetExercises {
  static Future<List<Exercises>?> connectApi(
      String courseId, String email) async {
    try {
      String email = 'testerngbayu@gmail.com';
      String body = 'sub_course_content_id=$courseId&user_email=$email';
      Uri url = Uri.parse(
          'https://edspert.widyaedu.com/exercise/data_exercise' + body);

      http.Response response = await http.get(
        url,
        headers: {
          'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a3',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse != null && jsonResponse['data'] != null) {
          List<dynamic> dataList = jsonResponse['data'];
          List<Exercises> exercises =
              dataList.map((data) => Exercises.fromJson(data)).toList();
          log("Fetched exercises: $exercises", name: 'ExerciseApi');
          return exercises;
        } else {
          log('No data found', name: 'ExerciseApi');
          return null;
        }
      } else {
        log('Failed to fetch data, status code: ${response.statusCode}',
            name: 'ExerciseApi');
        return null;
      }
    } catch (e) {
      log('Error fetching data: $e', name: 'ExerciseApi');
      return null;
    }
  }
}
