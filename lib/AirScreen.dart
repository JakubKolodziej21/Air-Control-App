
import 'package:air_control_app/MyHomePage.dart';
import 'package:air_control_app/PermissionScreen.dart';
import 'package:air_control_app/SplashScreen.dart';
import 'package:air_control_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AirScreen extends StatefulWidget {
 
  AirScreen({required this.air});

final AirQuality air;

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
              gradient: getGradientByMood(widget.air)
              
             ),

          ),
          Align(
            alignment: FractionalOffset.center,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Text("Jakość Powietrza",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    height: 1.2,
                    color: getBackgroundTextColor(widget.air),
                    fontWeight: FontWeight.w300,
                  )
                ),),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  Text(widget.air.quality,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    height: 1.2,
                    color: getBackgroundTextColor(widget.air),
                    fontWeight: FontWeight.w700,
                  )
                ),),
                Padding(padding: EdgeInsets.only(top: 24.0)),
                CircleAvatar(
                  radius: 91.0,
                  backgroundColor: Colors.white,
                  child: Center(  
                    child: Container(
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (widget.air.aqi /200 * 100).floor().toString(),
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 64.0,
                    height: 1.2,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  )
                ),),
                        Text("CAQI ⓘ",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    height: 1.2,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  )
                ),),

                          

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
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('PM 2,5',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    height: 1.2,
                    color:getBackgroundTextColor(widget.air),
                    fontWeight: FontWeight.w300,
                  )
                ),),
                            Padding(padding: EdgeInsets.only(top : 2.0)),
                            Text( widget.air.pm25.toString() +'%',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    height: 1.2,
                    color: getBackgroundTextColor(widget.air),
                    fontWeight: FontWeight.w700,
                  )
                ),)
                          ],

                        ),
                      ),
                      VerticalDivider(
                        width: 24,
                        thickness: 1,
                        color:getBackgroundTextColor(widget.air),
                      ),

                      Container(
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('PM 10',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 14.0,
                              height: 1.2,
                              color: getBackgroundTextColor(widget.air),
                              fontWeight: FontWeight.w300,
                            )
                          ),),
                            Padding(padding: EdgeInsets.only(top : 2.0)),
                            Text(widget.air.pm10.toString() +'%',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 22.0,
                    height: 1.2,
                    color:getBackgroundTextColor(widget.air),
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
                  Text("Stacja pomiarowa:",
                  
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 12.0,
                    height: 1.2,
                    color: getBackgroundTextColor(widget.air),
                    fontWeight: FontWeight.w300,
                  )
                ),),
                  Padding(padding: EdgeInsets.only(top: 8.0),),

                  Text(widget.air.station.toString(),
                  
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 14.0,
                    height: 1.2,
                    color:getBackgroundTextColor(widget.air),
                    fontWeight: FontWeight.w400,
                  )
                ),),

                  Padding(padding: EdgeInsets.only(top: 76.0),),

                 


                
              ],
            )

          ),
          Positioned(
            top: 0,
            left: 8,
            right: 0,
            bottom: (76.0)*2,
            
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
                heightFactor: 1-widget.air.aqi/200.floor(),
                child: Image.asset('icons/danger-value.png', color: Color.fromARGB(207, 120, 148, 143),scale: 0.9,),
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
              child: Divider(color:getBackgroundTextColor(widget.air),
              height: 10,
              thickness: 1.0,)),

          Padding(padding: EdgeInsets.only(
                   bottom: 24,right: 10, left: 10),
             
             child:  ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                  color: Colors.white,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    height: 38.0,
                    child: IntrinsicHeight(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(alignment: Alignment.centerLeft,
                       image: getAdviceImage(widget.air), ),
                        Padding(padding: EdgeInsets.only(left: 8.0) ),
                        
                        Text(widget.air.advice),

                         ],),)

                    ),
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
  
  LinearGradient getGradientByMood(AirQuality air) {

    if (air.isGood) {
      return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
           Color.fromARGB(255, 92, 175, 81),
            Color.fromARGB(255, 48, 216, 25),
            Color.fromARGB(255, 50, 155, 24)
          ]);
    } 
    
  else if(air.isBad) {
       return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
           Color.fromARGB(255, 169, 175, 81),
            Color.fromARGB(255, 181, 216, 25),
            Color.fromARGB(255, 238, 255, 0)
          ]);
    }

    else {
       return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
           Color.fromARGB(255, 175, 103, 81),
            Color.fromARGB(255, 216, 38, 25),
            Color.fromARGB(255, 255, 0, 0)
          ]);
    };
  }
  
  Color getBackgroundTextColor(AirQuality air) {
    
    if(air.isGood || air.isBad){
      return Colors.black;
    }else{
      return Colors.white;
    }


  }
  
  getAdviceImage(AirQuality air) {

    if(air.isGood){
  return AssetImage('icons/happy.png');
}else if(air.isBad){
  return AssetImage('icons/sad.png');
}else{
  return AssetImage('icons/ok.png');
}
  }
}
