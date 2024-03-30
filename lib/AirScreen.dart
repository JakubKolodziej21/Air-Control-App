
import 'package:air_control_app/MyHomePage.dart';
import 'package:air_control_app/PermissionScreen.dart';
import 'package:air_control_app/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AirScreen extends StatefulWidget {
 
  @override
  State<AirScreen> createState() => _AirScreenState();
}

class _AirScreenState extends State<AirScreen> {
  

  

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
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [ Color.fromARGB(255, 142, 192, 164),Color.fromARGB(255, 120, 148, 143)]
              )
             ),

          ),
          Align(
            alignment: FractionalOffset.center,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('icons/cloud-sun.png'),
                color: Colors.black),
                Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(Strings.appTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 42.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ) 
                ),),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Text('Powietrze',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
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
                    color: Colors.black,
                  ) 
                ),),
          ))
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  bool havePermission() {
    return true;
  }
}
