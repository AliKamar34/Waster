class CreatePostModel {
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final DateTime expiresOn;
  final String category;
  final String? imageType;
  final String? imageData;

  CreatePostModel({
    required this.title,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.pickupLocation,
    required this.expiresOn,
    required this.category,
    required this.imageType,
    required this.imageData,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'quantity': quantity,
      'unit': unit,
      'pickupLocation': pickupLocation,
      'expiresOn': expiresOn.toIso8601String(),
      'category': category,
      'imageType': imageType,
      'imageData': imageData,
    };
  }
}
