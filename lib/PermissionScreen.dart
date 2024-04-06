
import 'package:air_control_app/MyHomePage.dart';
import 'package:air_control_app/SplashScreen.dart';
import 'package:air_control_app/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class PermissionScreen extends StatefulWidget {
  
  @override
  State<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                Image(image: AssetImage('icons/hand-wave.png')),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text('Hej!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ) 
                ),),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text('Aplikacja ${Strings.appTitle} potrzebuje do działania\nprzybliżonej lokalizacji twojego urządzenia',
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
            margin:EdgeInsets.only(left: 10.0, right: 10.0),
            child: SizedBox(
              width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all(EdgeInsets.only(top:12.0,bottom:12.0)),
              ),
              onPressed: () async { 
                LocationPermission permission= await Geolocator.requestPermission();
                if(permission == LocationPermission.always ||
                  permission == LocationPermission.whileInUse){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => SplashScreen()));
                  }
               },
              child: Text(
                'Zgoda!',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
            ),
            ),
          ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
