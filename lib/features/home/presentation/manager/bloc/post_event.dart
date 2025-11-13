part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

final class CreatePostEvent extends PostEvent {
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final String expiresOn;
  final String category;
  final String imageType;
  final String imageData;

  const CreatePostEvent({
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

  @override
  List<Object> get props => [
    title,
    description,
    quantity,
    unit,
    pickupLocation,
    expiresOn,
    category,
    imageType,
    imageData,
  ];
}
