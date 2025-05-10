import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:level_1_task_gdg/cache/cache_helper.dart';
import 'package:level_1_task_gdg/core/api/dio_consumer.dart';
import 'package:level_1_task_gdg/core/color.dart';
import 'package:level_1_task_gdg/screens/auth/create_account_view/data/cubit/create_account_cubit.dart';
import 'package:level_1_task_gdg/screens/auth/login_view/data/cubit/login_cubit.dart';
import 'package:level_1_task_gdg/screens/home/data/cubit/products_cubit.dart';
import 'package:level_1_task_gdg/screens/auth/login_view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (_) => SignInCubit(DioConsumer(dio: Dio())),
        ),
        BlocProvider<CreateAccountCubit>(
          create: (_) => CreateAccountCubit(DioConsumer(dio: Dio())),
        ),

        BlocProvider<ProductsCubit>(
          create: (_) => ProductsCubit(
          //  DioConsumer(dio: Dio())
            ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.purple),
      ),
      home: const LoginView(),
    );
  }
}
