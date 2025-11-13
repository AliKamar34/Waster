class PostEntity {
  final String id;
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final String expiresOn;
  final String category;
  final String imageUrl;

  const PostEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.pickupLocation,
    required this.expiresOn,
    required this.category,
    required this.imageUrl,
  });
}
