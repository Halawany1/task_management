import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_management/core/constant/app_constant.dart';
import 'package:task_management/core/error/validation.dart';
import 'package:task_management/core/network/local.dart';
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
        password: password).then((val) {
      print(val.user!.uid);
      CacheHelper.saveData(key: App.uId,
                      value: val.user!.uid);
      emit(SuccessLoginState());
    }).catchError((error){
      String errorMessage;
      if (error is FirebaseAuthException) {
       errorMessage= getErrorMessage(error);
      } else {
        errorMessage = 'An error occurred. Please try again.';
      }
      emit(FailedLoginState(errorMessage));
    });
  }

  UserModel? model;
  void userSignUp({
    required String name,
    required String email,
    required String password,
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
      String errorMessage;
      if (error is FirebaseAuthException) {
        errorMessage= getErrorMessage(error);
      } else {
        errorMessage = 'An error occurred. Please try again.';
      }
      emit(FailedSignupState(errorMessage));
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
   String getErrorMessage(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'user-disabled':
        return 'The user has been disabled.';
      case 'user-not-found':
        return 'No user found for the given email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'invalid-credential':
        return 'The credential data is malformed or has expired.';
      default:
        return 'An undefined error occurred.';
    }
  }
}
