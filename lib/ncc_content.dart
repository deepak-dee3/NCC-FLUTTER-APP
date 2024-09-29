import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metaballs/metaballs.dart';
import 'package:shimmer/shimmer.dart';

class contents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,

      body:/*Metaballs(
  color: const Color.fromARGB(255, 66, 133, 244),
  effect: MetaballsEffect.follow(
    growthFactor: 1,
    smoothing: 1,
    radius: 0.5,
  ),
  gradient: LinearGradient(
    colors: [
      const Color.fromARGB(255, 90, 60, 255),
      const Color.fromARGB(255, 120, 255, 255),
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft
  ),
  metaballs: 40,
  animationDuration: const Duration(milliseconds: 200),
  speedMultiplier: 1,
  bounceStiffness: 3,
  minBallRadius: 15,
  maxBallRadius: 40,
  glowRadius: 0.7,
  glowIntensity: 0.6,
  child: */Container(
          child: Padding(padding: EdgeInsets.all(25),child:Column(
            

            children: [

              SizedBox(height: screenHeight*0.056),

                

              Expanded(flex:2,
                child:   Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: Colors.black.withOpacity(0.5),
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2), // This makes the shimmer effect visible around the image
              ),
            ),
          ),
          Image(
            image: AssetImage('assets/three_head-removebg-preview.png'),
            width: 140,
            height: 140,
          ),
        ],
      ),
    ),),

              Expanded(flex: 1,
                child:Align(alignment: Alignment.centerLeft,child: Container(
                  child: Text('NCC :',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w900,color: Color.fromARGB(255, 229, 7, 18)),),
                )
                
                  ),),

              Expanded(flex:4,
                child: Container(
                child:Text('The National Cadet Corps (NCC) is the youth wing of the Indian Armed Forces with its headquarters in New Delhi, India. It is open to school and college students on voluntary basis as a Tri-Services Organisation, comprising the Army, the Navy and the Air Force. Cadets are given basic military training in small arms and drill.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              )),

               Expanded(flex: 1,
                child:Align(alignment: Alignment.centerLeft,child: Container(
                  child: Text('AIM & MOTTO :',style: TextStyle(color:Color.fromARGB(255, 229, 7, 18),fontSize: 18,fontWeight: FontWeight.w900),),
                )
                
                  ),),

              Expanded(flex:4,
                child: Container(
                child:Text('"Unity and discipline" as the motto for the NCC. In living up to its motto, the NCC strives to be and is one of the greatest cohesive forces of the nation, bringing together the youth hailing from different parts of the country and molding them into united and disciplined citizens of the nation".',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              )),


              
            ],
          ),
        ),
      ));
    
  }

}

