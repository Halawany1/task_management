import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_management/controller/authentication_cubit/authentication_cubit.dart';
import 'package:task_management/core/network/local.dart';
import 'views/get_start_screen/get_start_screen.dart';
import 'views/login_screen/login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBluuYA-VhCTRqWy9a6TyxUEzAF9fryOVk",//  ==   current_key in google-services.json file
      appId: "1:1087977779468:android:318b6856612781037b1929", // ==  mobilesdk_app_id  in google-services.json file
      messagingSenderId: "1087977779468", // ==   project_number in google-services.json file
      projectId: "task-management-c749a", // ==   project_id   in google-services.json file
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              theme: ThemeData(
                  scaffoldBackgroundColor: Color(0xFF212832)
              ),
              debugShowCheckedModeBanner: false,
              home: GetStartScreen(),
            );
          }),
    );
  }
}

