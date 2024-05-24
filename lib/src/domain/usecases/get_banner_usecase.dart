import 'package:app_widya_edu/src/data/models/banner_model.dart';
import 'package:app_widya_edu/src/data/repository/banner_repository_impl.dart';
import 'package:app_widya_edu/src/domain/repositories/banner_repository.dart';

class GetBannerUsecase {
  final BannerRepository repository;

  GetBannerUsecase(this.repository);

  Future<List<BannerData>?> call() {
    return repository.getBannerList();
  }
}
