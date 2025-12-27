class ClaimUserEntity {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String? profilePicture;

  ClaimUserEntity({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.profilePicture,
  });
}
