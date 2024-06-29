import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/controller/home_cubit/home_cubit.dart';
import 'package:task_management/core/component/card_task_component.dart';
import 'package:task_management/core/component/snak_bar_component.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/core/network/local.dart';
import 'package:task_management/views/logout_screen/logout_screen.dart';
import 'package:task_management/views/task_details_screen/task_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is SuccessAddTaskState) {
          showMessageResponse(
              message: 'Add Task Successfully',
              context: context,
              success: true);
        }
        if (state is SuccessUpdateAllTaskState) {
          showMessageResponse(
              message: 'Update Task Successfully',
              context: context,
              success: true);
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(

            body: state is LoadingGetAllTasksState||
            state is LoadingDeleteTaskState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFED36A),
                    ),
                  )
                :

            SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(18.h),
                      child:
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome Back!',
                                      style: GoogleFonts.poppins(
                                          color: const Color(0xFFFED36A),
                                          fontSize: 12.sp),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    Text(
                                      CacheHelper.getData(key: App.userName),
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 22.sp),
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder:(context) =>
                                          const LogoutScreen()));
                                    },
                                    child: Image.asset('assets/images/avatar.png')),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 20.h,
                            ),

                         if(cubit.tasks.isEmpty)
                           Padding(
                             padding:  EdgeInsets.symmetric(vertical:80.h),
                             child: Text('No Tasks Yet, Add New Tasks',
                               style: GoogleFonts.poppins(color: Colors.white,
                                   fontWeight: FontWeight.w600,fontSize: 16.sp),),
                           ),
                            if(cubit.tasks.isNotEmpty)
                         Column(children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Text(
                                 'All Tasks',
                                 style: GoogleFonts.poppins(
                                     color: Colors.white,
                                     fontWeight: FontWeight.w600,
                                     fontSize: 16.sp),
                               ),
                             ],
                           ),
                           SizedBox(
                             height: 15.h,
                           ),
                           ListView.separated(
                               shrinkWrap: true,
                               physics: const NeverScrollableScrollPhysics(),
                               itemBuilder: (context, index) =>
                                   Dismissible(
                                     key: Key(index.toString()),
                                     background: Container(
                                       color: Colors.red,
                                       child: Icon(
                                         Icons.delete,
                                         size: 30.r,
                                         color: Colors.white,
                                       ),
                                     ),
                                     secondaryBackground: Container(
                                       color: Colors.red,
                                       child: Icon(
                                         Icons.delete,
                                         size: 30.r,
                                         color: Colors.white,
                                       ),
                                     ),
                                     onDismissed: (direction) {
                                       cubit.deleteTask(cubit.tasks[index].id);
                                     },
                                     child: GestureDetector(
                                       onTap: () {
                                         Navigator.push(context,
                                             MaterialPageRoute(builder: (context) =>
                                                 TaskDetailsScreen(title: cubit.tasks[index].title,
                                                     description: cubit.tasks[index].description,
                                                     id:  cubit.tasks[index].id,
                                                     time: cubit.tasks[index].time,
                                                     isDon: cubit.tasks[index].isDon) ,));
                                       },
                                       child: BuildCardTask(
                                         title: cubit.tasks[index].title,
                                         description:cubit.tasks[index].description,
                                         isDon: cubit.tasks[index].isDon,
                                         time:cubit.tasks[index].time,
                                         onChangeUpdateTask: (value) {
                                           cubit.updateTaskDone(cubit.tasks[index].id,
                                               value!);
                                         },
                                       ),
                                     ),
                                   ),
                               separatorBuilder: (context, index) => SizedBox(
                                 height: 20.h,
                               ),
                               itemCount: cubit.tasks.length)
                         ],)
                          ],
                        ),
                      ),
                    ),
                  ));
      },
    );
  }
}
