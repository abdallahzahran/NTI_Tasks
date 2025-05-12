import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/cache/cache_data.dart';
import 'core/cache/cache_helper.dart';
import 'core/translation/translation_helper.dart';
import 'features/splach/splach_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await TranslationHelper.setLanguage();
  runApp( TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        locale: Locale(CacheData.lang!),
        translations: TranslationHelper(),
      theme: ThemeData(
        fontFamily: 'Lexend Deca',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(body:SplashView(),
      ));
  }
}
