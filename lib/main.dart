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


void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
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
      home:AnimatedSplashScreen(nextScreen: Home() ,
      splash:Text('UNITY AND DISCIPLINE',style:TextStyle(fontWeight: FontWeight.bold )),
      duration: 3000,
     // splashTransition: SplashTransition.rotationTransition,
      backgroundColor: Colors.white,
      pageTransitionType:PageTransitionType.leftToRight,
     // home:Home(),
     
    ));}

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

    body:SingleChildScrollView(
      
        child:Container(
         padding: EdgeInsets.all(16.0),
         

      child:Form(key:login_formkey,
     // color: Color.fromARGB(255, 252, 223, 180),

      /*alignment: Alignment.center,
      padding:EdgeInsets.all(32),
      decoration: BoxDecoration(image:DecorationImage(image: NetworkImage(''),fit: BoxFit.cover)), */
      child:Column(children: [

      SizedBox(height:90),

      Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: Colors.white.withOpacity(0.5),
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
            width: 150,
            height: 150,
          ),
        ],
      ),
    ),
      SizedBox(height: 70,),

      Container(alignment: Alignment.center,
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
      
      ),

      SizedBox(height: 30,),

      Container(alignment: Alignment.center,
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
      ),
      SizedBox(height: 20,),

      GestureDetector(
        onTap: ()
        {
           Navigator.push(context, MaterialPageRoute(builder: (context) => forgetpassword()));
         
        },
        child:Center(child:Text('Forgot Password ? ',style:TextStyle(color: Color.fromARGB(255, 47, 19, 203,),fontWeight: FontWeight.w500,fontSize: 12)),),),
      
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
      height: 70,
      width:330,
      padding: EdgeInsets.all(10),
      //color: Colors.red,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color.fromARGB(255, 19, 4, 104),
      
      ),child:_showShimmer? 
              Shimmer.fromColors(
                period: Duration(seconds: 1),
               
                
                            baseColor: Colors.blue,
                            highlightColor: Colors.white,
                            child:
      
        Text('Log In',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
      
      ):Text('Log In',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),)),
      SizedBox(height:30),

   GestureDetector(
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
),
     
      SizedBox(height: 10,),
      
      GestureDetector(onTap: ()
      {
       // NotificationService.showInstantNotification("Instant", "this is an instant");

      // DateTime scheduled_data = DateTime.now().add(Duration(seconds: 5));

      // NotificationService.scheduleNotification("Major Dr.P.S.Ragavendhran", "uploaded", scheduled_data);
      },
        child:Text("(Or)",style: TextStyle(color:const Color.fromARGB(255, 231, 174, 6)),)),

      SizedBox(height:15),

      GestureDetector(
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
                            child:Text('Sign In To Continue ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,decoration: TextDecoration.underline))):Text('Sign In To Continue ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,decoration: TextDecoration.underline))
      )],),  
    )))));
  }
}