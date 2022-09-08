
class WeatherModel {
  List<Weather> weather = [];
  WeatherModel.fromJson(Map<String,dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
  }
  Coord? coord;
  String? base;
  Main? main;
  dynamic visibility;
  Wind? wind;
  Clouds? clouds;
  dynamic dt;
  Sys? sys;
  dynamic timezone;
  dynamic id;
  String? name;
  dynamic cod;
}

class Sys {
  Sys.fromJson(Map<String,dynamic> json) {
    type = json['type'];
    id = json['id'];
    country = json['country'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
  dynamic type;
  dynamic id;
  dynamic country;
  dynamic sunrise;
  dynamic sunset;
}

class Clouds {
  Clouds.fromJson(Map<String,dynamic> json) {
    all = json['all'];
  }
  dynamic all;
}

class Wind {
  Wind.fromJson(Map<String,dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
  }
  dynamic speed;
  dynamic deg;
}

class Main {
  Main.fromJson(Map<String,dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    humidity = json['humidity'];
  }
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  dynamic pressure;
  dynamic humidity;
}

class Weather {
  Weather.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
  dynamic id;
  dynamic main;
  dynamic description;
  dynamic icon;
}

class Coord {
  Coord.fromJson(dynamic json) {
    lon = json['lon'];
    lat = json['lat'];
  }
  dynamic lon;
  dynamic lat;
}