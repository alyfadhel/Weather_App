import 'package:flutter/material.dart';
import 'package:weather_app/features/on_boarding/presentation/widgets/my_button.dart';
import 'package:weather_app/features/weather/presentation/pages/weather.dart';
import 'package:weather_app/shared/network/local/cache_helper.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:  [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              margin: const EdgeInsets.only(right: 20.0,top: 10.0),
              child: MyButton(
                width: 60,
                height: 100.0,
                background: Colors.grey[350],
                radius: 10.0,
                onPressed: ()
                {
                  CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
                  {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeatherScreen(),
                      ),
                    );
                  });
                },
                text: 'Skip',
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/pic2.png',
                        ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
               Text(
                  'Weather \n Application',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Colors.teal[900],
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
               const Text(
                'Get to know your weather maps \n and adar perception forecast',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: MyButton(
                  width: 350.0,
                    radius: 10.0,
                    background: Colors.teal[800],
                    onPressed: ()
                    {
                      CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
                      {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  const WeatherScreen(),
                          ),
                        );
                      });
                    },
                    text: 'Get Started',
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
