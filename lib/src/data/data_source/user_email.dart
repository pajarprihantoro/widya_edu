import 'dart:convert';
import 'dart:developer';
import 'package:app_widya_edu/src/core/utils/app_string.dart';
import 'package:http/http.dart' as http;
import '../models/user_by_email_model.dart';
import '../models/user_data.dart'; // Assuming you've renamed models_exercises.dart to exercise_model.dart

class GetUserEmail {
  static Future<UserDataEmail?> connectApi(String email) async {
    try {
      Uri url = Uri.parse(
          'https://edspert.widyaedu.com/users?email=' + AppString.constEmail);

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
          var data = jsonResponse['data'];
          UserDataEmail user = UserDataEmail.fromJson(data);
          log("Fetched user: $user", name: 'User');
          return user;
        } else {
          log('No data found', name: 'userApi');
          return null;
        }
      } else {
        log('Failed to fetch data, status code: ${response.statusCode}',
            name: 'UserApi');
        return null;
      }
    } catch (e) {
      log('Error fetching data: $e', name: 'userApi');
      return null;
    }
  }

  // static Future<bool> updateUser(UserDataEmail user) async {
  //   try {
  //     Uri url = Uri.parse('https://edspert.widyaedu.com/users/${user.id}');

  //     Map<String, dynamic> data = {
  //       'user_name': user.user_name,
  //       'user_email': user.email,
  //       'user_whatsapp': user.userWhatsapp,
  //       'user_foto': user.foto,
  //       'user_propinsi': user.userPropinsi,
  //       'user_kabupaten': user.userKabupaten,
  //       'sosmed': user.sosmed,
  //       'user_prop_sekolah': user.userPropSekolah,
  //       'user_kab_sekolah': user.userKabSekolah,
  //       'user_asal_sekolah': user.asal_sekolah,
  //       'kelas': user.kelas,
  //       'jenjang': user.jenjang,
  //       'user_gender': user.gender,
  //       'user_propinsi_id': user.userPropinsiId,
  //       'user_prop_sekolah_id': user.userPropSekolahId,
  //       'user_kab_sekolah_id': user.userKabSekolahId,
  //       'class_fk': user.classFk,
  //     };
  //     http.Response response = await http.put(
  //       url,
  //       headers: {
  //         'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a3',
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(data),
  //     );

  //     if (response.statusCode == 200) {
  //       log("User updated successfully", name: 'UserUpdate');
  //       return true;
  //     } else {
  //       log('Failed to update user, status code: ${response.statusCode}',
  //           name: 'UserUpdate');
  //       return false;
  //     }
  //   } catch (e) {
  //     log('Error updating user: $e', name: 'UserUpdate');
  //     return false;
  //   }
  // }
}

class UpdateUser {
  static Future<UserDataEmail>? updateUser(UserDataEmail user) async {
    Uri url = Uri.parse('https://edspert.widyaedu.com/users/update/');

    Map<String, dynamic> dataUser = {
      'user_name': user.user_name,
      'user_email': user.email,
      'user_whatsapp': user.userWhatsapp,
      'user_foto': user.foto,
      'user_propinsi': user.userPropinsi,
      'user_kabupaten': user.userKabupaten,
      'sosmed': user.sosmed,
      'user_prop_sekolah': user.userPropSekolah,
      'user_kab_sekolah': user.userKabSekolah,
      'user_asal_sekolah': user.asal_sekolah,
      'kelas': user.kelas,
      'jenjang': user.jenjang,
      'user_gender': user.gender,
      'user_propinsi_id': user.userPropinsiId,
      'user_prop_sekolah_id': user.userPropSekolahId,
      'user_kab_sekolah_id': user.userKabSekolahId,
      'class_fk': user.classFk,
      'tahun_lulus': user.tahun_lulus,
    };
    var hasilRespon = await http.post(url, body: dataUser);

    var data = json.decode(hasilRespon.body);

    return UserDataEmail(
        user_name: data["user_name"],
        email: data["user_email"],
        userWhatsapp: data["user_whatsapp"],
        foto: data["user_foto"],
        userPropinsiId: data["user_propinsi_id"],
        userPropinsi: data["user_propinsi"],
        userKabupaten: data["user_kabupaten"],
        sosmed: data["sosmed"],
        userPropSekolahId: data["user_prop_sekolah_id"],
        userPropSekolah: data["user_prop_sekolah"],
        userKabSekolahId: data["user_kab_sekolah_id"],
        userKabSekolah: data["user_kab_sekolah"],
        asal_sekolah: data["user_asal_sekolah"],
        kelas: data["kelas"],
        jenjang: data["jenjang"],
        gender: data["user_gender"],
        classFk: data["class_fk"],
        tahun_lulus: data["tahun_lulus"]);
  }
}
