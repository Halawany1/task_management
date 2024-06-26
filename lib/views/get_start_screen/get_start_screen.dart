import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/core/component/default_bottom_component.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/core/network/local.dart';
import 'package:task_management/views/login_screen/login_screen.dart';

class GetStartScreen extends StatelessWidget {
  const GetStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/dayTask.png'),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Image.asset(
                'assets/images/get_start.png',
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Manage Your Tasks With',
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 46.sp,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'DayTask',
                    style: GoogleFonts.roboto(
                        color: const Color(0xFFFED36A),
                        fontSize: 46.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              BuildDefaultBottom(onPressed: () {
                CacheHelper.saveData(key: App.letsStart, value: true);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>
                    const LoginScreen(),));
              },
                text: "Let's Start",)
            ],
          ),
        ),
      ),
    );
  }
}
