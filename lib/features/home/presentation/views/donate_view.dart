import 'package:flutter/material.dart';
import 'package:waster/features/home/presentation/views/widgets/custom_donate_app_bar.dart';
import 'package:waster/features/home/presentation/views/widgets/donate_form.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            spacing: 24,
            children: [
              CustomDonateAppBar(),
              DonateForm(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
