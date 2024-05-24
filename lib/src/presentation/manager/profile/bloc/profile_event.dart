part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UploadImageEvent extends ProfileEvent {
  final XFile? file;

  UploadImageEvent(this.file);
}

