import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:task_management/controller/authentication_cubit/authentication_cubit.dart';
import 'package:task_management/core/component/default_bottom_component.dart';
import 'package:task_management/core/component/default_text_form_component.dart';
import 'package:task_management/core/component/snak_bar_component.dart';
import 'package:task_management/core/error/validation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var nameController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if(state is FailedSignupState){
          showMessageResponse(message: state.error,
              context: context, success: false);
        }
        if(state is SuccessSignupState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = AuthenticationCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.h),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset('assets/images/dayTask.png', width: 120.w,
                        height: 80.h, fit: BoxFit.cover,),
                      SizedBox(height: 30.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Create your account',
                            style: GoogleFonts.
                            roboto(color: Colors.white,
                                fontSize: 25.sp, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      BuildDefaultTextForm(
                        maxLength: 80,
                          validator: (value) {
                            return Validation.validateName(value!);
                          },
                          controller: nameController,
                          title: 'Full Name',
                          hintText: 'Mohamed Elhalawany',
                          icon: IconBroken.User),
                      SizedBox(height: 15.h,),
                      BuildDefaultTextForm(
                          maxLength: 120,
                          validator: (value) {
                            return Validation.validateEmail(value!);
                          },
                          controller: emailController,
                          title: 'Email Address',
                          hintText: 'mohamedelhalawany120@gmail.com',
                          icon: IconBroken.User),
                      SizedBox(height: 15.h,),
                      BuildDefaultTextForm(
                        maxLength: 120,
                          validator: (value) {
                            return Validation.validatePassword(value!);
                          },
                          onTapSuffixIcon: () {
                            cubit.changeEyeVisibality();
                          },
                          title: 'Password',
                          controller: passwordController,
                          obscureText: !cubit.eyeVisibality,
                          hintText: '****************',
                          suffixIcon:cubit.eyeVisibality?
                          Icons.visibility_outlined
                              :
                          Icons.visibility_off_outlined,
                          icon: IconBroken.Lock),
                      SizedBox(height: 30.h,),
                      state is LoadingSignupState?
                      const Center(child: CircularProgressIndicator(color: Color(0xFFFED36A),))
                          : BuildDefaultBottom(onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userSignUp(email: emailController.text,
                              name: nameController.text,
                              password: passwordController.text);
                        }
                      },
                          text: "Sign Up"),
                      SizedBox(height: 22.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 15.sp),),
                          TextButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text('Log In',
                            style: GoogleFonts.roboto(color:
                            Color(0xFFFED36A), fontSize: 15.sp),))
                        ],)
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
