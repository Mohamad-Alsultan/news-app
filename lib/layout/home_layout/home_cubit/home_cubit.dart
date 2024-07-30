import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/domain/dio_helper.dart';
import 'package:news_app/layout/business/business.dart';
import 'package:news_app/layout/science/science.dart';
import 'package:news_app/layout/sport_screen/sport_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const BusinessScreen(),
    const SportScreen(),
    const ScienceScreen(),
  ];
  List<BottomNavigationBarItem> navItem = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
  ];
  void changNavigatorItem(int index) async {
    currentIndex = index;
    if (index == 1) {
      await getData(category: "sport", data: sport);
    } else {
      await getData(category: "science", data: science);
    }
    emit(ChangNavBar());
  }

  Future getData({required String category, required List data}) async {
    emit(GetDataLoading());
    try {
      Response response = await DioHelper.getData(parameter: {
        "country": "eg",
        "category": category,
        "apiKey": "dadd929f5d5540e9bf2044fdba8a871c",
      });

      data.addAll(response.data["articles"]);

      emit(GetDataSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetDataErrorConation());
    }
  }

  Future getDataSearch({required String q, required List data}) async {
    emit(GetDataLoading());
    try {
      Response response = await DioHelper.getDataSearch(parameter: {
        "q": q,
        "apiKey": "dadd929f5d5540e9bf2044fdba8a871c",
      });

      data.addAll(response.data["articles"]);

      emit(GetDataSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetDataErrorConation());
    }
  }
}

List<dynamic> business = [];
List<dynamic> sport = [];
List<dynamic> science = [];
List<dynamic> search = [];
