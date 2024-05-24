import 'package:app_widya_edu/src/data/models/register_model.dart';
import 'package:dio/dio.dart';

import '../../core/utils/api_const.dart';

class AuthDataSource {
  // Future<RegisterRespon?> register(
  //     String userName,
  //     String userEmail,
  //     String userAsalSekolah,
  //     String jenjang,
  //     String gender,
  //     String kelas,) async {
  //   try {
  //     final headers = ApiConst.headers;
  //     final response = await Dio()
  //         .post('https://edspert.widyaedu.com/users/registrasi', data: {
  //       'user_name': userName,
  //       'user_email': userEmail,
  //       'user_asal_sekolah': userAsalSekolah,
  //       'jenjang': jenjang,
  //       'user_gender': gender,
  //       'kelas': kelas
  //     });

  //     final data = RegisterRespon.fromJson(response.data);
  //     print("loding");
  //     return data;
  //   } catch (e, stackTrace) {
  //     // Cetak pesan kesalahan dan jejak balik ke konsol
  //     print('Error dalam pengambilan data: $e');
  //     print(stackTrace);

  //     // Mengembalikan objek CourseRespon kosong
  //     return null;
  //   }
  // }
}
