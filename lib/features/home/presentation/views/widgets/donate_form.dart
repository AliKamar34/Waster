import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
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
            lable: '${LocaleKeys.item_name.tr()} *',
            hint: LocaleKeys.eg_Fresh_Vegetables_Baked_Goods.tr(),
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
          CustomTextFeild(
            maxLines: 3,
            lable: LocaleKeys.Description_Optional.tr(),
            hint: LocaleKeys.Additional_details_about_the_food.tr(),
          ),
          CustomDonateLableSections(
            image: Assets.timer,
            lable: LocaleKeys.timing.tr(),
          ),
          CustomTextFeild(
            lable: '${LocaleKeys.Available_for_Pickup.tr()} *',
            hint: '',
            controller: availableForPickUbController,
            validator: Validators.normal,
          ),
          CustomTextFeild(
            lable: '${LocaleKeys.Must_be_Picked_Up_By.tr()} *',
            hint: '',
            controller: mustBePickedUpByController,
            validator: Validators.normal,
          ),
          CustomDonateLableSections(
            image: Assets.location,
            lable: LocaleKeys.Pickup_Location.tr(),
          ),
          const CustomPickUpLocationWidget(),
          CustomButton(
            title: LocaleKeys.post_food_donation.tr(),
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  units != null &&
                  category != null) {
                if (_image != null) {
                  showToast(context, LocaleKeys.data_confirmed.tr());
                  context.pop();
                } else {
                  showToast(context, LocaleKeys.please_add_food_photo.tr());
                }
              } else {
                showToast(context, LocaleKeys.data_not_confirmed.tr());
              }
            },
          ),
        ],
      ),
    );
  }
}
