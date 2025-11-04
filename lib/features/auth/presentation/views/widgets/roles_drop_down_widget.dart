import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:waster/core/localization/locale_keys.g.dart';
import 'package:waster/core/widgets/custom_drop_down_button.dart';
import 'package:waster/features/auth/data/models/roles_enum.dart';

class RolesDropDownWidget extends StatelessWidget {
  const RolesDropDownWidget({
    super.key,
    required this.selectedRole,
    required this.onChanged,
  });
  final RolesEnum? selectedRole;
  final void Function(RolesEnum?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton<RolesEnum>(
      lable: LocaleKeys.i_want_to.tr(),
      hint: LocaleKeys.select_your_role.tr(),
      selectedValue: selectedRole,
      onChanged: onChanged,
      validator: (value) {
        if (value == null) {
          return LocaleKeys.please_select_a_role.tr();
        }
        return null;
      },
      items: [
        DropdownMenuItem(
          value: RolesEnum.donor,
          child: Text(LocaleKeys.donor.tr()),
        ),
        DropdownMenuItem(
          value: RolesEnum.recipient,
          child: Text(LocaleKeys.recipient.tr()),
        ),
        DropdownMenuItem(
          value: RolesEnum.volunteer,
          child: Text(LocaleKeys.volunteer.tr()),
        ),
      ],
    );
  }
}
