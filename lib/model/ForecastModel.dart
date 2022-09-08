
class ForecastModel {
  String? cod;
  dynamic message;
  dynamic cnt;
  List<ListModel>? list;
  CityModel? city;

  ForecastModel({this.cod, this.message, this.cnt, this.list, this.city});

  ForecastModel.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <ListModel>[];
      json['list'].forEach((v) {
        list!.add(ListModel.fromJson(v));
      });
    }
    city = json['city'] != null ? CityModel.fromJson(json['city']) : null;
  }
}

class ListModel {
  dynamic dt;
  MainModel? main;
  List<WeatherDataModel>? weather;
  CloudsModel? clouds;
  WindModel? wind;
  dynamic visibility;
  dynamic pop;
  SysDataModel? sys;
  String? dtTxt;

  ListModel(
      {this.dt,
        this.main,
        this.weather,
        this.clouds,
        this.wind,
        this.visibility,
        this.pop,
        this.sys,
        this.dtTxt});

  ListModel.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = json['main'] != null ? MainModel.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      weather = <WeatherDataModel>[];
      json['weather'].forEach((v) {
        weather!.add(WeatherDataModel.fromJson(v));
      });
    }
    clouds =
    json['clouds'] != null ? CloudsModel.fromJson(json['clouds']) : null;
    wind = json['wind'] != null ? WindModel.fromJson(json['wind']) : null;
    visibility = json['visibility'];
    pop = json['pop'];
    sys = json['sys'] != null ? SysDataModel.fromJson(json['sys']) : null;
    dtTxt = json['dt_txt'];
  }

}

class MainModel {
  dynamic temp;
  dynamic feelsLike;
  dynamic tempMin;
  dynamic tempMax;
  dynamic pressure;
  dynamic seaLevel;
  dynamic grndLevel;
  dynamic humidity;
  dynamic tempKf;

  MainModel(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,
        this.pressure,
        this.seaLevel,
        this.grndLevel,
        this.humidity,
        this.tempKf});

  MainModel.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }
}

class WeatherDataModel {
  dynamic id;
  String? main;
  String? description;
  String? icon;

  WeatherDataModel({this.id, this.main, this.description, this.icon});

  WeatherDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }
}

class CloudsModel {
  dynamic all;

  CloudsModel({this.all});

  CloudsModel.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }
}

class WindModel {
  dynamic speed;
  dynamic deg;
  dynamic gust;

  WindModel({this.speed, this.deg, this.gust});

  WindModel.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }
}

class SysDataModel {
  String? pod;

  SysDataModel({this.pod});

  SysDataModel.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }
}

class CityModel {
  dynamic id;
  String? name;
  CoordModel? coord;
  String? country;
  dynamic population;
  dynamic timezone;
  dynamic sunrise;
  dynamic sunset;

  CityModel(
      {this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone,
        this.sunrise,
        this.sunset});

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? CoordModel.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }
}

class CoordModel {
  dynamic lat;
  dynamic lon;

  CoordModel({this.lat, this.lon});

  CoordModel.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }
}
