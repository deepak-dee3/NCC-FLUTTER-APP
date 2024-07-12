import 'package:flutter/material.dart';
import 'package:ncc/ANO/ano_view_camp_events.dart';
import 'package:ncc/ANO/dumy_cadet_details.dart';
import 'package:ncc/ANO/cadets_all_details.dart.dart';
import 'package:ncc/ANO/cadets_list.dart';
import 'package:ncc/ANO/upload_camps.dart';
import 'package:ncc/ANO/upload_campss.dart';
import 'package:ncc/CADETS/cadet_view_achievements.dart';


class ano_view_details extends StatelessWidget
{
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => ccadet_details()));
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('    CADET\'S DETAILS                         ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),

          

          GestureDetector(onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context) => upload_camp_detailss()));
          },
            child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text(' UPLOAD CAMP / EVENT DETAILS  ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color: Colors.blue,)
          ],),)),),

          GestureDetector(onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ano_camp_view_details()));
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('    VIEW EVENTS                                ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),

          GestureDetector(onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => cadet_view_achievements()));
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('    VIEW ACHIEVEMENTS                  ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
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

            Text('    REPORT / ANY HELP?                  ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),
          
        ],)
      )


    )));
  }

}