class UserEntity {
  final String fullName;
  final String email;
  final String address;
  final String phoneNumber;
  final String? bio;

  const UserEntity({
    required this.fullName,
    required this.email,
    required this.address,
    required this.phoneNumber,
    required this.bio,
  });
}
