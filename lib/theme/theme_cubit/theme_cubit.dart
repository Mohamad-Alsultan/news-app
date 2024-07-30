import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

final box = GetStorage();

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());
  static ThemeCubit get(context) => BlocProvider.of(context);
  bool lightTheme = box.read('light') ?? true;
  void changTheme() {
    lightTheme = !lightTheme;
    box.write("light", lightTheme);
    emit(ChangTheme());
  }
}
