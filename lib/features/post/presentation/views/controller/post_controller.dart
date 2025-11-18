import 'dart:io';
import 'package:flutter/material.dart';
import 'package:waster/core/entity/post_entity.dart';

class DonateFormController {
  //  Controllers
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;
  late final TextEditingController quantityController;
  late final TextEditingController locationController;

  //  State Variables
  File? image;
  String? category;
  String? unit;
  DateTime? expiresOn;

  //  Original Values (Edit Mode)
  final String? _originalTitle;
  final String? _originalDescription;
  final String? _originalQuantity;
  final String? _originalLocation;
  final String? _originalCategory;
  final String? _originalUnit;
  final DateTime? _originalExpiresOn;
  final String? _originalImageUrl;

  final bool isEditMode;

  DonateFormController({PostEntity? post})
    : isEditMode = post != null,
      _originalTitle = post?.title,
      _originalDescription = post?.description,
      _originalQuantity = post?.quantity,
      _originalLocation = post?.pickupLocation,
      _originalCategory = post?.category,
      _originalUnit = post?.unit,
      _originalExpiresOn = post?.expiresOn,
      _originalImageUrl = post?.imageUrl {
    titleController = TextEditingController(text: post?.title ?? '');
    descriptionController = TextEditingController(
      text: post?.description ?? '',
    );
    quantityController = TextEditingController(text: post?.quantity ?? '');
    locationController = TextEditingController(
      text: post?.pickupLocation ?? '',
    );

    // Initialize selections for edit mode
    if (isEditMode) {
      category = post!.category;
      unit = post.unit;
      expiresOn = post.expiresOn;
    }
  }

  // Validation

  bool get isValid {
    return image != null &&
        category != null &&
        unit != null &&
        expiresOn != null &&
        titleController.text.trim().isNotEmpty &&
        quantityController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        locationController.text.trim().isNotEmpty;
  }

  Map<String, String?> get validationErrors {
    return {
      'image': image == null && !isEditMode ? 'Please add food photo' : null,
      'category': category == null ? 'Please select category' : null,
      'unit': unit == null ? 'Please select unit' : null,
      'expiresOn': expiresOn == null ? 'Please select expiry date' : null,
    };
  }

  String? get firstError {
    final errors = validationErrors.values.where((e) => e != null);
    return errors.isEmpty ? null : errors.first;
  }

  //  Update Methods

  void updateImage(File? newImage) {
    image = newImage;
  }

  void updateCategory(String? newCategory) {
    category = newCategory;
  }

  void updateUnit(String? newUnit) {
    unit = newUnit;
  }

  void updateExpiresOn(DateTime? newDate) {
    expiresOn = newDate;
  }

  //  Change Detection ( Edit Mode)

  bool get hasChanges {
    if (!isEditMode) return true;

    return titleController.text.trim() != _originalTitle ||
        descriptionController.text.trim() != _originalDescription ||
        quantityController.text.trim() != _originalQuantity ||
        locationController.text.trim() != _originalLocation ||
        category != _originalCategory ||
        unit != _originalUnit ||
        expiresOn != _originalExpiresOn ||
        image != null;
  }

  Map<String, dynamic> toMap() {
    return {
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'quantity': quantityController.text.trim(),
      'unit': unit!,
      'pickupLocation': locationController.text.trim(),
      'expiresOn': expiresOn!,
      'category': category!,
      'image': image!,
    };
  }

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    locationController.dispose();
    image = null;
  }
}
