import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({super.key, this.weather});

  final Weather? weather;
  DateTime now = DateTime.now();

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  bool _isCelsius = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              gradient: getGradientByMood(widget.weather),
            ),
          ),
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(top: 45.0)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isCelsius = !_isCelsius;
                    });
                  },
                  child: Image(
                    image: AssetImage(
                        'icons/${getIconByMood(widget.weather!)}.png'),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 41.0)),
                Text(
                  "${DateFormat.MMMMEEEEd('pl').format(DateTime.now())}, ${widget.weather?.areaName}\n${widget.weather?.weatherDescription}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 14.0,
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 12.0)),
                Text(
                  '${_isCelsius ? widget.weather!.temperature?.celsius?.floor() : widget.weather!.temperature?.fahrenheit?.floor()}${_isCelsius ? "°C" : "°F"}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 64.0,
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  'Odczuwalna ${_isCelsius ? widget.weather?.tempFeelsLike?.celsius?.floor() : widget.weather?.tempFeelsLike?.fahrenheit?.floor()}°${_isCelsius ? "C" : "F"}',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 14.0,
                      height: 1.2,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 25.0)),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Ciśnienie',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 22.0,
                                  height: 1.2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 2.0)),
                            Text(
                              '${widget.weather!.pressure!.floor()} hPa',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 26.0,
                                  height: 1.2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const VerticalDivider(
                        width: 48,
                        thickness: 1,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Wiatr',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 22.0,
                                  height: 1.2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 2.0)),
                            Text(
                              '${_isCelsius ? widget.weather?.windSpeed?.floor() : (widget.weather?.windSpeed != null ? (widget.weather!.windSpeed!.floor() / 2.237).toStringAsFixed(2) : "Wystąpił błąd")}${_isCelsius ? " m/s" : " mph"}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                  fontSize: 26.0,
                                  height: 1.2,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 24.0)),
                if (widget.weather?.rainLastHour != null)
                  Text(
                    'Opady: ${widget.weather?.rainLastHour} mm/1h',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                        fontSize: 14.0,
                        height: 1.2,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                const Padding(padding: EdgeInsets.only(top: 68.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getIconByMood(Weather weather) {
    var main = weather.weatherMain;
    if (main == 'Clouds' || main == 'Drizzle' || main == "Snow") {
      return 'weather-rain';
    } else if (main == 'Thunderstorm') {
      return 'weather-lightning';
    } else if (isNight(weather)) {
      return 'weather-moonny';
    } else {
      return 'weather-sunny';
    }
  }

  bool isNight(Weather weather) {
    DateTime sunset = weather.sunset ?? DateTime.now();
    DateTime sunrise = weather.sunrise ?? DateTime.now();
    return DateTime.now().isAfter(sunset) || DateTime.now().isBefore(sunrise);
  }

  LinearGradient getGradientByMood(Weather? weather) {
    var main = weather?.weatherMain;
    if (main == 'Clouds' ||
        main == 'Drizzle' ||
        main == "Snow" && isNight(weather!)) {
      return const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 60, 59, 119),
            Color.fromARGB(255, 35, 89, 133),
            Color.fromARGB(255, 31, 56, 59)
          ]);
    } else if (main == 'Clouds' || main == 'Drizzle' || main == "Snow") {
      return const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0xff6E6CD8), Color(0xff40A0EF), Color(0xff77E1EE)]);
    } else if (main == 'Thunderstorm' || isNight(weather!)) {
      return const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xff313545), Color(0xff121118)]);
    } else {
      return const LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [Color(0xff5283F0), Color(0xffCDEDD4)]);
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }
}
