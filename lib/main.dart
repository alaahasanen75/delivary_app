import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/componant/constant.dart';
import 'package:flutter_application_1/core/network/bloc_observe.dart';
import 'package:flutter_application_1/core/network/dio_factory.dart';
import 'package:flutter_application_1/core/shard.dart';
import 'package:flutter_application_1/model_view/app_cubit.dart';
import 'package:flutter_application_1/model_view/app_states.dart';
import 'package:flutter_application_1/presentation/Layout_screen.dart';

import 'package:flutter_application_1/presentation/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = const SimpleBlocObserver();
  await CachHelper.init();
  print('${CachHelper.getListOfString(key: 'get-history-List')}');

  Widget widget;
  token = CachHelper.getData(
    key: 'token',
  );

  if (token != null) {
    widget = const MainScreen();
  } else {
    widget = const SplashScreen();
  }

  runApp(MyApp(
    startewidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startewidget;
  const MyApp({super.key, required this.startewidget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: ((context) => AppCubit()
          ..GetPopular()
          ..getCartData()),
        child: BlocConsumer<AppCubit, CubitState>(
          builder: (context, state) {
            return ScreenUtilInit(
                designSize: const Size(360, 690),
                minTextAdapt: true,
                splitScreenMode: true,
                builder: (_, child) {
                  return const MaterialApp(
                      debugShowCheckedModeBanner: false, home: SplashScreen());
                });
          },
          listener: (context, state) {},
        ));
  }
}
