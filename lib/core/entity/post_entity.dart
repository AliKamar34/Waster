import 'package:waster/core/entity/owner_entity.dart';

class PostEntity {
  final String id;
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String? type;
  final String category;
  final String pickupLocation;
  final DateTime expiresOn;
  final DateTime created;
  final String imageUrl;
  final bool hasImage;
  final bool isBookmarked;
  final int? hoursUntilExpiry;
  final OwnerEntity? owner;

  const PostEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.type,
    required this.category,
    required this.pickupLocation,
    required this.expiresOn,
    required this.created,
    required this.imageUrl,
    required this.hasImage,
    required this.isBookmarked,
    required this.hoursUntilExpiry,
    required this.owner,
  });
}
