part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class WeatherAppSearchLoadingState extends SearchState{}
class WeatherAppSearchSuccessState extends SearchState{}
class WeatherAppSearchErrorState extends SearchState{
  final String error;

  WeatherAppSearchErrorState(this.error);
}
