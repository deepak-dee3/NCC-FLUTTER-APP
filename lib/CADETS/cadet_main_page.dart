import 'package:flutter/material.dart';
import 'package:ncc/ANO/ano_view_camp_events.dart';
import 'package:ncc/CADETS/cadet_upload_achievements.dart';
import 'package:ncc/CADETS/cadet_view_achievements.dart';

class cadet_main_page extends StatefulWidget{
  @override
  State<cadet_main_page> createState() => _cadet_main_pageState();
}

class _cadet_main_pageState extends State<cadet_main_page> {
  @override
  Widget build(BuildContext context) {
   
   return(
    Scaffold(
      body:SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(
        child:Column(children: [

          SizedBox(height: 70,),
         GestureDetector(onTap:(){
         // Navigator.push(context, MaterialPageRoute(builder: (context) => ccadet_details()));
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('    PROFILE UPDATION                   ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
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

            Text('    VIEW EVENTS                             ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),

          

          GestureDetector(onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context) => cadet_upload_achievements()));
          },
            child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('    UPLOAD ACHIEVEMENTS         ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color: Colors.blue,)
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

            Text('    VIEW ACHIEVEMENTS              ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
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

            Text('    REPORT / ANY HELP?                ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),
          
        ],)
      )


    ))

      

      

    
   );
  }
}