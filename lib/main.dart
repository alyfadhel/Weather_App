import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/on_boarding/presentation/pages/on_boarding.dart';
import 'package:weather_app/features/search_screen/pages/cubit/search_cubit.dart';
import 'package:weather_app/features/weather/presentation/pages/core/intl/bloc/cubit.dart';
import 'package:weather_app/features/weather/presentation/pages/core/intl/bloc/observer.dart';
import 'package:weather_app/features/weather/presentation/pages/core/intl/bloc/states.dart';
import 'package:weather_app/features/weather/presentation/pages/weather.dart';
import 'package:weather_app/shared/network/local/cache_helper.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';
import 'package:weather_app/shared/styles/themes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');

  Widget widget;

  if(onBoarding!= null)
  {
    widget =  const WeatherScreen();
  }else{
    widget = const OnBoardingScreen();
  }
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool? onBoarding;
  final Widget startWidget;
  const MyApp({
    Key? key,
    this.onBoarding,
    required this.startWidget,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => WeatherAppCubit()..getData(initValue)..getForecastData(),),
        BlocProvider(create: (context) => SearchCubit(),)
      ],
        child: BlocConsumer<WeatherAppCubit,WeatherAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: startWidget,
              theme: lightMode,
            );
          },
        ),
    );
  }
}

