class ClaimPostEntity {
  final String id;
  final String title;
  final String description;
  final String location;
  final String status;
  final DateTime expiryDate;

  ClaimPostEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    required this.status,
    required this.expiryDate,
  });
}
