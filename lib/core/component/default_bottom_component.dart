import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildDefaultBottom extends StatelessWidget {
  const BuildDefaultBottom({super.key,
    required this.onPressed,
    required this.text,});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      height: 50.h,
      color: const Color(0xFFFED36A),
      child: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 16.sp),
      ),
    );
  }
}

