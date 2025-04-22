import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/core/utils/app_assets.dart';
import 'package:todoapp/core/utils/app_colors.dart';
import 'package:todoapp/core/utils/app_text_styles.dart';
import 'package:todoapp/core/widgets/custom_card.dart';
import 'package:todoapp/features/profile/views/profile_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );},
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
                      'Abdallah Zahran',
                      style: AppTextStyles.letStart(
                        fontsize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(AppAssets.plus),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Row(
              children: [
                Text(
                  'Tasks',
                  style: AppTextStyles.letStart(
                    fontsize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColors.black,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.height * 0.02),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: AppColors.primary.withAlpha(50),
                  ),
                  child: Center(
                    child: Text(
                      '5',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.letStart(
                        fontsize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return CustomCard();
              },
              separatorBuilder: (context, index) => SizedBox(height: 12),
            ),
          ],
        ),
      ),
    );
  }
}
