part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

class HomeInitial extends HomeState {}

class LoadingAddTaskState extends HomeState {}

class SuccessAddTaskState extends HomeState {}

class FailedAddTaskState extends HomeState {}

class LoadingGetAllTasksState extends HomeState {}

class SuccessGetAllTasksState extends HomeState {}

class FailedGetAllTasksState extends HomeState {}

class LoadingUpdateTaskState extends HomeState {}

class SuccessUpdateTaskState extends HomeState {}

class FailedUpdateTaskState extends HomeState {}

class LoadingDeleteTaskState extends HomeState {}

class SuccessDeleteTaskState extends HomeState {}

class SuccessUpdateAllTaskState extends HomeState {}

class FailedDeleteTaskState extends HomeState {}
