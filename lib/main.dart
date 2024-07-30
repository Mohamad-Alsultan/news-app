import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/dio_helper.dart';
import 'package:news_app/layout/home_layout/home_cubit/home_cubit.dart';
import 'package:news_app/layout/home_layout/home_layout.dart';
import 'package:news_app/theme/app_theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/theme/theme_cubit/theme_cubit.dart';

void main() async {
  DioHelper.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (BuildContext context) =>
              HomeCubit()..getData(category: "business", data: business),
        ),
        BlocProvider<ThemeCubit>(
            create: (BuildContext context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          ThemeCubit cubit = ThemeCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: cubit.lightTheme ? ThemeMode.light : ThemeMode.dark,
            home: const HomeLayout(),
          );
        },
      ),
    );
  }
}
