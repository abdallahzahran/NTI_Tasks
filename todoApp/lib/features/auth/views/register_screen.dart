import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/app_assets.dart';
import 'package:todoapp/core/utils/app_text_styles.dart';
import 'package:todoapp/core/widgets/custom_elevated_button.dart';
import 'package:todoapp/core/widgets/custom_text__form_field.dart';
import 'package:todoapp/features/auth/views/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              AppAssets.flag,
              height: MediaQuery.of(context).size.height * 0.36,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            CustomTextFormField(
              label: 'Username',
              prefixIconPath: AppAssets.profile,
            ),
            CustomTextFormField(
              label: 'Password',
              prefixIconPath: AppAssets.password,
              suffixIconPath: AppAssets.lock,
              obscureText: true,
            ),
            CustomTextFormField(
              label: 'Confirm password',
              prefixIconPath: AppAssets.password,
              suffixIconPath: AppAssets.lock,
              obscureText: true,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomElevatedButton(textButton: 'Register', onPressed: () {}),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have An Account? ",
                  style: AppTextStyles.letStart(
                    fontsize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Text(
                    "Login",
                    style: AppTextStyles.letStart(
                      fontsize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
