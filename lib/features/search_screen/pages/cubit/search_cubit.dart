import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/weather/presentation/pages/core/intl/bloc/cubit.dart';
import 'package:weather_app/features/weather/presentation/pages/weather.dart';
import 'package:weather_app/shared/network/remote/dio_helper.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static SearchCubit get(context)=> BlocProvider.of(context);

  final searchController = TextEditingController();

  List<dynamic> name = [];
  getSearch(dynamic value,context) {
    emit(WeatherAppSearchLoadingState());
    DioHelper.getData(
        url: 'geo/1.0/direct',
        query: {
          'q': value,
          'appid': '6854d6f800772d72b17a14497ee60f3b',
        }).then((value) {
      name = value.data;
      WeatherAppCubit.get(context).getData(name[0]['name']);
      debugPrint(name[0]['name']);
      debugPrint(weatherModel!.main!.temp!.toString());
      emit(WeatherAppSearchSuccessState());
    }).catchError((error) {
      emit(WeatherAppSearchErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }
}
