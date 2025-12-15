class ClaimUserEntity {
  final String id;
  final String userName;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String address;
  final String? city;
  final String? profilePicture;

  ClaimUserEntity({
    required this.id,
    required this.userName,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.address,
    this.city,
    this.profilePicture,
  });
}
