import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/core/utils/app_text_styles.dart';
import 'package:todoapp/features/auth/views/login_screen.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_elevated_button.dart';

class LetStartScreen extends StatelessWidget {
  const LetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            SvgPicture.asset(
              AppAssets.letStart,
              height: MediaQuery.of(context).size.height * 0.42,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Text(
              'Welcome To\n Do It ! ',
              style: AppTextStyles.letStart(),
              textAlign: TextAlign.center,
            ),

            Text(
              'Ready to conquer your tasks? Let\'s Do It together.',
              style: AppTextStyles.letStart(
                color: AppColors.grey,
                fontsize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            CustomElevatedButton(
              textButton: 'Let’s Start',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
