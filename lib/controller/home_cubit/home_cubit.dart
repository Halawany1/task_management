import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/core/network/local.dart';
import 'package:task_management/models/task_model.dart';
import 'package:uuid/uuid.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  void addTask({
    required String description,
    required String title,
  }) {
    print(title);
    DateTime now = DateTime.now();
    String formattedDayMonth = DateFormat('dd/MM').format(now);
    emit(LoadingAddTaskState());
    var uuid = Uuid().v4();
    firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('tasks')
        .doc(uuid)
        .set({
      'id': uuid,
      'description': description,
      'isDon': false,
      'time': formattedDayMonth,
      'title': title,
    }).then((value) {
      emit(SuccessAddTaskState());
      getAllTasks();
    }).catchError((error) {
      print(error.toString());
      emit(FailedAddTaskState());
    });
  }
  List<Task> tasks = [];
  List<Task> doneTasks = [];
  void getAllTasks() {
    emit(LoadingGetAllTasksState());
    tasks.clear();
    firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('tasks')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        if(data['isDon'] == false){
          tasks.add(Task.fromMap(doc.data() as Map<String, dynamic>));
        }else{
          doneTasks.add(Task.fromMap(doc.data() as Map<String, dynamic>));
        }
      }
      print(tasks);
      emit(SuccessGetAllTasksState());
    }).catchError((error) {
      print(error.toString());
      emit(FailedGetAllTasksState());
    });
  }

  void updateTaskDone(String uuid) {
    emit(LoadingUpdateTaskState());
    firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection('tasks')
        .doc(uuid)
        .update({
      'isDon': true,
    }).then((value) {
      emit(SuccessUpdateTaskState());
      getAllTasks();
    }).catchError((error) {
      print(error.toString());
      emit(FailedUpdateTaskState());
    });
  }
}
