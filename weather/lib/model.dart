class Weather {
  final String? timezone;
  final CurrentWeather? currentWeather;
  final Hourly? hourly;

  Weather({this.timezone, this.currentWeather, this.hourly});

  factory Weather.fromJson(Map<String, dynamic> json) {
    final timezone = json['timezone'];
    final currentWeatherJson = json['current_weather'];
    final hourlyJson = json['hourly'];

    final currentWeather = CurrentWeather.fromJson(currentWeatherJson);
    final hourly = Hourly.fromJson(hourlyJson);
    return Weather(
        timezone: timezone, currentWeather: currentWeather, hourly: hourly);
  }
}

class CurrentWeather {
  final double? temperature;
  final double? windspeed;
  final String? time;

  CurrentWeather({this.temperature, this.windspeed, this.time});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    final temperature = json['temperature'];
    final windspeed = json['windspeed'];
    final time = json['time'];
    return CurrentWeather(temperature: temperature, windspeed: windspeed, time: time);
  }
}

class Hourly {
  final List<dynamic>? time;
  final List<dynamic>? temperature_2m;
  final List<dynamic>? relativehumidity_2m;
  final List<dynamic>? windspeed_10m;

  Hourly(
      {this.time, this.temperature_2m, this.relativehumidity_2m, this.windspeed_10m});

  factory Hourly.fromJson(Map<String, dynamic> json) {
    final time = json['time'];
    final temperature_2m = json['temperature_2m'];
    final relativehumidity_2m = json['relativehumidity_2m'];
    final windspeed_10m = json['windspeed_10m'];

    return Hourly(
        time: time,
        temperature_2m: temperature_2m,
        relativehumidity_2m: relativehumidity_2m,
        windspeed_10m: windspeed_10m);
  }
}
