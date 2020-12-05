import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const apiKey = '757478332eaac9b51ed885044f88aadd';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
  @override
  void initState() {
   
    super.initState();
    getLocationData();
    print('the line of code is trigared');
  }

  void getLocationData() async {

   
   var weatherData =  await WeatherModel().getLocationWeather();
   
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
