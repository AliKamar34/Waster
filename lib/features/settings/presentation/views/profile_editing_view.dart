import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/core/widgets/custom_loading_indicator.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
import 'package:waster/features/settings/presentation/views/controllers/profile_editing_form_controller.dart';
import 'package:waster/features/settings/presentation/views/widgets/about_us_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/account_settings_buttons_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/basic_information_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/business_details_section.dart';
import 'package:waster/features/settings/presentation/views/widgets/profile_editing_photo_section.dart';

class ProfileEditingView extends StatefulWidget {
  const ProfileEditingView({super.key, required this.user});
  final UserEntity user;

  @override
  State<ProfileEditingView> createState() => _ProfileEditingViewState();
}

class _ProfileEditingViewState extends State<ProfileEditingView> {
  final _formKey = GlobalKey<FormState>();

  late final ProfileEditingFormController _formController;

  @override
  void initState() {
    super.initState();
    _formController = ProfileEditingFormController(widget.user);
  }

  @override
  void dispose() {
    _formController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) return;

    if (!_formController.hasChanges) {
      showToast(context, 'No Changes Detected');
      return;
    }

    final changes = _formController.getChanges();

    context.read<SettingsBloc>().add(SaveProfileChangesEvent(changes));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsUpdateSuccess) {
          showToast(context, state.message);
          context.pop();
        } else if (state is SettingsFailure) {
          showToast(context, state.message, isError: true);
        }
      },
      builder: (context, state) => Scaffold(
        body: CustomLoadinIndicator(
          isLoading: state is SettingsLoading ? true : false,
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 24,
                  children: [
                    CustomAppBar(title: LocaleKeys.profile_editing.tr()),
                    ProfileEditingPhotoSection(name: widget.user.fullName),
                    BasicInformationSection(
                      nameController: _formController.nameController,
                      emailController: _formController.emailController,
                      phoneController: _formController.phoneController,
                      locationController: _formController.locationController,
                      onPhoneChanged: (phoneNumber) {
                        _formController.updatePhoneNumber(phoneNumber);
                      },
                    ),
                    const BusinessDetailsSection(),
                    AboutUsSection(
                      bioController: _formController.bioController,
                    ),
                    AccountSettingsButtonsSection(saveOnPressed: _handleSave),
                    const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
