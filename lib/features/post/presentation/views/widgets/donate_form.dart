import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/pick_up_image.dart';
import 'package:waster/core/utils/show_time_picker.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/utils/validators.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_text_field.dart';
import 'package:waster/features/auth/presentation/views/widgets/location_text_field.dart';
import 'package:waster/core/entity/post_entity.dart';
import 'package:waster/features/post/domain/entity/enums/post_mode_enum.dart';
import 'package:waster/features/post/presentation/manager/bloc/post_bloc.dart';
import 'package:waster/features/post/presentation/manager/cubit/donate_form_cubit.dart';
import 'package:waster/features/post/presentation/manager/cubit/donate_form_state.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController itemNameController;
  late final TextEditingController quantityController;
  late final TextEditingController descriptionController;
  late final TextEditingController locationController;

  bool get isEditMode => widget.postMode == PostMode.edit;

  @override
  void initState() {
    _initializeControllers();
    super.initState();
  }

  void _initializeControllers() {
    final isEdit = widget.postMode == PostMode.edit;
    itemNameController = TextEditingController(
      text: isEdit ? widget.post!.title : '',
    );
    quantityController = TextEditingController(
      text: isEdit ? widget.post!.quantity : '',
    );
    descriptionController = TextEditingController(
      text: isEdit ? widget.post!.description : '',
    );
    locationController = TextEditingController(
      text: isEdit ? widget.post!.pickupLocation : '',
    );
  }

  @override
  void dispose() {
    itemNameController.dispose();
    quantityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> _handleSave(BuildContext context) async {
    final formState = context.read<DonateFormCubit>().state;
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (!formState.isValid) {
      showToast(
        context,
        formState.errorMessage ?? 'please complete the form the form',
        isError: true,
      );

      return;
    }

    final bloc = context.read<PostBloc>();
    if (isEditMode) {
      //  Edit Post
      bloc.add(
        EditPostEvent(
          id: widget.post!.id,
          title: itemNameController.text.trim(),
          description: descriptionController.text.trim(),
          quantity: quantityController.text.trim(),
          unit: formState.unit!,
          pickupLocation: locationController.text.trim(),
          expiresOn: formState.expiresOn!,
          category: formState.category!,
          imageFile: formState.image!,
        ),
      );
    } else {
      // Create Post
      bloc.add(
        CreatePostEvent(
          title: itemNameController.text.trim(),
          description: descriptionController.text.trim(),
          quantity: quantityController.text.trim(),
          unit: formState.unit!,
          pickupLocation: locationController.text.trim(),
          expiresOn: formState.expiresOn!,
          category: formState.category!,
          imageFile: formState.image!,
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
          BlocBuilder<DonateFormCubit, DonateFormState>(
            builder: (context, state) {
              return CustomAddFoodPhotoWidget(
                imagePath: widget.post?.imageUrl,
                image: state.image,
                pickImage: (bool fromCamera) async {
                  final image = await pickUpImage(fromCamera);
                  if (context.mounted) {
                    context.read<DonateFormCubit>().updateImage(image);
                  }
                },
                removeImage: () {
                  context.read<DonateFormCubit>().updateImage(null);
                },
              );
            },
          ),
          CustomTextField(
            lable: '${LocaleKeys.item_name.tr()} *',
            hint: LocaleKeys.eg_Fresh_Vegetables_Baked_Goods.tr(),
            controller: itemNameController,
            validator: Validators.normal,
          ),
          BlocBuilder<DonateFormCubit, DonateFormState>(
            builder: (context, state) {
              return CategoryDropDownButton(
                selectedValue: state.category,
                onChanged: (value) {
                  context.read<DonateFormCubit>().updateCategory(value);
                },
              );
            },
          ),
          BlocBuilder<DonateFormCubit, DonateFormState>(
            builder: (context, state) {
              return CountAndUnitWidget(
                units: state.unit,
                quantityController: quantityController,
                onChanged: (value) {
                  context.read<DonateFormCubit>().updateUnit(value);
                },
              );
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
          BlocBuilder<DonateFormCubit, DonateFormState>(
            builder: (context, state) {
              return CustomPickUpTimeWidget(
                onPressed: () async {
                  final selectedDate = await pickDateTime(context);
                  if (context.mounted) {
                    context.read<DonateFormCubit>().updateExpiresOn(
                      selectedDate,
                    );
                    // }
                  }
                },
              );
            },
          ),
          CustomButton(
            title: LocaleKeys.post_food_donation.tr(),
            onPressed: () => _handleSave(context),
          ),
        ],
      ),
    );
  }
}
