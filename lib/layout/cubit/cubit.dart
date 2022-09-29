import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg/layout/cubit/states.dart';
import 'package:gdg/modules/home_screen/home_screen.dart';
import 'package:gdg/modules/screen_2/screen_2.dart';

import '../../modules/screen_3/screen_3.dart';
import '../../modules/screen_4/screen_4.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens=[
    HomeScreen(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  void changeIndex(index)
  {
    currentIndex=index;
    emit(AppChangeBottomNavBar());
  }

}