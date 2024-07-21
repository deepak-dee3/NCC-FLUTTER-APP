import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ncc/main.dart';
import 'package:metaballs/metaballs.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
class forgetpassword extends StatefulWidget{
  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {

  String forget_email = ' ';

  TextEditingController forget_mailcontroller = TextEditingController();

  final forget_formkey = GlobalKey<FormState>();

  forgetpassword() async{

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: forget_email);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check your mailbox ',style:TextStyle(fontSize: 20))));

    Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));

      //  Navigator.push(context, MaterialPageRoute(builder: (context) => ()));

      }on FirebaseAuthException catch (e)
      {
        if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No User Found For This Email',style:TextStyle(fontSize: 20))));
        }}
  }

  @override
  Widget build(BuildContext context) {
    
    return  WillPopScope(
      onWillPop: () async{
         Navigator.pop(context);
         return true;
        
      },
      child:
    Scaffold(

      body:
      /*Metaballs(
  color: Color.fromARGB(255, 235, 86, 98),
  effect: MetaballsEffect.follow(
    growthFactor: 1,
    smoothing: 1,
    radius: 0.5,
  ),
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 184, 8, 26),
      Color.fromARGB(255, 222, 16, 33),
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
    child:
      Container(
       
        child:Column(children: [

          SizedBox(height:70),

         Shimmer.fromColors(
          period: Duration(milliseconds: 4000),
      baseColor: Colors.black, // Base color for shimmer
      highlightColor: Colors.white, // Highlight color for shimmer effect
      child: Text('PASSWORD RECOVERY',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),),

       Center(child: Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 2.0, 
   
            child:Lottie.asset('assets/animation/ffAtfHMlxs.json')),),
          ),

          
          Center(child:Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2,color: Colors.black),
              borderRadius: BorderRadius.circular(20),color:Colors.green.withOpacity(0.1)),
            width:350,height:350,
            child:Form(key:forget_formkey,
              child:Column(children: [

              SizedBox(height:10),

              Text('Enter Your Email',style:TextStyle(shadows: [
                Shadow(color: Colors.black,blurRadius: 7)
              ],
                fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20)),

              SizedBox(height:40),


            Padding(padding:EdgeInsets.all(15),child:TextFormField(
              

            controller: forget_mailcontroller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
             style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
            
            decoration: InputDecoration(prefixIcon: Icon(Icons.mark_email_read_outlined),errorStyle: TextStyle(color: Colors.white),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),
             
             

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'Enter your mail here',hintStyle: TextStyle(shadows: [
                Shadow(color: Colors.black,blurRadius: 7)
              ],
                fontSize: 13,color:Colors.white),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
              
            
          )),





          SizedBox(height: 40,),

          SizedBox(width:200,height: 70,child: ElevatedButton(onPressed: (){

            if(forget_formkey.currentState!.validate())
            {
              setState(() {
                forget_email = forget_mailcontroller.text.trim();
              });
              forgetpassword();
            }
            
          },style: ElevatedButton.styleFrom(backgroundColor: Colors.black) ,child: Text('Send mail',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white))),)

        ],)
      )

    ))])))));
  }
}