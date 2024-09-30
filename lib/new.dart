import 'package:quickalert/quickalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ncc/ANO/ano_view_details.dart';
import 'package:ncc/CADETS/cadet_view_events.dart';
import 'package:ncc/FORGET%20PASSWORD/forgetpassword.dart';
import 'package:ncc/Notification/notification.dart';
import 'package:ncc/cadet_fill_details.dart';
import 'package:ncc/firebase_options.dart';
import 'package:ncc/CADETS/cadet_main_page.dart';
import 'package:ncc/ncc_content.dart';
import 'package:ncc/privacy_policy.dart';
import 'package:ncc/sign_in.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:shimmer/shimmer.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:metaballs/metaballs.dart';
import 'package:ncc/sign_in.dart';
import 'package:flutter/services.dart';
import 'package:ncc/Notification/main_page_notification.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';




class Home1 extends StatefulWidget{
  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {

   String login_email = ' ', login_pass = ' '; 
   final String passkey = '123';
   String? passkeyError;

  TextEditingController login_emailcontroller = TextEditingController();
  TextEditingController login_passcontroller = TextEditingController();
  TextEditingController passkeyController = TextEditingController();

  final login_formkey = GlobalKey<FormState>();

 
      userlogin() async {
        
    try {
      
      if (login_email.isNotEmpty && login_pass.isNotEmpty ) { // Check if both email and password are provided
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: login_email, password: login_pass);
       
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => cadet_main_page(),
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
            transitionDuration: Duration(microseconds: 1),
          ),
        );
        login_emailcontroller.clear();
        login_passcontroller.clear();
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter email and password')));
      }
    } on FirebaseAuthException catch (e) {
    print('FirebaseAuthException: ${e.code}'); // Logging the error code for debugging
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('No User found for that Email',
              style: TextStyle(fontSize: 20))));
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Wrong Password provided by user',
              style: TextStyle(fontSize: 20))));
    } else {
      Fluttertoast.showToast(
  msg: "Error in your mail and password",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.TOP,
  timeInSecForIosWeb: 1,
  backgroundColor: Colors.red,
  textColor: Colors.white,
  fontSize: 15.0
);
    }
  } catch (e) {
    print('Exception: $e'); // Logging the general error for debugging
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('An error occurred. Please try again.',
            style: TextStyle(fontSize: 20))));
  }
}
   
  @override
  Widget build(BuildContext context) {

     var screenWidth = MediaQuery.of(context).size.width; 
    var screenHeight = MediaQuery.of(context).size.height;
    
    return  WillPopScope(
    onWillPop: () async {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirm Exit'),
          content: Text('Are you sure you want to exit?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () => Navigator.of(context).pop(true),
            ),
          ],
        ),
      );
    },
    child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,

    body: SingleChildScrollView(
      
        child:Container(
         padding: EdgeInsets.all(16.0),
         

      child:Form(key:login_formkey,
     
      child:Column(children: [

      SizedBox(height:screenHeight * 0.09),

     /* Center(
      child: 
          Image(
            image: AssetImage('assets/ncclogo-removebg-preview.png'),
            width: 120,
            height: 120,
          ),
    ),*/
     Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: Colors.black.withOpacity(0.5),
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.2), // This makes the shimmer effect visible around the image
              ),
            ),
          ),
          Image(
            image: AssetImage('assets/ncclogo-removebg-preview.png'),
            width: 120,
            height: 120,
          ),
        ],
      ),
    ),
   // Center(child:Image.asset('assets/ncc_app-removebg-preview.png',)),
      SizedBox(height: screenHeight * 0.06,),

  
      Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff67727d)),
                    ),
                    TextFormField(
                     controller: login_emailcontroller,
                validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your user email";
                    }
                    
                   
                   
                    return null;
                  },
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          prefixIconColor: Colors.black,
                          hintText: "Email",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),


      SizedBox(height:screenHeight * 0.03,),

      Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff67727d)),
                    ),
                    TextFormField(
                     controller: login_passcontroller,
                validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your user password";
                    }
                   
                      else {
                        "Correct your password";
                      }
                    return null;
                  },
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_outlined),
                          prefixIconColor: Colors.black,
                          hintText: "Password",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )
              ),


      SizedBox(height:screenHeight * 0.03,),
      
      GestureDetector(
        onTap: ()
        {
           Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()));
         
        },
        child:Center(child:Text('Forgot Password ? ',style:TextStyle(color: Color.fromARGB(255, 24, 4, 135),fontWeight: FontWeight.bold,fontSize: 12)),),),
      
      SizedBox(height:screenHeight * 0.035),
      GestureDetector(
              onTap:(){

                 if(login_formkey.currentState!.validate())
          {
            setState(() {
              login_email = login_emailcontroller.text.trim();
              
              login_pass = login_passcontroller.text.trim();

            });
            userlogin();
          }

         // userlogin();
              },child:Container(alignment: Alignment.center,
      height:  screenHeight * 0.08,
      width:double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      //color: Colors.red,

      decoration: BoxDecoration(
        /* boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 18, 8, 88).withOpacity(0.6),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                 
                  
                ],*/
        borderRadius: BorderRadius.circular(15),
        //color: Color.fromARGB(255, 19, 4, 104),
        color:const Color.fromARGB(255, 7, 128, 227)
       
      
      ),child:
      
        Text('Log In',style:TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 17,))
      
      )),
      SizedBox(height:screenHeight*0.03),
       GestureDetector(
              onTap:(){

               
              },child:Container(alignment: Alignment.center,
      height:  screenHeight * 0.08,
      width:double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      //color: Colors.red,

      decoration: BoxDecoration(
        /* boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 18, 8, 88).withOpacity(0.6),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                 
                  
                ],*/
        borderRadius: BorderRadius.circular(15),
      //  color: Color.fromARGB(255, 19, 4, 104),
      //color:Colors.blue
      color:const Color.fromARGB(255, 7, 128, 227)
       
      
      ),child:
      
       Text("Don't have an account ? Register",style:TextStyle(color: Color.fromARGB(255, 19, 4, 104),fontWeight: FontWeight.bold,fontSize: 12,))
      
      )),
      SizedBox(height: screenHeight*0.05,),

     Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
           SizedBox(width: screenWidth*0.05,),
        
        Text("ANO ' s Click Here To Continue",style: TextStyle( color:Color.fromARGB(255, 24, 4, 135),fontSize: 15,fontWeight: FontWeight.w900),),
         Icon(Icons.arrow_right,size: 35,),
      
      ],)),
  

         ],),  
    )))),
    );
  }
}
