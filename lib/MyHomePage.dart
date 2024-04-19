import 'package:air_control_app/ActivityScreen.dart';
import 'package:air_control_app/AirScreen.dart';
import 'package:air_control_app/SplashScreen.dart';
import 'package:air_control_app/WeatherScreen.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.weather, this.air});

  final Weather? weather;
  final AirQuality? air;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  var screens;

  @override
  void initState() {
    screens = [
      AirScreen(air: widget.air!),
      if (widget.weather != null) WeatherScreen(weather: widget.weather),
      const ActivityScreen()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.black45,
        backgroundColor: Colors.white,
        // iconSize: 30,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.air_outlined), label: 'Powietrze'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_outlined), label: 'Pogoda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_outlined), label: 'Aktywność')
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
