import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac/views/manager/home_cubit/home_cubit.dart';

import 'views/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1200, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocProvider(
              create: (context) => HomeCubit()..getcontent(),
              child: const HomeScreen(),
            ),
          );
        });
  }
}
