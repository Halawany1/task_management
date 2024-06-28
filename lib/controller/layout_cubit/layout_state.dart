part of 'layout_cubit.dart';

@immutable
sealed class LayoutState {}

class LayoutInitial extends LayoutState {}

class ChangeIndexState extends LayoutState {}
