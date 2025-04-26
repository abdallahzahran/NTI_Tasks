import 'package:flutter/material.dart';
import 'package:todoapp/core/widgets/custom_card_profile.dart';
import 'package:todoapp/features/profile/views/change_password.dart';
import 'package:todoapp/features/profile/views/update_profile.dart';
import 'package:todoapp/features/splach/splach_screen.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<String> iconsList = [
    AppAssets.profile,
    AppAssets.lock,
    AppAssets.setting,
  ];

  final List<String> titleList = [
    'Update Profile',
    'Change Password',
    'Settings',
  ];

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
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            InkWell(
              child: CustomCardProfile(
                iconPath: AppAssets.profile,
                text: 'Update Profile',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateProfileView()),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            InkWell(
              child: CustomCardProfile(
                iconPath: AppAssets.lock,
                text: 'Change Password',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordView()),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            InkWell(
              child: CustomCardProfile(
                iconPath: AppAssets.setting,
                text: 'Settings',
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),

            // ListView.separated(
            //   shrinkWrap: true,
            //   physics: NeverScrollableScrollPhysics(),
            //   itemCount: 3,
            //   itemBuilder: (context, index) {
            //     return CustomCardProfile(iconPath: iconsList[index],  text: titleList[index],);
            //   },
            //     separatorBuilder: (context, index) => SizedBox(height: 12),
            // ),
          ],
        ),
      ),
    );
  }
}
