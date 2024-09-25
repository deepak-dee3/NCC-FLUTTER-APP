import 'package:flutter/material.dart';
import 'package:ncc/ANO/ano_view_camp_events.dart';
import 'package:ncc/CADETS/cadet_up2.dart';
import 'package:ncc/CADETS/cadet_upload_achievements.dart';
import 'package:ncc/CADETS/cadet_view_achievements.dart';
import 'package:ncc/main.dart';
import 'package:page_transition/page_transition.dart';
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
         Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Home()),(route) => false,);
       return false;
      },
      child:Scaffold(
      body:
     /* Metaballs(
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
  child: */SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(child:Center(
          //padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),

        child:Column(children: [

         SizedBox(height: 60),

           Center(child:Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 3.0, 
   
            child:Lottie.asset('assets/animation/Animation - 1721310404627.json')),),),

           


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
          child:Padding(padding: EdgeInsets.only(top:30),
          child:Container(
            
            
            width:330,
            height: 100,
            decoration: BoxDecoration(
              //image: DecorationImage(image: NetworkImage('',),fit: BoxFit.cover,),
              boxShadow: [
              BoxShadow(color: Colors.white,spreadRadius: 2,blurRadius: 2)
            ],
              color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

             // Image.network('https://th.bing.com/th/id/OIP.CV6RfdJ6o-gx80x5ZV2dLQHaE8?w=265&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7',fit: BoxFit.fill,),
             
              Shimmer.fromColors(
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:
           Padding(padding: EdgeInsets.only(left: 20),child: Text('UPDATE PROFILE',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),),
           
            
            //Padding(padding: EdgeInsets.only(left:7 ),child:Icon(Icons.chevron_right,size: 30,color:Colors.blue)),
          ],)
         // Image.network("https://th.bing.com/th/id/OIP.CV6RfdJ6o-gx80x5ZV2dLQHaE8?w=265&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7",fit: BoxFit.contain,)
         

          )),),

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
          },
            child:Padding(padding: EdgeInsets.only(top:30),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black,spreadRadius: 2,blurRadius: 2)
            ],
              color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
            
              Shimmer.fromColors(
                          baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

           Padding(padding: EdgeInsets.only(left: 20),child: Text('UPLOAD ACHIEVEMENTS',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),),),
            
            
          //Padding(padding: EdgeInsets.only(left: 63),child:Icon(Icons.chevron_right,size: 30,color: Colors.blue,)),
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
);         },
          child:Padding(padding: EdgeInsets.only(top:30),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.black,spreadRadius: 2,blurRadius: 2)
            ],
              color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              
              Shimmer.fromColors(
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

           Padding(padding:EdgeInsets.only(left:20),child: Text('VIEW EVENTS',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),),
            
           
           // Padding(padding:EdgeInsets.only(left:11),child:Icon(Icons.chevron_right,size: 30,color:Colors.blue)),
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
          child:Padding(padding: EdgeInsets.only(top:30),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(
              boxShadow: [
              BoxShadow(color: Colors.black,spreadRadius: 2,blurRadius: 2)
            ],
              
              color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
            
              Shimmer.fromColors(
                           baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Padding(padding: EdgeInsets.only(left:20),child:Text('VIEW ACHIEVEMENTS',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),),
  
            
          // Padding(padding: EdgeInsets.only(left:4),child: Icon(Icons.chevron_right,size: 30,color:Colors.blue)),
          ],),)),),
         
          SizedBox(height: 30,),   
        ],)
      )
    ))
   ));
  }
}