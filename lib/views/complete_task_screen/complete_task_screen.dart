import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management/controller/home_cubit/home_cubit.dart';
import 'package:task_management/core/component/card_task_component.dart';
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
                            onDismissed: (direction) {
                              cubit.deleteTask(cubit.doneTasks[index].id);
                            },
                            child: BuildCardTask(
                              title: cubit.doneTasks[index].title,
                              description:cubit.doneTasks[index].description,
                              isDon: cubit.doneTasks[index].isDon,
                              time:cubit.doneTasks[index].time,
                              onChangeUpdateTask: (value) {
                                cubit.updateTaskDone(cubit.doneTasks[index].id,
                                    value!);
                              },
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
