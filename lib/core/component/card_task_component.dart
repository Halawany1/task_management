import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCardTask extends StatelessWidget {
  const BuildCardTask({super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.isDon,
    required this.onChangeUpdateTask,});
  final String title;
  final bool isDon;
  final String description;
  final String time;
  final void Function(bool?) onChangeUpdateTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.h),
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(12.r),
        color: const Color(0xFF455A64),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment
                .spaceBetween,
            children: [
              Text(
                maxLines: 2,
                title,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight:
                    FontWeight.w600,
                    fontSize: 16.sp),
              ),
              Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  value: isDon,
                  shape:
                  RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(
                        3.r),
                  ),
                  side: BorderSide(
                      color: Colors.grey,
                      width: 1.5.w),
                  checkColor: Colors.white,
                  fillColor:isDon
                      ? MaterialStateProperty
                      .all(Colors.blue)
                      : null,
                  activeColor: Colors.blue,
                  onChanged: onChangeUpdateTask,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
          description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            'Date Time: $time',
            style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
