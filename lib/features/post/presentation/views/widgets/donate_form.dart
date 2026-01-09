import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/pick_up_image.dart';
import 'package:waster/core/utils/show_time_picker.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/location_text_field.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/post/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/post/presentation/views/controller/post_controller.dart';
import 'package:waster/features/post/presentation/views/widgets/category_drop_down_button.dart';
import 'package:waster/features/post/presentation/views/widgets/count_and_unit_widget.dart';
import 'package:waster/features/post/presentation/views/widgets/custom_add_food_photo_widget.dart';
import 'package:waster/features/post/presentation/views/widgets/custom_donate_lable_sections.dart';
import 'package:waster/features/post/presentation/views/widgets/custom_pick_up_time_widget.dart';

class DonateForm extends StatefulWidget {
  const DonateForm({super.key, required this.postMode, this.post});

  final PostMode postMode;
  final PostEntity? post;

  @override
  State<DonateForm> createState() => _DonateFormState();
}

class _DonateFormState extends State<DonateForm> {
  final _formKey = GlobalKey<FormState>();

  late final DonateFormController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DonateFormController(post: widget.post);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_controller.isValid) {
      showToast(
        context,
        _controller.firstError ?? 'Please complete the form',
        isError: true,
      );
      return;
    }

    if (_controller.isEditMode && !_controller.hasChanges) {
      showToast(context, 'No changes detected');
      return;
    }

    final data = _controller.toMap();
    final bloc = context.read<PostBloc>();

    if (_controller.isEditMode) {
      bloc.add(
        EditPostEvent(
          id: widget.post!.id,
          title: data['title'],
          description: data['description'],
          quantity: data['quantity'],
          unit: data['unit'],
          pickupLocation: data['pickupLocation'],
          expiresOn: data['expiresOn'],
          category: data['category'],
          imageFile: data['image'],
        ),
      );
    } else {
      bloc.add(
        CreatePostEvent(
          title: data['title'],
          description: data['description'],
          quantity: data['quantity'],
          unit: data['unit'],
          pickupLocation: data['pickupLocation'],
          expiresOn: data['expiresOn'],
          category: data['category'],
          imageFile: data['image'],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 24,
        children: [
          CustomAddFoodPhotoWidget(
            imagePath: widget.post?.imageUrl,
            image: _controller.image,
            pickImage: (fromCamera) async {
              final image = await pickUpImage(fromCamera);
              setState(() => _controller.updateImage(image));
            },
            removeImage: () => setState(() => _controller.updateImage(null)),
          ),
          CustomTextField(
            lable: '${LocaleKeys.item_name.tr()} *',
            hint: LocaleKeys.eg_Fresh_Vegetables_Baked_Goods.tr(),
            controller: _controller.titleController,
            validator: Validators.normal,
          ),
          CategoryDropDownButton(
            selectedValue: _controller.category,
            onSelected: (value) =>
                setState(() => _controller.updateCategory(value)),
          ),
          CountAndUnitWidget(
            units: _controller.unit,
            quantityController: _controller.quantityController,
            onSelected: (value) =>
                setState(() => _controller.updateUnit(value)),
          ),
          CustomTextField(
            maxLines: 3,
            lable: LocaleKeys.Description.tr(),
            hint: LocaleKeys.Additional_details_about_the_food.tr(),
            controller: _controller.descriptionController,
            validator: Validators.normal,
          ),
          CustomDonateLableSections(
            image: Assets.location,
            lable: LocaleKeys.Pickup_Location.tr(),
          ),
          LocationTextField(locationController: _controller.locationController),
          CustomDonateLableSections(
            image: Assets.timer,
            lable: LocaleKeys.timing.tr(),
          ),
          CustomPickUpTimeWidget(
            onPressed: () async {
              final date = await pickDateTime(context);
              if (date != null) {
                setState(() => _controller.updateExpiresOn(date));
              }
            },
          ),
          CustomButton(
            title: _controller.isEditMode
                ? LocaleKeys.save.tr()
                : LocaleKeys.post_food_donation.tr(),
            onPressed: _handleSave,
          ),
        ],
      ),
    );
  }
}
