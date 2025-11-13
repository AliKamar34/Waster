import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mime/mime.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/pick_up_image.dart';
import 'package:waster/core/utils/show_time_picker.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/location_text_field.dart';
import 'package:waster/features/home/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/home/domain/entity/post_entity.dart';
import 'package:waster/features/home/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/home/presentation/views/widgets/category_drop_down_button.dart';
import 'package:waster/features/home/presentation/views/widgets/count_and_unit_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_add_food_photo_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_donate_lable_sections.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_pick_up_time_widget.dart';

class DonateForm extends StatefulWidget {
  const DonateForm({super.key, required this.postMode, this.post});
  final PostMode postMode;
  final PostEntity? post;
  @override
  State<DonateForm> createState() => _DonateFormState();
}

class _DonateFormState extends State<DonateForm> {
  File? _image;
  String? category, units;
  String? expiresOn;
  String? base64Image, imageType;
  String? imagePath;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController itemNameController;
  late final TextEditingController quantityController;
  late final TextEditingController descriptionController;
  late final TextEditingController locationController;

  bool get isEditMode => widget.postMode == PostMode.edit;

  @override
  void initState() {
    itemNameController = TextEditingController(
      text: isEditMode ? widget.post!.title : '',
    );
    quantityController = TextEditingController(
      text: isEditMode ? widget.post!.quantity : '',
    );
    descriptionController = TextEditingController(
      text: isEditMode ? widget.post!.description : '',
    );
    locationController = TextEditingController(
      text: isEditMode ? widget.post!.pickupLocation : '',
    );
    imagePath = isEditMode ? widget.post!.imageUrl : '';
    category = isEditMode ? widget.post!.category : '';
    units = isEditMode ? widget.post!.unit : '';
    expiresOn = isEditMode ? widget.post!.expiresOn : '';
    super.initState();
  }

  @override
  void dispose() {
    itemNameController.dispose();
    quantityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    if (!_formKey.currentState!.validate()) {
      showToast(context, LocaleKeys.data_not_confirmed.tr());
      return false;
    }
    if (category == null) {
      showToast(context, LocaleKeys.please_select_category.tr());
      return false;
    }
    if (units == null) {
      showToast(context, LocaleKeys.please_select_unit.tr());
      return false;
    }
    if (_image == null && !isEditMode) {
      showToast(context, LocaleKeys.please_add_food_photo.tr());
      return false;
    }
    if (expiresOn == null) {
      showToast(context, LocaleKeys.please_select_expiry_date.tr());
      return false;
    }
    return true;
  }

  Future<void> _handleSave() async {
    if (!_validateForm()) return;

    final bloc = context.read<PostBloc>();

    String? imageData;
    String? mimeType;

    if (_image != null) {
      mimeType = lookupMimeType(_image!.path) ?? 'application/octet-stream';
      final bytes = await File(_image!.path).readAsBytes();
      imageData = base64Encode(bytes);
    }

    if (isEditMode) {
      //  Edit Post
    } else {
      // Create Post
      bloc.add(
        CreatePostEvent(
          title: itemNameController.text.trim(),
          description: descriptionController.text.trim(),
          quantity: quantityController.text.trim(),
          unit: units!,
          pickupLocation: locationController.text.trim(),
          expiresOn: expiresOn!,
          category: category!,
          imageType: mimeType!,
          imageData: imageData!,
        ),
      );
    }
  }

  Future<void> _imageSetter(bool fromCamera) async {
    final file = await pickUpImage(fromCamera);
    setState(() {
      _image = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 24,
        children: [
          CustomAddFoodPhotoWidget(
            imagePath: imagePath,
            image: _image,
            pickImage: _imageSetter,
            removeImage: () {
              setState(() {
                _image = null;
              });
            },
          ),
          CustomTextField(
            lable: '${LocaleKeys.item_name.tr()} *',
            hint: LocaleKeys.eg_Fresh_Vegetables_Baked_Goods.tr(),
            controller: itemNameController,
            validator: Validators.normal,
          ),
          CategoryDropDownButton(
            selectedValue: category,
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
          ),
          CountAndUnitWidget(
            units: units,
            quantityController: quantityController,
            onChanged: (value) {
              setState(() {
                units = value;
              });
            },
          ),
          CustomTextField(
            maxLines: 3,
            lable: LocaleKeys.Description.tr(),
            hint: LocaleKeys.Additional_details_about_the_food.tr(),
            controller: descriptionController,
            validator: Validators.normal,
          ),
          CustomDonateLableSections(
            image: Assets.location,
            lable: LocaleKeys.Pickup_Location.tr(),
          ),
          LocationTextField(locationController: locationController),
          CustomDonateLableSections(
            image: Assets.timer,
            lable: LocaleKeys.timing.tr(),
          ),
          CustomPickUpTimeWidget(
            onPressed: () async {
              pickDateTime(context);
              final DateTime? selectedDateTime = await pickDateTime(context);
              if (selectedDateTime != null) {
                expiresOn = selectedDateTime.toUtc().toIso8601String();
              }
            },
          ),
          CustomButton(
            title: LocaleKeys.post_food_donation.tr(),
            onPressed: _handleSave,
          ),
        ],
      ),
    );
  }
}
