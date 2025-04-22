import 'package:flutter/material.dart';
import 'package:todoapp/core/widgets/custom_card_profile.dart';
import 'package:todoapp/features/splach/splach_screen.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                    ),
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.height * 0.09,
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(AppAssets.flag, fit: BoxFit.cover),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplachScreen()),
                    );
                  },
                ),
                SizedBox(width: MediaQuery.of(context).size.height * 0.02),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello!',
                      style: AppTextStyles.letStart(
                        fontsize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      'Ahmed Saber',
                      style: AppTextStyles.letStart(
                        fontsize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return CustomCardProfile(iconPath: AppAssets.profile,);
              },
              separatorBuilder: (context, index) => SizedBox(height: 12),
            ),
          ],
        ),
      ),
    );
  }
}
