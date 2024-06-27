import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/core/error/validation.dart';
import 'package:task_management/models/user_model.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  static AuthenticationCubit get(context)=>BlocProvider.of(context);

  bool eyeVisibality = false;


  void changeEyeVisibality() {
    eyeVisibality = !eyeVisibality;
    emit(ChangeEyeVisibalityState());
  }


  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoadingLoginState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password).then((value) {
      FirebaseFirestore.instance.collection('users').doc(value.user!.uid)
          .get().then((value) {
            if(value.exists){
              model = UserModel.fromJson(value.data()!);
              print(model!.name);
              emit(SuccessLoginState());
            }else{
              emit(FailedLoginState(value.data()!.toString()));
            }

      }).catchError((error) {
          emit(FailedLoginState(error.toString()));
      });

    });
  }

  UserModel? model;
  void userSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(LoadingSignupState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password).then((value) {
      userCreate(
          email: email,
          name: name,
          uId: value.user!.uid
      );
      emit(SuccessSignupState());
    }).catchError((error) {
      print(error.toString());
      emit(FailedSignupState(error.toString()));
    });
  }
    void userCreate({
      required String name,
      required String email,
      required String uId,

    }) {
      emit(LoadingCreateState());
      model = UserModel(
          name: name,
          email: email,
          uId: uId);
      FirebaseFirestore.instance.collection('users').doc(uId)
          .set(model!.toMap())
          .then((value) {
        emit(SuccessCreateState());
      }).catchError((error) {
        emit(FailedCreateState(error.toString()));
      });
    }

}
