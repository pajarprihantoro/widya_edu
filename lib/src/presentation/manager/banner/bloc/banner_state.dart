part of 'banner_bloc.dart';

@immutable
abstract class BannerState {}

final class BannerInitial extends BannerState {}

final class BannerLoading extends BannerState {}

final class BannerSuccess extends BannerState {
  final List<BannerEntity> bannerList;

  BannerSuccess({required this.bannerList});
}

final class BannerError extends BannerState {
  final String? message;

  BannerError({this.message = 'eror coba lagi', required String errorMessage});
}
