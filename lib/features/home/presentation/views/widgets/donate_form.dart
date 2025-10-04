import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/features/home/presentation/views/widgets/category_drop_down_button.dart';
import 'package:waster/features/home/presentation/views/widgets/count_and_unit_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_add_food_photo_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_donate_lable_sections.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_pick_up_location_widget.dart';

class DonateForm extends StatefulWidget {
  const DonateForm({super.key});

  @override
  State<DonateForm> createState() => _DonateFormState();
}

class _DonateFormState extends State<DonateForm> {
  File? _image;
  String? category, units;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController uqantityController = TextEditingController();
  TextEditingController availableForPickUbController = TextEditingController();
  TextEditingController mustBePickedUpByController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    itemNameController.dispose();
    uqantityController.dispose();
    availableForPickUbController.dispose();
    mustBePickedUpByController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 24,
        children: [
          CustomAddFoodPhotoWidget(
            image: _image,
            pickImage: (bool fromCamera) async {
              final ImagePicker picker = ImagePicker();
              final XFile? pickedFile = await picker.pickImage(
                source: fromCamera ? ImageSource.camera : ImageSource.gallery,
              );
              if (pickedFile != null) {
                setState(() {
                  _image = File(pickedFile.path);
                });
              }
            },
            removeImage: () {
              setState(() {
                _image = null;
              });
            },
          ),
          CustomTextFeild(
            lable: 'Item Name *',
            hint: 'e.g., Fresh Vegetables, Baked Goods',
            controller: itemNameController,
            validator: Validators.normal,
          ),
          CategoryDropDownButton(
            onChanged: (value) {
              setState(() {
                category = value;
              });
            },
          ),
          CountAndUnitWidget(
            quantityController: uqantityController,
            onChanged: (value) {
              setState(() {
                units = value;
              });
            },
          ),
          const CustomTextFeild(
            maxLines: 3,
            lable: 'Description (Optional)',
            hint: 'Additional details about the food...',
          ),
          const CustomDonateLableSections(image: Assets.timer, lable: 'Timing'),
          CustomTextFeild(
            lable: 'Available for Pickup *',
            hint: '',
            controller: availableForPickUbController,
            validator: Validators.normal,
          ),
          CustomTextFeild(
            lable: 'Must be Picked Up By *',
            hint: '',
            controller: mustBePickedUpByController,
            validator: Validators.normal,
          ),
          const CustomDonateLableSections(
            image: Assets.location,
            lable: 'Pickup Location',
          ),
          const CustomPickUpLocationWidget(),
          CustomButton(
            title: 'Post Donation',
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  units != null &&
                  category != null) {
                if (_image != null) {
                  showToast(context, 'data confirmed');
                  context.pop();
                } else {
                  showToast(context, 'please add food photo');
                }
              } else {
                showToast(context, 'data not confirmed');
              }
            },
          ),
        ],
      ),
    );
  }
}
