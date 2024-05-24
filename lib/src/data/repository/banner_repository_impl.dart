import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:app_widya_edu/src/data/data_source/banner_data_source.dart';

import '../../core/utils/api_const.dart';
import '../../domain/repositories/banner_repository.dart';
import '../models/banner_model.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerDataSource bannerDataSource;
  BannerRepositoryImpl(this.bannerDataSource,
      [BannerRepositoryImpl? bannerepositoryImpl]);

  @override
  Future<List<BannerData>?> getBannerList() async {
    return bannerDataSource.getBannerList();
  }
}
