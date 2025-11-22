import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/models/owner_model.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    required super.title,
    required super.description,
    required super.quantity,
    required super.unit,
    required super.type,
    required super.category,
    required super.pickupLocation,
    required super.expiresOn,
    required super.created,
    required super.imageUrl,
    required super.hasImage,
    required super.isBookmarked,
    required super.hoursUntilExpiry,
    required super.owner,
    required super.status,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      quantity: json['quantity'] ?? 'N/A',
      unit: json['unit'] ?? 'N/A',
      pickupLocation: json['pickupLocation'] ?? 'N/A',
      type: json['type'],
      category: json['category'] ?? '',
      expiresOn: json['expiresOn'] != null
          ? DateTime.parse(json['expiresOn'])
          : DateTime.now(),
      created: json['created'] != null
          ? DateTime.parse(json['created'])
          : DateTime.now(),
      imageUrl: json['imageUrl'] ?? json['imageUrlRelative'] ?? '',
      hasImage: json['hasImage'] ?? false,
      isBookmarked: json['isBookmarked'] ?? false,
      hoursUntilExpiry: json['hoursUntilExpiry'],
      owner: json['owner'] != null
          ? OwnerModel.fromJson(json['owner'])
          : const OwnerModel(id: '', userName: 'Unknown', email: ''),
    );
  }

  factory PostModel.fromDetailsJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      quantity: json['quantity'],
      unit: json['unit'],
      type: json['type'],
      category: json['category'],
      pickupLocation: json['pickupLocation'],
      expiresOn: DateTime.parse(json['expiresOn']),
      created: DateTime.parse(json['created']),
      imageUrl: json['imageUrl'],
      hasImage: json['hasImage'],
      isBookmarked: json['isBookmarked'] ?? false,
      hoursUntilExpiry: json['hoursUntilExpiry'],
      owner: OwnerModel.fromJson(json['owner']),
    );
  }
}
