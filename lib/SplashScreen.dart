
import 'dart:convert';

import 'package:air_control_app/MyHomePage.dart';
import 'package:air_control_app/PermissionScreen.dart';
import 'package:air_control_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
 
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  

  @override
  Widget build(BuildContext context) {
    

    // new Future.delayed(
    //   const Duration(seconds: 2),
    //     () => {
    //       if(havePermission()){
    //       Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => PermissionScreen()))
    //       }
    //       else{
    //         //todo load data
    //         Navigator.push(context,
    //         MaterialPageRoute(builder: (context) => MyHomePage()))
    //       }

          
    // });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,        
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xffffffff),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color(0xFF00F7FF), Color.fromARGB(255, 52, 133, 255)]
              )
             ),

          ),
          Align(
            alignment: FractionalOffset.center,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('icons/cloud-sun.png')),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(Strings.appTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ) 
                ),),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text('Aplikacja do monitorowania \n czystości powietrza',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ) 
                ),),

              ],
            )

          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 35,
            
            child: Container(
            alignment: Alignment.center,
            child: Text('Przedmuchuje dane...',
            textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ) 
                ),),
          ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
@override
void initState(){
    super.initState();
    if(permissionDenied()){
      Navigator.push(
        context, MaterialPageRoute(builder: (context) => PermissionScreen()));
    }
    else{
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {

          executeOnceAfterBuild();

        });
    }
}

  bool permissionDenied() {
    return false;
  }
  
  void executeOnceAfterBuild() async {
      WeatherFactory wf = new WeatherFactory("e64cdba61068db9c85abd44df9db60e8", language: Language.POLISH);
      Weather w = await wf.currentWeatherByCityName("Kraków");
      print(w.toJson().toString());
     
     
    var lat = 49.969307;
    var lon = 20.430398;

    const token = '423a8eab34df9fdb9eaf0fb8da1071b06a2963c8';
    var keyword = 'geo:$lat;$lon';
    String _endpoint = 'https://api.waqi.info/feed/';
    String url = '$_endpoint/$keyword/?token=$token';
    

    http.Response response = await http.get(Uri.parse(url));

    print(response.body.toString());
     
     
      Map<String, dynamic> jsonBody = json.decode(response.body);
      AirQuality aq = new AirQuality(jsonBody);
     
      Navigator.push(context,
      MaterialPageRoute(builder: (context) => MyHomePage(weather: w)));
     



    
     }}

//49°58'09.5"N 20°25'49.7"E

class AirQuality{
bool isGood = false;
bool isBad = false;
String quality = '';
String advice = '';
int aqi = 0;
int pm25 = 0;
int pm10 = 0;
String station = '';

AirQuality(Map<String, dynamic> jsonBody){

aqi =  int.tryParse(jsonBody['data']['aqi'].toString())?? -1 ;
pm25 = int.tryParse(jsonBody['data']['iaqi']['pm25']['v'].toString())?? -1 ;
pm10 = int.tryParse(jsonBody['data']['iaqi']['pm10']['v'].toString())?? -1 ;
station = jsonBody['data']['city']['name'].toString();
setupLevel(aqi);



}

  void setupLevel(int aqi) {
    if( aqi <= 100){
      quality = 'Bardzo dobra';
      advice = 'Idź sprzed komputera i zaczerpnij powietrza';
    }else if(aqi <= 150){
      quality = 'Taka średnia';
      advice = 'Zostań przy komputerze jeśli możesz';
    }else{
      quality = 'Tragiczna!';
      advice = 'Zamknij okno nie wietrz swojego miasta!';
    }


  }
}
