import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/controller/home_cubit/home_cubit.dart';
import 'package:task_management/core/component/snak_bar_component.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/core/network/local.dart';

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
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
            body: state is LoadingGetAllTasksState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFFFED36A),
                    ),
                  )
                : SafeArea(
                    child: Padding(
                      padding: EdgeInsets.all(18.h),
                      child: SingleChildScrollView(
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
                                Image.asset('assets/images/avatar.png'),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            const Divider(),
                            SizedBox(
                              height: 20.h,
                            ),
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
                                itemBuilder: (context, index) => Dismissible(
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
                                      onDismissed: (direction) {},
                                      child: Container(
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
                                                  cubit.tasks[index].title,
                                                  style: GoogleFonts.poppins(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.sp),
                                                ),
                                                Transform.scale(
                                                  scale: 1.3,
                                                  child: Checkbox(
                                                    value: false,
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
                                                    fillColor: cubit
                                                            .tasks[index].isDon
                                                        ? MaterialStateProperty
                                                            .all(Colors.blue)
                                                        : null,
                                                    activeColor: Colors.blue,
                                                    onChanged: (value) {
                                                      cubit.updateTaskDone(cubit
                                                          .tasks[index].id);
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              cubit.tasks[index].description,
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
                                              'Date Time: ${cubit.tasks[index].time}',
                                              style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 20.h,
                                    ),
                                itemCount: cubit.tasks.length)
                          ],
                        ),
                      ),
                    ),
                  ));
      },
    );
  }
}
