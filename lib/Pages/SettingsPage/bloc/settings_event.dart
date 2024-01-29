part of 'settings_bloc.dart';

sealed class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class EditProfileInfo extends SettingsEvent {
  final String name;
  final String email;
  final String phone;
  final File profileImage;
  final String bio;

  const EditProfileInfo(
      {required this.bio,
      required this.email,
      required this.name,
      required this.phone,
      required this.profileImage});

  @override
  List<Object> get props => [bio, name, phone, email, profileImage];
}
