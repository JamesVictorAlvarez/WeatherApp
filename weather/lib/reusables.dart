import 'package:flutter/material.dart';

class ReusableExpandedDays extends StatelessWidget {
  final String textTime;
  final String textWindSpeed;
  final String textTemp;

  ReusableExpandedDays(
      {required this.textTime, required this.textWindSpeed, required this.textTemp});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
      child: Column(
        children: <Widget>[
          Text(
            textTime,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                'Windspeed-',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              Text(
                '$textWindSpeed',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Temp-',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
              Text(
                '$textTemp°',
                style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}