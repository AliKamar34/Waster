part of 'post_bloc.dart';

sealed class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

final class CreatePostEvent extends PostEvent {
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final DateTime expiresOn;
  final String category;
  final File imageFile;

  const CreatePostEvent({
    required this.title,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.pickupLocation,
    required this.expiresOn,
    required this.category,
    required this.imageFile,
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
    imageFile,
  ];
}

final class EditPostEvent extends PostEvent {
  final String id;
  final String title;
  final String description;
  final String quantity;
  final String unit;
  final String pickupLocation;
  final DateTime expiresOn;
  final String category;
  final File? imageFile;

  const EditPostEvent({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.unit,
    required this.pickupLocation,
    required this.expiresOn,
    required this.category,
    this.imageFile,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    quantity,
    unit,
    pickupLocation,
    expiresOn,
    category,
    imageFile,
  ];
}

final class DeletePostEvent extends PostEvent {
  final String id;

  const DeletePostEvent({required this.id});

  @override
  List<Object> get props => [id];
}
