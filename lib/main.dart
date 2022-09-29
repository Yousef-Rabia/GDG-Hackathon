import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg/layout/cubit/cubit.dart';
import 'package:gdg/shared/network/local/cache_helper.dart';
import 'package:gdg/shared/styles/themes.dart';

import 'layout/layout.dart';
import 'main_cubit/cubit.dart';
import 'main_cubit/states.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();


  bool? IsDark= false  ;
  if(CacheHelper.getData('isDark')!=null) {
    IsDark= CacheHelper.getData('isDark');
  }



  runApp(MyApp(IsDark!));
}

class MyApp extends StatelessWidget {
  late final bool IsDark;

  MyApp(this.IsDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) =>MainCubit()..toggleMode(fromShared: IsDark),),
        BlocProvider(create: (BuildContext context) =>AppCubit()),
      ],
      child: BlocConsumer<MainCubit,MainStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme:darkTheme,
            themeMode:MainCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: Layout(),
          );
        },
      ),

    );
  }
}

