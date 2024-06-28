import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_broken/icon_broken.dart';

class BuildDefaultTextForm extends StatelessWidget {
  const BuildDefaultTextForm({super.key,
    required this.title,
     this.hintText,
    required this.controller,
    required this.validator,
     this.onTapSuffixIcon,
     this.obscureText=false,
     this.maxLines=1,
     this.suffixIcon,
     this.boldTitle=false,
     this.icon});
  final String title;
  final String ?hintText;
  final TextEditingController controller;
  final IconData ?icon;
  final IconData ?suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final VoidCallback ?onTapSuffixIcon;
  final int maxLines;
  final bool boldTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,

          style:
        GoogleFonts.roboto(
            fontWeight:boldTitle?FontWeight.bold: null,
            color: boldTitle?Colors.white:const Color(0xFF8CAAB9),
            fontSize:boldTitle? 16.sp: 14.sp),
        ),
        SizedBox(height: 10.h,),
        TextFormField(
          cursorColor: Colors.white,
          obscureText: obscureText,
          obscuringCharacter: '●',
          controller: controller,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp
          ),
          validator: validator,
          maxLines: maxLines,
          decoration: InputDecoration(
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.red
                )
            ),
            errorStyle: TextStyle(
              color: Colors.red,
              fontSize: 13.sp,
            ),
            focusedBorder:  const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Color(0xFFFED36A)
                )
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide.none
            ),
            prefixIcon:icon!=null?
            Icon(icon,color: Colors.white,):null,
            suffixIcon: suffixIcon!=null?
            GestureDetector(
                onTap:onTapSuffixIcon ,
                child: Icon(suffixIcon,color: Colors.white,)):null,
            hintText:hintText,

            hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 13.sp,
            ),
            filled: true,
            fillColor: const Color(0xFF455A64),

          ),
        )
      ],);
  }
}
