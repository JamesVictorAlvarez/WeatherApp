import 'package:flutter/material.dart';
import 'data_service.dart';
import 'model.dart';
import 'reusables.dart';
import 'package:intl/intl.dart';

// import 'package:weather_ui/components/constants.dart';
// import 'package:weather_ui/components/Reusables.dart';
// import 'package:weather_ui/services/location.dart';
// import 'package:darksky_weather/darksky_weather_io.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff303644),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: WeatherScreen(),
      ),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final _dataService = DataService();
  Weather? _response;
  String now = DateFormat.yMMMMd('en_US').format(DateTime.now());

  void _load() async {
    final response = await _dataService.getWeather();
    setState(() => _response = response);
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: ListTile(
                    title: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              'Laval',
                              style: TextStyle(
                                fontSize: 50.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Center(
                      child: Text(
                        '$now',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.cloud_outlined,
                  color: Colors.black,
                  size: 80,
                ),
                Text(
                  '${_response!.currentWeather!.temperature}°',
                  style: TextStyle(
                    fontSize: 100.0,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Container(
            height: 200.0,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 50.0),
              scrollDirection: Axis.horizontal,
              itemCount: _response!.hourly!.time!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Hero(
                    tag: 'detail_food$index',
                    child: ReusableExpandedDays(
                      textTemp: '${_response!.hourly!.temperature_2m![index]}',
                      textWindSpeed:
                          '${_response!.hourly!.windspeed_10m![index]}',
                      textTime:
                          '${DateFormat.jm().format(DateTime.parse(_response!.hourly!.time![index]))}',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
