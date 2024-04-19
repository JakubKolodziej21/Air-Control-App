import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class ActivityScreen extends StatefulWidget {
 
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
        fit: StackFit.expand,        
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Color.fromARGB(255, 255, 251, 0), Color.fromARGB(255, 255, 218, 52)]
              )
             ),

          ),
          Align(
            alignment: FractionalOffset.center,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage('icons/bored.png')),
                const Padding(padding: EdgeInsets.only(top: 15.0)),
                Text('Budzimy się!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ) 
                ),),
                const Padding(padding: EdgeInsets.only(top: 5.0)),
                Text('Aplikacja losuje aktywność, którą możesz wykonać w wolnym czasie!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ) 
                ),),

              ],
            )

          ),

          ]),




    );
    }
      

@override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }


  
}
