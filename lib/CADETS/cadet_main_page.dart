import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncc/ANO/ano_view_camp_events.dart';
import 'package:ncc/CADETS/cadet_update_profile.dart';
import 'package:ncc/CADETS/cadet_upload_achievements.dart';
import 'package:ncc/CADETS/cadet_view_achievements.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';


class cadet_main_page extends StatefulWidget{
  @override
  State<cadet_main_page> createState() => _cadet_main_pageState();
}

class _cadet_main_pageState extends State<cadet_main_page> {
   bool _showShimmer = true;
  int _shimmerCount = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        _shimmerCount++;
        if (_shimmerCount >= 2) {
          _showShimmer = false;
          timer.cancel();
        }
      });
    });
  }

 
  @override
  Widget build(BuildContext context) {
   
   return
    WillPopScope(
      onWillPop: () async{
         Navigator.pop(context);
         return false;
        
      },
      child:Scaffold(
      body:SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(
        child:Column(children: [

          SizedBox(height: 70,),
         GestureDetector(onTap:(){

          Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => upadte_profile(),
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
              _showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:
            Text('    PROFILE UPDATION                   ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),)
            :Text('    PROFILE UPDATION                   ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
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
              _showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    VIEW EVENTS                             ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),)
            :Text('    VIEW EVENTS                             ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
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
              _showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    UPLOAD ACHIEVEMENTS         ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),)
            : Text('    UPLOAD ACHIEVEMENTS         ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color: Colors.blue,)
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
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              _showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    VIEW ACHIEVEMENTS              ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),)
            :Text('    VIEW ACHIEVEMENTS              ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),
         
          Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
              _showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    REPORT / ANY HELP?                ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),)
            :Text('    REPORT / ANY HELP?                ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),     
        ],)
      )
    ))
   );
  }
}