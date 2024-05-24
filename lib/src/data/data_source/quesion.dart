import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../models/model_quesion.dart';

class GetQuestionHttp {
  static Future<List<Question>?> connectApi(
      String exercisesIdFk, String email) async {
    Uri url = Uri.parse('https://edspert.widyaedu.com/exercise/kerjakan/');
    String body = 'exercise_id=$exercisesIdFk&user_email=$email';

    http.Response hasilRespon = await http.post(
      url,
      headers: {
        'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a3',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: body,
    );

    if (hasilRespon.statusCode == 200) {
      var jsonResponse = json.decode(hasilRespon.body);
      if (jsonResponse != null) {
        if (jsonResponse is List) {
          // If jsonResponse is a List, directly map it to Question objects
          return jsonResponse.map((data) => Question.fromJson(data)).toList();
        } else if (jsonResponse['data'] != null &&
            jsonResponse['data'] is List) {
          // If jsonResponse is a Map and contains 'data' key with a List value, extract and map it
          List<dynamic> dataList = jsonResponse['data'];
          List<Question> questions =
              dataList.map((data) => Question.fromJson(data)).toList();
          return questions;
        } else {
          print('Tidak ada data');
          return null;
        }
      } else {
        print('Tidak ada data');
        return null;
      }
    } else {
      print('Gagal mengambil data, status code: ${hasilRespon.statusCode}');
      return null;
    }
  }
}
