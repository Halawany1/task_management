import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/controller/home_cubit/home_cubit.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/core/network/local.dart';

class CompleteTaskScreen extends StatelessWidget {
  const CompleteTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
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
                child: cubit.doneTasks.isEmpty?
                Center(
                  child: Text('No Completed Tasks',
                    style: GoogleFonts.poppins(color: Colors.white,
                        fontWeight: FontWeight.w600,fontSize: 16.sp),),
                )

                :SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Complete Tasks',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
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
                                        cubit.doneTasks[index].title,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 16.sp),
                                      ),
                                      Transform.scale(
                                        scale: 1.3,
                                        child: Checkbox(
                                          value: true,
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
                                              .doneTasks[index].isDon
                                              ? MaterialStateProperty
                                              .all(Colors.blue)
                                              : null,
                                          activeColor: Colors.blue,
                                          onChanged: (value) {
                                            cubit.updateTaskDone(cubit
                                                .doneTasks[index].id,false);
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    cubit.doneTasks[index].description,
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
                                    'Date Time: ${cubit.doneTasks[index].time}',
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
                          itemCount: cubit.doneTasks.length)
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
