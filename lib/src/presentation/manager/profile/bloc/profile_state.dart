part of 'profile_bloc.dart';

@immutable
sealed class ProfileState extends Equatable {
  const ProfileState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {}

final class UploadImageLoading extends ProfileState {}

final class UploadImageSuccess extends ProfileState {
  late final String dowloadUrl;

  UploadImageSuccess(this.dowloadUrl);
}

final class UploadImageError extends ProfileState {}


