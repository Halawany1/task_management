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
