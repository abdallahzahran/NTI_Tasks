import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.41,
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(50),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My First Tasks',
                  style: AppTextStyles.letStart(
                    fontsize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ),
                Spacer(),
                Text(
                  '11/03/2025 \n 05:00 PM',
                  style: AppTextStyles.letStart(
                    fontsize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
            Text(
              'Improve my English skills\n by trying to speek',
              style: AppTextStyles.letStart(
                fontsize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
