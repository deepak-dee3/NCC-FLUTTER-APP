import 'package:firebase_core/firebase_core.dart';
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
import 'package:ncc/sign_in.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:metaballs/metaballs.dart';
import 'package:ncc/sign_in.dart';
import 'package:flutter/services.dart';





void main() async
{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
 // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  await NotificationService.init();
  tz.initializeTimeZones();
 
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(NCC());
}

class NCC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home:AnimatedSplashScreen(nextScreen: LiquidSwipeScreen() ,
      splash:Text('UNITY AND DISCIPLINE',style:TextStyle(fontWeight: FontWeight.bold )),
      duration: 3000,
     // splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.white,
      pageTransitionType:PageTransitionType.leftToRight,
     // home:Home(),
     
    ));}

}

class LiquidSwipeScreen extends StatefulWidget {
  @override
  State<LiquidSwipeScreen> createState() => _LiquidSwipeScreenState();
}

class _LiquidSwipeScreenState extends State<LiquidSwipeScreen> {
  

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      
      pages: [
        Home(),
        contents(), 
       
      ],
      initialPage: 0,
      slideIconWidget: Icon(Icons.arrow_back_ios, color: Colors.white),
      
    );
  }
}


class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   String login_email = ' ', login_pass = ' '; 
   final String passkey = '123';
   String? passkeyError;

  TextEditingController login_emailcontroller = TextEditingController();
  TextEditingController login_passcontroller = TextEditingController();
  TextEditingController passkeyController = TextEditingController();

  final login_formkey = GlobalKey<FormState>();

 /* userlogin() async{

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: login_email, password: login_pass);
     Navigator.push(context, PageRouteBuilder(
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
                      ),);



      login_emailcontroller.clear();
      login_passcontroller.clear();

    }on FirebaseAuthException catch (e)
      {
        if(e.code == 'user-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No User found For That Email',style:TextStyle(fontSize: 20))));
        }else if(e.code == 'wrong-password')
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong Password Provided By User',style:TextStyle(fontSize: 20))));
        }
      }}*/
      userlogin() async {
    try {
      if (login_email.isNotEmpty && login_pass.isNotEmpty) { // Check if both email and password are provided
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
          ),
        );

        login_emailcontroller.clear();
        login_passcontroller.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter email and password')));
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No User found for that Email', style: TextStyle(fontSize: 20))));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong Password provided by user', style: TextStyle(fontSize: 20))));
      }
    }
  }
   bool _showShimmer = true;
  int _shimmerCount = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 15), (timer) {
      setState(() {
        _shimmerCount++;
      /*  if (_shimmerCount >= 2) {
          _showShimmer = false;
          timer.cancel();
        }*/
      });
    });
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
      resizeToAvoidBottomInset: false,

    body:Metaballs(
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
  child: SingleChildScrollView(
      
        child:Container(
         padding: EdgeInsets.all(16.0),
         

      child:Form(key:login_formkey,
     
      child:Column(children: [

      SizedBox(height:screenHeight * 0.05),

      Center(
      child:  Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 3.0, 
   
            child:Lottie.asset('assets/animation/2QsQCoEqkP.json')),),
    ),
   // Center(child:Image.asset('assets/ncc_app-removebg-preview.png',)),
      SizedBox(height: screenHeight * 0.03,),

     /* Container(alignment: Alignment.center,
      height: 70,
      width:330,
      padding: EdgeInsets.only(left:20),
      //color: Colors.red,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red.shade500,
         boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 3,
            )
          ]
      
      ),
      child:TextFormField(
        controller: login_emailcontroller,
                validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your user email";
                    }
                    return null;
                  },
        decoration: InputDecoration(border: InputBorder.none,
           // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
        hintText: '     Enter your email',
        ),  
      )
      
      ),*/
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


      /*Container(alignment: Alignment.center,
      height: 70,
      width:330,
      padding: EdgeInsets.only(left:20),
      //color: Colors.red,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red.shade500,
         boxShadow: [
            BoxShadow(
              color: Colors.red,
              blurRadius: 3,
            )
          ]
      
      ),
      
      child:
        TextFormField(
         controller: login_passcontroller,
                validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your user password";
                    }
                    return null;
                  },
        decoration: InputDecoration(border: InputBorder.none,

        hintText: '     Enter your password',
        ),
        
        textAlign: TextAlign.start,
        
        
      )
      ),*/
      SizedBox(height:screenHeight * 0.03,),
      
      GestureDetector(
        onTap: ()
        {
           Navigator.push(context, MaterialPageRoute(builder: (context) => forgetpassword()));
         
        },
        child:Center(child:Text('Forgot Password ? ',style:TextStyle(color: Color.fromARGB(255, 47, 19, 203,),fontWeight: FontWeight.bold,fontSize: 12)),),),
      
      SizedBox(height:30),
      GestureDetector(
              onTap:(){

                 if(login_formkey.currentState!.validate())
          {
            setState(() {
              login_email = login_emailcontroller.text.trim();
              //username = namecontroller.text.trim();
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
        borderRadius: BorderRadius.circular(40),
        color: Color.fromARGB(255, 19, 4, 104),
       
      
      ),child:
      
        Text('Log In',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17,))
      
      )),
      SizedBox(height:10),
      Text("(Or)",style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(255, 103, 41, 237)),),
      

      Padding(padding: EdgeInsets.all(20),child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
        children: [

          GestureDetector(
            onTap:()
            {
              

               showDialog(
      context: context,
      builder: (BuildContext context) {
        String? passkeyError;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shadowColor: Colors.blue.shade900,
              backgroundColor: Color.fromARGB(255, 10, 138, 243),
              title: Row(children: [

                Shimmer.fromColors( baseColor:Colors.black, highlightColor: Colors.white,child:Icon(Icons.lock,size: 30,),),
                SizedBox(width: 10,),
                Text('Secure Key',style: TextStyle(fontSize: 20),)

              ],),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: passkeyController,
                    keyboardAppearance: Brightness.light,
                   
                    decoration: InputDecoration(
                     
                      hintText: 'Enter the pass key',hintStyle: TextStyle(color: Colors.white)),
                  ),
                  if (passkeyError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        passkeyError!,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Shimmer.fromColors(baseColor: Colors.black, highlightColor: Colors.white,child:Text('Submit',style: TextStyle(color: Colors.grey),),),
                  onPressed: () {
                    if (passkeyController.text.trim() == passkey) {
                      passkeyController.clear(); // Clear the passkey field
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.push(
                        context,
                         PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => ano_view_details(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = 0.0;
                          const end = 1.0;
                          const curve = Curves.elasticIn;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var opacityAnimation = animation.drive(tween);

                          return FadeTransition(
                            opacity: opacityAnimation,
                            child: child,
                          );
                        },
                      ),
                      );
                    } else {
                      passkeyController.clear();
                      setState(() {
                        passkeyError = 'Enter correct pass key';
                      });
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );

            },
            child:Container(
            width: 150,height: 60,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 21, 3, 123),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 18, 8, 88).withOpacity(0.6),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                  BoxShadow(
                   color: const Color.fromARGB(255, 96, 68, 255).withOpacity(0.6),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                  
                ],
              ),
              child: Center(child:_showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 1),
               
                
                            baseColor: Colors.white,
                            highlightColor: Colors.blue,
                            child:Text(
                  'ANO ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),):Text(
                  'ANO ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),),

          ),),
          
           GestureDetector(
            onTap:(){

               showModalBottomSheet(context: context, builder: (BuildContext context) {
          return ncc_sign();
               },
               // backgroundColor: Colors.transparent, // Set background color to transparent
      isScrollControlled: true,
      transitionAnimationController: AnimationController(
        vsync: Navigator.of(context),
        duration: Duration(milliseconds: 300),
      )..forward(),
               );

            },
            child:Container(
            width: 150,height: 60,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 31, 9, 122),
               
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 18, 8, 88).withOpacity(0.6),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                  BoxShadow(
                    color: const Color.fromARGB(255, 96, 68, 255).withOpacity(0.6),
                    blurRadius: 20,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Center(
               child:_showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 1),
               
                
                            baseColor: Colors.white,
                            highlightColor: Colors.blue,
                            child:Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                   // letterSpacing: 1.5,
                  ),),
                ):Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                   // letterSpacing: 1.5,
                  ),),

          )),),

        ],
      ),),



    /*  GestureDetector(
        onTap:(){
         // Navigator.push(context, MaterialPageRoute(builder: (context) => ncc_sign() )); 
         showModalBottomSheet(context: context, builder: (BuildContext context) {
          return ncc_sign();

         });
        },
        child:_showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 1),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.red,
                            child:Text('Sign Up ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,decoration: TextDecoration.underline))):Text('Sign In To Continue ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,decoration: TextDecoration.underline))
      ),*/

  /* GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? passkeyError;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shadowColor: Colors.blue.shade900,
              backgroundColor: Colors.blue,
              title: Row(children: [

                Shimmer.fromColors( baseColor:Colors.black, highlightColor: Colors.white,child:Icon(Icons.lock,size: 30,),),
                SizedBox(width: 10,),
                Text('Secure Key',style: TextStyle(fontSize: 20),)

              ],),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: passkeyController,
                    keyboardAppearance: Brightness.light,
                   
                    decoration: InputDecoration(
                     
                      hintText: 'Enter the pass key',hintStyle: TextStyle(color: Colors.white)),
                  ),
                  if (passkeyError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        passkeyError!,
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Shimmer.fromColors(baseColor: Colors.black, highlightColor: Colors.white,child:Text('Submit',style: TextStyle(color: Colors.grey),),),
                  onPressed: () {
                    if (passkeyController.text.trim() == passkey) {
                      passkeyController.clear(); // Clear the passkey field
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.push(
                        context,
                         PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => ano_view_details(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = 0.0;
                          const end = 1.0;
                          const curve = Curves.elasticIn;

                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var opacityAnimation = animation.drive(tween);

                          return FadeTransition(
                            opacity: opacityAnimation,
                            child: child,
                          );
                        },
                      ),
                      );
                    } else {
                      passkeyController.clear();
                      setState(() {
                        passkeyError = 'Enter correct pass key';
                      });
                    }
                  },
                ),
              ],
            );
          },
        );
      },
    );
  },
  child: Center(
  
    child:Row(
       mainAxisSize: MainAxisSize.min, 
      children: [
        Text(
          'ANO \'s ',
          style: TextStyle(
            color: Color.fromARGB(255, 47, 19, 203),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5),
        _showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 1),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.red,
                            child:Text(
          'click here to continue',
          style: TextStyle(fontWeight: FontWeight.bold, 
          color: Colors.blue,

         
          ),
        ),):Text(
          'click here to continue',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    ),
  ),
),*/
     
      SizedBox(height: 10,),
    
     /* GestureDetector(
        onTap:(){
         // Navigator.push(context, MaterialPageRoute(builder: (context) => ncc_sign() )); 
         showModalBottomSheet(context: context, builder: (BuildContext context) {
          return ncc_sign();

         });
        },
        child:_showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 1),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.red,
                            child:Text('Sign Up ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,decoration: TextDecoration.underline))):Text('Sign In To Continue ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,decoration: TextDecoration.underline))
      ),*/

     
      ],),  
    )))),
    ));
  }
}