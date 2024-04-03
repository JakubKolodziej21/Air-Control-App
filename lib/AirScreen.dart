
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
                  Text("Jakość Powietrza",),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text("Bardzo dobra",),
                Padding(padding: EdgeInsets.only(top: 24.0)),
                CircleAvatar(
                  radius: 91.0,
                  child: Center(  
                    child: Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("23",
                        textAlign: TextAlign.center,),
                        Text("CAQI ⓘ",
                        textAlign: TextAlign.center,),

                          

                      ],),
                    ),
                  )
                ),
                        Padding(padding: EdgeInsets.only(top: 28.0)),

                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('PM 2,5',
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
                            Text('20%',
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
                            Text('PM 10',
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
                            Text('12%',
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
                   Padding(padding: EdgeInsets.only(top: 20.0),),
                  Text("Stacja pomiarowa:"),
                  Padding(padding: EdgeInsets.only(top: 8.0),),

                  Text("Bochnia"),
                 


                
              ],
            )

          ),
          Positioned(
            top: 0,
            left: 8,
            right: 0,
            bottom: 0,
            
            child: Container(
            alignment: Alignment.centerLeft,
            child: Stack(children: [
              ClipRect(
                child: Align(
                alignment: Alignment.topLeft,
                heightFactor: 1,
                child: Image.asset('icons/danger-value-negative.png', scale: 0.9,),
              ),),
              ClipRect(
                child: Align(
                alignment: Alignment.topLeft,
                heightFactor: 1-0.4,
                child: Image.asset('icons/danger-value.png', scale: 0.9,),
              ),)
            ],),
          )),
          Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(
                  top: 62.0, right: 10, bottom: 14, left: 10),
              child: Divider(color: Colors.black,
              height: 10,
              thickness: 1.0,)),

          Padding(padding: EdgeInsets.only(
                   bottom: 24,right: 10, left: 10),
             
             child:  ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: Colors.white,
                  child: Text('Testowa wiadomość'),
                ),
              )
               ),
              
              

      ],
          ),
          
          ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  bool havePermission() {
    return true;
  }
}
