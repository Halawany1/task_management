import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/core/component/default_bottom_component.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/views/edit_screen/edit_screen.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.isDon,
    required this.id,
  });
  final String title;
  final String description;
  final String time;
  final String id;
  final bool isDon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white
          )),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
                Text('$time',style: TextStyle(
                  fontSize: 15.sp,
                    color: Colors.white,
                  fontWeight: FontWeight.w600
                ))
              ],
            ),
            SizedBox(height: 30.h,),
            Text(description,style: TextStyle(
              fontSize: 15.sp,
                color: Colors.white,
              fontWeight: FontWeight.w600
            )),
            SizedBox(height: 12.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(isDon ? 'Done' : 'Not Done',style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp
                ),),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            BuildDefaultBottom(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  EditScreen(
                    id: id,
                    title: title,
                    description: description,
                  ),));
            }, text: 'Edit Task',),
          ],
        ),
      ),
    );
  }
}

