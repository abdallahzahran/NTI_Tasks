import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todoapp/core/widgets/custom_text__form_field.dart';
import 'package:todoapp/core/widgets/image_manager/image_manager_view.dart';
import '../../../core/translation/translation_keys.dart';
import '../../../core/utils/app_assets.dart';
import '../data/models/category_model.dart';
import '../manager/add_task_cubit/add_task_cubit.dart';
import '../manager/add_task_cubit/add_task_state.dart';


class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> AddTaskCubit(),
      child: Scaffold(
        body: BlocConsumer<AddTaskCubit, AddTaskState>(
          listener:   (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                children:
                [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                     child:
                     ImageManagerView(
                         onPicked: (XFile image)
                         {
                           AddTaskCubit.get(context).image = image;
                         },
                         pickedBody: (XFile image)
                         {
                           return Container(
                             width: double.infinity,
                             height: MediaQuery.of(context).size.height*0.36,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(
                                   bottomLeft: Radius.circular(20),
                                   bottomRight: Radius.circular(20),
                                 ),
                                 image: DecorationImage(
                                     image: FileImage(File(image.path)),
                                     fit: BoxFit.cover
                                 )
                             ),
                           );
                         },
                         unPickedBody: ClipRRect(
                           borderRadius: BorderRadius.only(
                             bottomLeft: Radius.circular(20),
                             bottomRight: Radius.circular(20),
                           ),
                           child: Image.asset(
                             AppAssets.flag,
                             width: double.infinity,
                             height: MediaQuery.of(context).size.height*0.36,
                             fit: BoxFit.cover,
                           ),
                         )
                     ),

                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(20),
                    //
                    //   child: InkWell(
                    //     onTap: ()
                    //     {
                    //       AddTaskCubit.get(context).pickImage();
                    //     },
                    //     child: SizedBox(
                    //       width: double.infinity,
                    //       height: MyResponsive.height(context, value: 207),
                    //       child:
                    //       // state is AddTaskChangeImageState?
                    //       AddTaskCubit.get(context).image !=null?
                    //       Image.file(File(AddTaskCubit.get(context).image!.path),
                    //         fit: BoxFit.cover,)
                    //           :
                    //       Image.asset(AppAssets.flag,fit: BoxFit.cover)
                    //
                    //       ,
                    //     ),
                    //   ),
                    // ),
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                      label: TranslationKeys.title.tr,
                      validator:  (String? value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                      controller:AddTaskCubit.get(context).titleController
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                      label: TranslationKeys.description.tr,
                      validator: (String? value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                      controller:AddTaskCubit.get(context).descriptionController
                  ),
                  SizedBox(height: 20,),
                  DropdownButtonFormField<CategoryModel>(
                    validator: (value) {
                      if (value == null) {
                        return 'Please select';
                      }
                      return null;
                    },
                    items: AddTaskCubit.get(context).categories.map((category) =>
                        DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: [
                                category.icon,
                                SizedBox(width: 10,),
                                Text(category.title),
                              ],
                            ))).toList(),
                    onChanged: (value)
                    {
                      if(value != null) {
                        AddTaskCubit.get(context).changeGroup(value);
                      }
                    },)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}