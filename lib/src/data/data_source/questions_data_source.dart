import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/questions_model.dart';

class QuestionsDataSource {
  QuestionsDataSource(String exerciseIdFk, String email);

  @override
   Future<List<QuestionsRespon>?> getQuestionsList(
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
      if (jsonResponse != null && jsonResponse['data'] != null) {
        List<dynamic> dataList = jsonResponse['data'];
        List<QuestionsRespon> questions =
            dataList.map((data) => QuestionsRespon.fromJson(data)).toList();
        return questions;
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
