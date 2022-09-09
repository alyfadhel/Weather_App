import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/search_screen/pages/cubit/search_cubit.dart';
import 'package:weather_app/features/search_screen/widgets/myFormField.dart';
import 'package:weather_app/features/weather/presentation/pages/core/intl/bloc/cubit.dart';
import 'package:weather_app/features/weather/presentation/pages/core/intl/bloc/states.dart';
import 'package:weather_app/model/ForecastModel.dart';
import 'package:weather_app/model/WeatherModel.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

var initValue = 'cairo';
WeatherModel? weatherModel;

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherAppCubit, WeatherAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = WeatherAppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.teal[800],
          drawer: Drawer(
            width: 300.0,
            backgroundColor: Colors.teal[800],
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var form = SearchCubit
                      .get(context)
                      .name;
                  return Column(
                    children: [
                      MyFormField(
                        controller: SearchCubit
                            .get(context)
                            .searchController,
                        textInputType: TextInputType.text,
                        prefix: Icons.search,
                        radius: 10.0,
                        label: 'Search',
                        width: double.infinity,
                        onChanged: (value) {
                          SearchCubit.get(context).getSearch(value, context);
                        },
                      ),
                      Expanded(
                        child: ConditionalBuilder(
                          condition: state is! WeatherAppSearchLoadingState,
                          builder: (context) =>
                              ListView.separated(
                                itemBuilder: (context, index) =>
                                    getCountry(form, context),
                                separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20.0,
                                ),
                                itemCount: form.length,
                              ),
                          fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          appBar: AppBar(
            titleSpacing: 20.0,
            backgroundColor: Colors.teal[800],
          ),
          body: ConditionalBuilder(
            condition: cubit.weatherModel != null,
            builder: (context) =>
                RefreshIndicator(
                  onRefresh: () async {
                    cubit.getData(
                      initValue,
                    );
                  },
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        getTemp(cubit.weatherModel!, context),
                    itemCount: cubit.weatherModel!.weather.length,
                  ),
                ),
            fallback: (context) =>
            const Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }

  Widget getTemp(WeatherModel model, context) =>
      Container(
        alignment: AlignmentDirectional.center,
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 260.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Column(
                  children: [
                    Text(
                      '${model.sys!.country}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline3!
                          .copyWith(
                        color: Colors.white.withOpacity(.7),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      '${model.name}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        color: Colors.white.withOpacity(
                          .4,
                        ),
                        fontSize: 20.0,
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Feels Like : ${model.main!.feelsLike!.round() -
                                273.15.round()}',
                            style:
                            Theme
                                .of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                              color: Colors.white.withOpacity(
                                .4,
                              ),
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Text(
                          'O',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                            color: Colors.white.withOpacity(
                              .4,
                            ),
                            fontSize: 10.0,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Humidity : ${model.main!.humidity}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        color: Colors.white.withOpacity(
                          .4,
                        ),
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'Pressure  : ${model.main!.pressure}',
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                        color: Colors.white.withOpacity(
                          .4,
                        ),
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Temp Min : ${model.main!.tempMin!.round() -
                                    273.15.round()}',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  color: Colors.white.withOpacity(
                                    .4,
                                  ),
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Text(
                              'O',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                color: Colors.white.withOpacity(
                                  .4,
                                ),
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 30.0,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Temp Max : ${model.main!.tempMax!.round() -
                                    273.15.round()}',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                  color: Colors.white.withOpacity(
                                    .4,
                                  ),
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Text(
                              'O',
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                color: Colors.white.withOpacity(
                                  .4,
                                ),
                                fontSize: 10.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Deg : ${model.wind!.deg}',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                            color: Colors.white.withOpacity(
                              .4,
                            ),
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          'Speed : ${model.wind!.speed}',
                          style:
                          Theme
                              .of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                            color: Colors.white.withOpacity(
                              .4,
                            ),
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 220.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    '${model.main!.temp!.round() -
                                        273.15.round()}',
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                      color: Colors.white.withOpacity(.5),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                Text(
                                  'O',
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                      color: Colors.white.withOpacity(.5),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 220.0,
                          width: 150.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/sky2.gif'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 250.0,
                child: ConditionalBuilder(
                  condition: WeatherAppCubit
                      .get(context)
                      .forecastModel != null,
                  builder: (context) =>
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            getForecast(
                                context,
                                WeatherAppCubit
                                    .get(context)
                                    .forecastModel!
                                    .list![index],
                                WeatherAppCubit
                                    .get(context)
                                    .weatherModel!),
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          width: 15.0,
                        ),
                        itemCount: WeatherAppCubit
                            .get(context)
                            .forecastModel!
                            .list!
                            .length,
                      ),
                  fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/sunrise1.gif'),
                          ),
                        ),
                      ),
                      Text(
                        'Sunrise : ${DateTime.fromMillisecondsSinceEpoch(
                            model.sys!.sunrise! * 1000)}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                            color: Colors.white.withOpacity(.5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/moon.gif'),
                          ),
                        ),
                      ),
                      Text(
                        'Sunset : ${DateTime.fromMillisecondsSinceEpoch(
                            model.sys!.sunset! * 1000)}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                            color: Colors.white.withOpacity(.5),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget getForecast(context, ListModel listModel, WeatherModel model) {
    DateTime day = DateTime.parse(listModel.dtTxt!);
    String stringDay = DateFormat("EEEE").format(day);
    DateTime date = DateTime.parse(listModel.dtTxt!);
    String stringDate = DateFormat("h a").format(date);
    return Column(
      children: [
      Row(
        children: [
          const Expanded(
            child: Image(
                height: 80.0,
                width: 80.0,
                image: AssetImage('assets/images/sun.gif')),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  stringDate,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  stringDay,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  listModel.weather![0].description.toString(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  '${listModel.main!.tempMin.round() - 273.15.round()}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    color: Colors.white.withOpacity(
                      .4,
                    ),
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '/',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    color: Colors.white.withOpacity(
                      .4,
                    ),
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  '${listModel.main!.tempMax.round() - 273.15.round()}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    color: Colors.white.withOpacity(
                      .4,
                    ),
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
      ],
    );
  }

  Widget getCountry(model, context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          debugPrint('onTaaaaaaaaaaaaaap : $model');
          debugPrint(
              'onTaaaaaaaaaaaa: ${WeatherAppCubit
                  .get(context)
                  .weatherModel!
                  .main!
                  .temp!
                  .round() - 273.15.round()}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WeatherScreen(),
            ),
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (model != null)
              Expanded(
                child: Text(
                  '${model[0]['name']}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(
              width: 10.0,
            ),
            if (model[0]['country'] != null)
              Expanded(
                child: Text(
                  model[0]['country'],
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(
              width: 10.0,
            ),
            if (model[0]['state'] != null)
              Expanded(
                child: Text(
                  '${model[0]['state']}',
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
