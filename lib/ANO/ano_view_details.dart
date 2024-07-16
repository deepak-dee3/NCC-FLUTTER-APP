import 'package:flutter/material.dart';
import 'package:ncc/ANO/ano_view_camp_events.dart';
import 'package:ncc/ANO/dumy_cadet_details.dart';
import 'package:ncc/ANO/cadets_all_details.dart.dart';
import 'package:ncc/ANO/cadets_list.dart';
import 'package:ncc/ANO/upload_camps.dart';
import 'package:ncc/ANO/upload_campss.dart';
import 'package:ncc/CADETS/cadet_view_achievements.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';


class ano_view_details extends StatefulWidget
{
  @override
  State<ano_view_details> createState() => _ano_view_detailsState();
}

class _ano_view_detailsState extends State<ano_view_details> {

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
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:Scaffold(

      body:SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(
        child:Column(children: [

          SizedBox(height: 70,),
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
            child: Row(children: [
              _showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    CADET\'S DETAILS                         ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),):  Text('    CADET\'S DETAILS                         ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
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
);

           // Navigator.push(context,MaterialPageRoute(builder: (context) => upload_camp_detailss()));
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

            Text(' UPLOAD CAMP / EVENT DETAILS  ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),):Text(' UPLOAD CAMP / EVENT DETAILS  ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
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

            Text('    VIEW EVENTS                                ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),):Text('    VIEW EVENTS                                ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
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
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [
               _showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 3),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:

            Text('    VIEW ACHIEVEMENTS                  ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),):Text('    VIEW ACHIEVEMENTS                  ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),
          

          
          
         /* Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('    CONTACT US                                  ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),*/

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

            Text('    REPORT / ANY HELP?                  ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),):Text('    REPORT / ANY HELP?                  ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),
          
        ],)
      )


    )));
  }
}