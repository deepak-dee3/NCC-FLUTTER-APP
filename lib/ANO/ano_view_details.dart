import 'package:flutter/material.dart';
import 'package:ncc/ANO/ano_view_camp_events.dart';
import 'package:ncc/ANO/cadets_all_details.dart.dart';
import 'package:ncc/ANO/cadets_list.dart';
import 'package:ncc/ANO/upload_campss.dart';
import 'package:ncc/CADETS/cadet_view_achievements.dart';
import 'package:ncc/main.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:metaballs/metaballs.dart';


class ano_view_details extends StatefulWidget
{
  @override
  State<ano_view_details> createState() => _ano_view_detailsState();
}

class _ano_view_detailsState extends State<ano_view_details> {

  @override
  Widget build(BuildContext context) {
    
    return 
WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context,MaterialPageRoute(builder: (context) => Home()));
        return true;
      },
      child:Scaffold(

      body:/*Metaballs(
      color: Color.fromARGB(255, 35, 3, 63),
  effect: MetaballsEffect.follow(
    growthFactor: 1,
    smoothing: 1,
    radius: 0.5,
  ),
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 53, 29, 192).withOpacity(0.3),
      Color.fromARGB(255, 51, 21, 126).withAlpha(2),
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
  child:*/ SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(
        child:Column(children: [

          SizedBox(height: 70,),
           Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 3.0, 
   
            child:Lottie.asset('assets/animation/Animation - 1721312169152.json')),),


           
         GestureDetector(onTap:(){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => ccadet_details()));
           Navigator.push(context, PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => ccadet_details(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
);

         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
              
              Shimmer.fromColors(
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    CADET\'S DETAILS',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
            SizedBox(width: 120,),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
        ],),)),),

          

          GestureDetector(onTap:(){
          Navigator.push(context,PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => upload_camp_detailss(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
);          },
            child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              
              Shimmer.fromColors(
               
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    UPLOAD CAMP / EVENTS',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),),
            SizedBox(width: 60 ,),
            Icon(Icons.arrow_circle_right_outlined,color: Colors.blue,)
          ],),)),),

          GestureDetector(onTap:(){
             Navigator.push(context, PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => ano_camp_view_details(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
);
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

              
              Shimmer.fromColors(
                          baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    VIEW CAMP / EVENTS',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
            SizedBox(width: 85,),
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
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
             
              Shimmer.fromColors(
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    VIEW ACHIEVEMENTS',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
            SizedBox(width: 90,),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),
      
           SizedBox(height: 30,)
          
        ],)
      )   )));
  }
}