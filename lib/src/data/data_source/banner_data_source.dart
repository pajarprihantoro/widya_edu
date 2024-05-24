import 'package:app_widya_edu/src/data/repository/banner_repository_impl.dart';
import 'package:dio/dio.dart';

import '../../core/utils/api_const.dart';
import '../models/banner_model.dart';

class BannerDataSource {
  Future<List<BannerData>?> getBannerList() async {
    try {
      final headers = ApiConst.headers;
      final bannePath = ApiConst.bannerPath;
      final queryParameters = {'limit': 5};
      final response = await Dio().get(
        'https://edspert.widyaedu.com/event/list',
        queryParameters: queryParameters,
        options: Options(headers: ApiConst.headers),
      );

      final data = BannerRespon.fromJson(response.data);
      print("loding");
      return data.data;
    } catch (e, stackTrace) {
      // Cetak pesan kesalahan dan jejak balik ke konsol
      print('Error dalam pengambilan data: $e');
      print(stackTrace);

      // Mengembalikan objek CourseRespon kosong
      return null;
    }
  }
}
