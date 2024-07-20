import 'package:flutter/material.dart';
import 'package:ncc/ANO/ano_view_camp_events.dart';
import 'package:ncc/CADETS/cadet_up2.dart';
import 'package:ncc/CADETS/cadet_upload_achievements.dart';
import 'package:ncc/CADETS/cadet_view_achievements.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:metaballs/metaballs.dart';


class cadet_main_page extends StatefulWidget{
  @override
  State<cadet_main_page> createState() => _cadet_main_pageState();
}

class _cadet_main_pageState extends State<cadet_main_page> {
  
  

 
  @override
  Widget build(BuildContext context) {
   
   return
    WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:Scaffold(
      body:
      Metaballs(
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
  child: SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),

        child:Column(children: [

         SizedBox(height: MediaQuery.of(context).size.height * 0.07),

           Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 3.0, 
   
            child:Lottie.asset('assets/animation/Animation - 1721310404627.json')),),

            SizedBox(height: 20,),


         GestureDetector(onTap:(){

          Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => cadet_up2(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),);
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
             
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:
            Text('    PROFILE UPDATION',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
           
            SizedBox(width: 100,),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),


          
          

          GestureDetector(onTap:(){
            Navigator.push(context,PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => cadet_upload_achievements(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
);

           // Navigator.push(context,MaterialPageRoute(builder: (context) => cadet_upload_achievements()));
          },
            child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
            
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    UPLOAD ACHIEVEMENTS',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),),
            
            SizedBox(width: 60,),
            Icon(Icons.arrow_circle_right_outlined,color: Colors.blue,)
          ],),)),),

           GestureDetector(onTap:(){
            Navigator.push(context,PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => ano_camp_view_details(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
);

         // Navigator.push(context, MaterialPageRoute(builder: (context) => ano_camp_view_details()));
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    VIEW EVENTS',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
            
            SizedBox(width: 145,),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),


         

          GestureDetector(onTap:(){

           Navigator.push(context, PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => cadet_view_achievements(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
);

            //Navigator.push(context, MaterialPageRoute(builder: (context) => cadet_view_achievements()));
           
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(
              
              color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
            
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    VIEW ACHIEVEMENTS',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
  
            SizedBox(width: 85,),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),
         
          SizedBox(height: 30,),   
        ],)
      )
    ))
   ));
  }
}