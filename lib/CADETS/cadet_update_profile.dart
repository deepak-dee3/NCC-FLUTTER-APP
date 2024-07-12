import 'package:flutter/material.dart';
import 'package:ncc/CADETS/cadet_up1.dart';
import 'package:ncc/CADETS/cadet_up2.dart';
import 'package:ncc/CADETS/cadet_up3.dart';
import 'package:ncc/CADETS/cadet_up4.dart';

class upadte_profile extends StatefulWidget{
  @override
  State<upadte_profile> createState() => _upadte_profileState();
}

class _upadte_profileState extends State<upadte_profile> {
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      body:SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(
        child:Column(children: [

          SizedBox(height: 70,),
         GestureDetector(onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => cadet_up1()));
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('   UPDATE NCC DETAILS                  ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),


           GestureDetector(onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) => cadet_up2()));
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('    UPDATE PERSONAL DETAILS      ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),

          

          GestureDetector(onTap:(){
            Navigator.push(context,MaterialPageRoute(builder: (context) => cadet_up3()));
          },
            child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('   UPDATE ACCOUNT DETAILS         ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),
            Icon(Icons.arrow_circle_right_outlined,color: Colors.blue,)
          ],),)),),

         

          GestureDetector(onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => cadet_up4()));
         },
          child:Padding(padding: EdgeInsets.only(left:30,top:60),
          child:Container(
            width:330,
            height: 100,
            decoration: BoxDecoration(color: Color.fromARGB(255, 39, 3, 116),borderRadius: BorderRadius.circular(20)),
            child: Row(children: [

            Text('   UPDATE ADDITIONAL DETAILS     ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),
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

          
          
        ],)
      )


    ));
  }
}