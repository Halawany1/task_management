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
import 'package:task_management/views/layout_screen/layout_screen.dart';
import 'package:task_management/views/sign_up_screen/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
      if(state is FailedLoginState){
        showMessageResponse(message: state.error,
            context: context, success: false);
      }
      if(state is SuccessLoginState){
       Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (context) => const LayoutScreen(),));
      }
      if(state is SuccessSignupState){
        showMessageResponse(message: 'Sign Up Successfully, Login Now',
            context: context, success: true);
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
                          Text('Welcome Back!',
                            style: GoogleFonts.
                            roboto(color: Colors.white,
                                fontSize: 25.sp, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      SizedBox(height: 12.h,),
                      BuildDefaultTextForm(
                        maxLength: 120,
                          validator: (value) {
                            return Validation.validateEmail(value!.trim());
                          },
                          controller: emailController,
                          title: 'Email Address',
                          hintText: 'mohamedelhalawany120@gmail.com',
                          icon: IconBroken.User),
                      SizedBox(height: 15.h,),
                      BuildDefaultTextForm(
                          maxLength: 120,
                          validator: (value) {
                            return Validation.validatePassword(value!.trim());
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
                      state is LoadingLoginState?
                      const Center(child: CircularProgressIndicator(color: Color(0xFFFED36A),))
                      :BuildDefaultBottom(onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.userLogin(email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                          text: "Log In"),
                      SizedBox(height: 22.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?',
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 15.sp),),
                          TextButton(onPressed: () {
                            cubit.eyeVisibality=false;
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>
                           const SignUpScreen(),));
                          }, child: Text('Sign Up',
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
