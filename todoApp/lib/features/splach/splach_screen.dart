import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/features/splach/let_start_screen.dart';
import '../../core/utils/app_assets.dart';
import '../../core/utils/app_colors.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.scaffoldBackground),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.22),
              SvgPicture.asset(
                AppAssets.splach,
                height: MediaQuery.of(context).size.height * 0.42,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LetStartScreen()),
                  );
                },
                child: Text(
                  'Todo',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 36,
                    fontFamily: 'Lexend Deca',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
