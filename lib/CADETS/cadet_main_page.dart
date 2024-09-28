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
    
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

   
   return
    WillPopScope(
      onWillPop: () async {
        // Handle back button press
         Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => Home()),(route) => false,);
       return false;
      },
      child:Scaffold(
        backgroundColor: Colors.white,
      body:
     SingleChildScrollView(scrollDirection: Axis.vertical,
        child:Container(child:Center(
          //padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.01),

        child:Column(children: [

         SizedBox(height: screenHeight*0.065),

           Center(child:Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 3.0, 
   
            child:Lottie.asset('assets/animation/Animation - 1721310404627.json')),),),
            SizedBox(height: screenHeight*0.05,),

            Container(
  height: screenHeight*0.46,//430,
  width: screenWidth*0.86,
  //color: Colors.grey,
  child: GridView(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 150, // Adjusted for 2 columns, each item taking up max 150 width
      crossAxisSpacing: 30,
      mainAxisSpacing: 30,
    ),
    children: [
      GestureDetector(onTap:(){
        //Navigator.push(context, MaterialPageRoute(builder: (context) => EventsListPagess_admin()));
        Navigator.push(context, PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => cadet_up2(),
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
);
      },
        child:
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue),
      child:Column(children:[
        SizedBox(height: screenHeight*0.04,),
        Icon(Icons.manage_accounts_outlined,color:  const Color.fromARGB(255, 113, 9, 2),size: 30,),
          SizedBox(height: screenHeight*0.02,),
        Align(alignment: Alignment.center,
          child:Column(children: [
            SizedBox(width: screenWidth*0.2,),
          Text("Update",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
         // SizedBox(height: screenHeight*0.01,),
                    Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,)),

         

        ],))])
      ),),

      GestureDetector(onTap:(){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => EventsListPages()));
         Navigator.push(context, PageRouteBuilder(
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
        child:
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue), child:Column( children:[
         SizedBox(height: screenHeight*0.04,),
        Icon(Icons.arrow_circle_up_outlined,color: const Color.fromARGB(255, 113, 9, 2),size: 30,),
         SizedBox(height: screenHeight*0.02,),
 Align(alignment: Alignment.center,
          child:Column(children: [
            SizedBox(width: screenWidth*0.2,),
          Text("Upload",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
        //  SizedBox(height: screenHeight*0.01,),
                    Text("Achievements",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,)),

         

        ],))        ])),),

       GestureDetector(onTap:(){
        // Navigator.push(context, MaterialPageRoute(builder: (context) => HospitalList()));
         Navigator.push(context,PageRouteBuilder(
  pageBuilder: (context, animation, secondaryAnimation) => ano_camp_view_details() ,
  transitionsBuilder: (context, animation, secondaryAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
)
);   

       },
        child:
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue), child: Column(children:[
         SizedBox(height: screenHeight*0.04,),
        Icon(Icons.arrow_circle_left_outlined,color: const Color.fromARGB(255, 113, 9, 2),size: 30,),
         SizedBox(height: screenHeight*0.02,),
         Align(alignment: Alignment.center,
          child:Column(children: [
            SizedBox(width: screenWidth*0.2,),
          Text("View",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
        //  SizedBox(height: screenHeight*0.01,),
                    Text("Activities",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),

         

        ],))
        ]))
        ),

GestureDetector(onTap:(){
 // Navigator.push(context, MaterialPageRoute(builder: (context) => new_event()));
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
  child:
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue), child:Column(children:[ 
         SizedBox(height: screenHeight*0.04,),
        Icon(Icons.arrow_circle_right_outlined,color: const Color.fromARGB(255, 113, 9, 2),size: 30,), //const Color.fromARGB(255, 36, 1, 113)
         SizedBox(height: screenHeight*0.02,),
        Align(alignment: Alignment.center,
          child:Column(children: [
            SizedBox(width: screenWidth*0.2,),
          Text("View",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17)),
        //  SizedBox(height: screenHeight*0.01,),
                    Text("Achievements",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,)),

         

        ],))
        ]))),
    ],
  ),
),
SizedBox(height: screenHeight*0.035), 
 ],)
      )
    ))
   ));
  }
}

           


      /*   GestureDetector(onTap:(){

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
          ],),)),),*/
         
           
       