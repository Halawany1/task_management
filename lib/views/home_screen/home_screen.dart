import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/core/network/local.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(18.h),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back!',style:
                    GoogleFonts.poppins(
                      color:const Color(0xFFFED36A),
                        fontSize: 12.sp),),
                    SizedBox(height: 4.h,),
                    Text(CacheHelper.getData(key: App.userName),style:
                    GoogleFonts.poppins(
                        color:Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp),),
                  ],
                ),
                Image.asset('assets/images/avatar.png')
              ],)
            ],
          ),
        ),
      )
    );
  }
}

