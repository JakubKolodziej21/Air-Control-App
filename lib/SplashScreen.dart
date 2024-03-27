
import 'package:air_control_app/PermissionScreen.dart';
import 'package:air_control_app/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
 
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  

  

  @override
  Widget build(BuildContext context) {
    

    new Future.delayed(
      const Duration(seconds: 2),
        () => {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => PermissionScreen())
    )});

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
}
