import 'package:flutter/material.dart';
import 'package:ncc/CADETS/cadet_up1.dart';
import 'package:ncc/CADETS/cadet_up2.dart';
import 'package:ncc/CADETS/cadet_up3.dart';
import 'package:ncc/CADETS/cadet_up4.dart';
import 'package:shimmer/shimmer.dart';

class upadte_profile extends StatefulWidget{
  @override
  State<upadte_profile> createState() => _upadte_profileState();
}

class _upadte_profileState extends State<upadte_profile> {
  @override
  Widget build(BuildContext context) {
    return
     WillPopScope(
      onWillPop: () async{
         Navigator.pop(context);
         return false;
        
      },
      child:
    Scaffold(
      body:SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(
        child:Column(children: [

          SizedBox(height: 70,),
         GestureDetector(onTap:(){
          Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => cadet_up1(),
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

            Shimmer.fromColors(baseColor: Colors.blue, highlightColor: Colors.white ,child:Text('   UPDATE NCC DETAILS                  ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),


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

            Shimmer.fromColors(baseColor: Colors.blue, highlightColor: Colors.white,child:Text('    UPDATE PERSONAL DETAILS      ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),

          

          GestureDetector(onTap:(){
            Navigator.push(context,PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>cadet_up3(),
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

           Shimmer.fromColors( baseColor: Colors.blue, highlightColor: Colors.white,child: Text('   UPDATE ACCOUNT DETAILS         ',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.blue)),),
            Icon(Icons.arrow_circle_right_outlined,color: Colors.blue,)
          ],),)),),

         

          GestureDetector(onTap:(){
            Navigator.push(context, PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => cadet_up4(),
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

            Shimmer.fromColors(baseColor:Colors.blue, highlightColor: Colors.white,child:Text('   UPDATE ADDITIONAL DETAILS     ',style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold)),),
            Icon(Icons.arrow_circle_right_outlined,color:Colors.blue)
          ],),)),),
        ],)
      )


    )));
  }
}