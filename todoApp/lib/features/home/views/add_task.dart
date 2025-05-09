import 'package:flutter/material.dart';
import 'package:todoapp/core/utils/app_assets.dart';
import 'package:todoapp/core/widgets/custom_elevated_button.dart';
import 'package:todoapp/core/widgets/custom_text__form_field.dart';
import 'package:todoapp/features/profile/views/profile_screen.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

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
            CustomTextFormField(label: 'Title', prefixIconPath: ''),

            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: TextFormField(
                maxLines: null,
                minLines: null,
                expands: false,
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
              ),
            ),

            // CustomTextFormField(
            //   label: 'Description',
            //   prefixIconPath: '',
            //   expands: true,
            // ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            CustomElevatedButton(
              textButton: 'AddTask',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}
