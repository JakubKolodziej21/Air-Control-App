
import 'package:air_control_app/MyHomePage.dart';
import 'package:air_control_app/PermissionScreen.dart';
import 'package:air_control_app/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherScreen extends StatefulWidget {
 
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  

  

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,        
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: new Color(0xffffffff),
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  new Color(0xff6E6CD8),
                  new Color(0xff40A0EF),
                  new Color(0xff77E1EE),
                ]

       


              )
             ),

          ),
          Align(
            alignment: FractionalOffset.center,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 45.0)),
                Image(
                  image: AssetImage('icons/weather-sunny.png')
                  ),
                Padding(padding: EdgeInsets.only(top: 41.0)),
                Text('Niedziela 31.03, 11:00 słonecznie',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  )
                ),),
                Padding(padding: EdgeInsets.only(top: 12.0)),
                Text('14°C',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 64.0,
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )
                ),),
                Text('Odczuwalna 13°C',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )
                ),),
                 Padding(padding: EdgeInsets.only(top : 25.0)),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Ciśnienie',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )
                ),),
                            Padding(padding: EdgeInsets.only(top : 2.0)),
                            Text('1020 hPa',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 26.0,
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )
                ),)
                          ],

                        ),
                      ),
                      VerticalDivider(
                        width: 48,
                        thickness: 1,
                        color: Colors.white,
                      ),

                      Container(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Wiatr',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 22.0,
                              height: 1.2,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            )
                          ),),
                            Padding(padding: EdgeInsets.only(top : 2.0)),
                            Text('16 km/h',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 26.0,
                    height: 1.2,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  )
                ),)
                          ],

                        ),
                      ),

                    ],
                  ),
                  ),
                    Padding(padding: EdgeInsets.only(top : 24.0)),
                    Text('Opady: 0,1 mm/12h',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 14.0,
                              height: 1.2,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )
                          ),),
                    Padding(padding: EdgeInsets.only(top : 68.0)),


              ],
            )

          ),
          
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
}
