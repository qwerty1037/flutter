import 'package:flutter/material.dart';
import 'package:flutter_study_weatherapp/data/my_location.dart';
import 'package:flutter_study_weatherapp/data/network.dart';
import 'package:flutter_study_weatherapp/screens/weather_screen.dart';

const apikey = 'b7dc7768f98b6ef9c03e3135527ca0b5';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double latitude3 = 0;
  double longitude3 = 0;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apikey'));
    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WeatherScreen(),
        ));
  }

  // Future<void> fetchData() async {

  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //     var wind = parsingData['wind']['speed'];
  //     print(wind);
  //     var id = parsingData['id'];
  //     print(id);
  //   } else {
  //     print('error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue)),
          child: Text(
            'Get my location',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            getLocation();
          },
        ),
      ),
    );
  }
}
