import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/controller/layout_cubit/layout_cubit.dart';
import 'package:task_management/views/add_task_screen/add_task_screen.dart';
import 'package:task_management/views/home_screen/home_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
          body: cubit.screens[cubit.currentIndex],
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xFFFED36A),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                  const AddTaskScreen(),));
            },
            child: Icon(
              Icons.add,
              size: 24.r,
              color: Colors.black,
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 3,
            unselectedItemColor: Color(0xFF617D8A),
            iconSize: 25.r,
            selectedItemColor: Color(0xFFFED36A),
            backgroundColor: Color(0xFF263238),
            onTap: (value) {
              cubit.changeIndex(value);
            },
            currentIndex: cubit.currentIndex,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),
                  label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.task),
                  label: 'Done Tasks'),
            ],
          ),
        );
      },
    );
  }
}

