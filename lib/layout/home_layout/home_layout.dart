import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/search/search.dart';
import 'package:news_app/theme/theme_cubit/theme_cubit.dart';
import 'package:news_app/widget/text.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    ThemeCubit cubit1 = ThemeCubit.get(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const TextWidget(
                  text: "News App",
                  size: 24,
                  boldText: FontWeight.bold,
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ));
                      },
                      icon: const Icon(Icons.search_outlined)),
                  IconButton(
                      onPressed: () {
                        cubit1.changTheme();
                      },
                      icon: cubit1.lightTheme
                          ? const Icon(Icons.dark_mode)
                          : const Icon(Icons.light_mode))
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: Colors.lightBlue,
                  onTap: (value) {
                    cubit.changNavigatorItem(value);
                  },
                  currentIndex: cubit.currentIndex,
                  items: cubit.navItem),
              body: cubit.screens[cubit.currentIndex],
            );
          },
        );
      },
    );
  }
}
