import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/controller/home_cubit/home_cubit.dart';
import 'package:task_management/core/component/default_bottom_component.dart';
import 'package:task_management/core/component/default_text_form_component.dart';
import 'package:task_management/core/component/snak_bar_component.dart';
import 'package:task_management/core/error/validation.dart';
import 'package:task_management/views/layout_screen/layout_screen.dart';

class EditScreen extends StatelessWidget {
  const EditScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.id});

  final String title;
  final String description;
  final String id;

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    titleController.text = title;
    descriptionController.text = description;
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SuccessUpdateAllTaskState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LayoutScreen(),
              ));
        }
        if (state is FailedUpdateTaskState) {
          showMessageResponse(
              message: 'Failed Edit Task', context: context, success: false);
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Task',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp)),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(20.h),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    BuildDefaultTextForm(
                        title: 'Title',
                        controller: titleController,
                        maxLength: 20,
                        boldTitle: true,
                        hintText: 'Enter your task title',
                        validator: (value) {
                          return Validation.validateTitle(value!);
                        }),
                    SizedBox(
                      height: 25.h,
                    ),
                    BuildDefaultTextForm(
                        title: 'Description',
                        maxLength: 800,
                        controller: descriptionController,
                        boldTitle: true,
                        hintText: 'Enter your task description',
                        maxLines: 4,
                        validator: (value) {
                          return Validation.validateDescription(value!);
                        }),
                    SizedBox(
                      height: 50.h,
                    ),
                    state is LoadingUpdateTaskState
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: Color(0xFFFED36A),
                          ))
                        : BuildDefaultBottom(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.updateTask(
                                    uuid: id,
                                    description: descriptionController.text,
                                    title: titleController.text);
                              }
                            },
                            text: 'Save',
                          )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
