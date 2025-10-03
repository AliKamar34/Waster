import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:waster/core/constants/assets.dart';
import 'package:waster/core/widgets/custom_button.dart';
import 'package:waster/core/widgets/custom_text_feild.dart';
import 'package:waster/features/home/presentation/views/widgets/category_drop_down_button.dart';
import 'package:waster/features/home/presentation/views/widgets/count_and_unit_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_add_food_photo_widget.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_donate_app_bar.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_donate_lable_sections.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_pick_up_location_widget.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              const CustomDonateAppBar(),
              const CustomAddFoodPhotoWidget(),
              const CustomTextFeild(
                lable: 'Item Name *',
                hint: 'e.g., Fresh Vegetables, Baked Goods',
              ),
              const CategoryDropDownButton(),
              const CountAndUnitWidget(),
              const CustomTextFeild(
                maxLines: 3,
                lable: 'Description (Optional)',
                hint: 'Additional details about the food...',
              ),
              const CustomDonateLableSections(
                image: Assets.timer,
                lable: 'Timing',
              ),
              const CustomTextFeild(lable: 'Available for Pickup *', hint: ''),
              const CustomTextFeild(lable: 'Must be Picked Up By *', hint: ''),
              const CustomDonateLableSections(
                image: Assets.location,
                lable: 'Pickup Location',
              ),
              const CustomPickUpLocationWidget(),
              CustomButton(
                title: 'Post Donation',
                onPressed: () {
                  context.pop();
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
