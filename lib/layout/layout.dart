import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg/layout/cubit/cubit.dart';
import 'package:gdg/layout/cubit/states.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:switcher_button/switcher_button.dart';

import '../main_cubit/cubit.dart';

class Layout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('LOL'),
            actions: [
              Center(
                child: SwitcherButton(
                  value:  !MainCubit.get(context).isDark,
                  onColor: Colors.grey[200]!,
                  onChange: (value) {
                    MainCubit.get(context).toggleMode();
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar:  Container(
            decoration: BoxDecoration(
              color: MainCubit.get(context).isDark?Colors.black:Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: MainCubit.get(context).isDark?Colors.white.withOpacity(.1):Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[900]!,
                  haptic: true, // haptic feedback
                  gap: 8,
                  tabActiveBorder: Border.all(color: Colors.black, width: 1),
                  activeColor: MainCubit.get(context).isDark?Colors.white:Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: MainCubit.get(context).isDark?HexColor('333739'):Colors.white,
                  color: Colors.grey,
                  tabs: [
                    GButton(
                      icon: Icons.home_outlined,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.favorite_border,
                      text: 'Likes',
                    ),
                    GButton(
                      icon: Icons.search_outlined,
                      text: 'Search',
                    ),
                    GButton(
                      icon: Icons.person_outlined,
                      text: 'Profile',
                    ),
                  ],
                  onTabChange: (index) {
                    AppCubit.get(context).changeIndex(index);
                  },
                ),
              ),
            ),
          ),

          body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
        );
      },);
  }
}
