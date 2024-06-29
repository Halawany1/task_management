import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/component/default_bottom_component.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/core/network/local.dart';
import 'package:task_management/views/login_screen/login_screen.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding:  EdgeInsets.all(20.h),
        child: Center(
          child: BuildDefaultBottom(
              onPressed: () {
                CacheHelper.removeData(key: App.uId);
                CacheHelper.removeData(key: App.userName);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                    (context) => const LoginScreen()), (route) => false);
              },
              text: 'Logout'),
        ),
      ),
    );
  }
}
