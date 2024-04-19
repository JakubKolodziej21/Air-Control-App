import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ActivityScreen extends StatefulWidget {
  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  Future<Map<String, dynamic>> fetchActivity() async {
    final response = await http.get(Uri.parse('http://www.boredapi.com/api/activity/'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load activity');
    }
  }

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage('icons/bored.png')),
                const Padding(padding: EdgeInsets.only(top: 15.0)),
                Text(
                  'Budzimy się!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 5.0)),
                Text(
                  'Aplikacja losuje aktywność,\n którą możesz wykonać w wolnym czasie!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 30.0)),

                FutureBuilder<Map<String, dynamic>>(
                  future: fetchActivity(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(color: Colors.blueAccent,);
                    } else if (snapshot.hasError) {
                      return Text('Wystąpił błąd: ${snapshot.error}');
                    } else {
                      final activityData = snapshot.data!;
                      return Column(
                        children: [
                          Text(activityData["activity"],textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),),
                          
                        ],
                      );
                    }
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 40.0)),
                ElevatedButton(
                  style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all(const EdgeInsets.only(top:12.0,bottom:12.0,left: 25.0,right: 25.0)),
              ),
                  
                    onPressed: () {
                      setState(() {});
                    },
                    child: Text('Losuj aktywność', style: TextStyle(fontSize: 16.0, color: Colors.black54),)
                    ,
                  ),



              ],
            ),
          ),
        ],
      ),
    );
  }
}
