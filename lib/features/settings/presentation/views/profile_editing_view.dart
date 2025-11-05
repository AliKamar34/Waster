import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/utils/show_toast.dart';
import 'package:waster/features/browse/presentation/views/widgets/custom_app_bar.dart';
import 'package:waster/features/settings/domain/entity/user_entity.dart';
import 'package:waster/features/settings/presentation/manager/bloc/settings_bloc.dart';
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

  // Controllers
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _locationController;
  late final TextEditingController _bioController;

  // Original values (for tracking changes)
  late final String _originalName;
  late final String _originalEmail;
  late final String _originalPhone;
  late final String _originalLocation;
  late final String _originalBio;

  @override
  void initState() {
    super.initState();

    // Store original values
    _originalName = widget.user.fullName;
    _originalEmail = widget.user.email;
    _originalPhone = widget.user.phoneNumber;
    _originalLocation = widget.user.address;
    _originalBio = 'this is the original Bio';

    // Initialize controllers
    _nameController = TextEditingController(text: _originalName);
    _emailController = TextEditingController(text: _originalEmail);
    _phoneController = TextEditingController(text: _originalPhone);
    _locationController = TextEditingController(text: _originalLocation);
    _bioController = TextEditingController(text: _originalBio);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  // Parse full name to first and last name
  (String, String) _parseFullName(String fullName) {
    final parts = fullName.trim().split(' ');
    if (parts.isEmpty) return ('', '');
    if (parts.length == 1) return (parts[0], '');
    return (parts.first, parts.sublist(1).join(' '));
  }

  // Handle save - only send changed fields
  void _handleSave() {
    if (!_formKey.currentState!.validate()) return;

    final bloc = context.read<SettingsBloc>();
    bool hasChanges = false;

    // Check Name
    if (_nameController.text.trim() != _originalName) {
      final (firstName, lastName) = _parseFullName(_nameController.text);
      bloc.add(UpdateNameEvent(firstName: firstName, lastName: lastName));
      hasChanges = true;
    }

    // Check Phone
    if (_phoneController.text.trim() != _originalPhone) {
      bloc.add(UpdatePhoneNumberEvent(phoneNum: _phoneController.text.trim()));
      hasChanges = true;
    }

    // Check Location
    if (_locationController.text.trim() != _originalLocation) {
      bloc.add(UpdateLocationEvent(address: _locationController.text.trim()));
      hasChanges = true;
    }

    // Check Bio
    if (_bioController.text.trim() != _originalBio) {
      bloc.add(UpdateBioEvent(bio: _bioController.text.trim()));
      hasChanges = true;
    }

    if (!hasChanges) {
      showToast(context, 'No Changes Has Detected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsUpdateSuccess) {
          showToast(context, state.message);
          context.pop();
        } else if (state is SettingsFailure) {
          showToast(context, state.message, isError: true);
        }
      },
      child: Scaffold(
        body: SafeArea(
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
                    nameController: _nameController,
                    emailController: _emailController,
                    phoneController: _phoneController,
                    locationController: _locationController,
                  ),
                  const BusinessDetailsSection(),
                  AboutUsSection(bioController: _bioController),
                  AccountSettingsButtonsSection(saveOnPressed: _handleSave),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
