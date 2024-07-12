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




void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
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
     
    ));
    
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

  userlogin() async{

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: login_email, password: login_pass);
      Navigator.push(context, MaterialPageRoute(builder: (context) => cadet_main_page()));

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


      }
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

    body:Container(
      child:Form(key:login_formkey,
     // color: Color.fromARGB(255, 252, 223, 180),

      /*alignment: Alignment.center,
      padding:EdgeInsets.all(32),
      decoration: BoxDecoration(image:DecorationImage(image: NetworkImage(''),fit: BoxFit.cover)), */
      child:Column(children: [

      SizedBox(height:90),

      Center(child:Image(image: AssetImage('assets/ncclogo-removebg-preview.png',),width:150,height:150)),

      SizedBox(height: 70,),

      Container(alignment: Alignment.center,
      height: 70,
      width:330,
      padding: EdgeInsets.only(left:20),
      //color: Colors.red,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red.shade500,
      
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
        child:Padding(padding:EdgeInsets.only(left:140),child:Row(children:[
          Text('Forgot Password ? ',style:TextStyle(color: Color.fromARGB(255, 47, 19, 203,),fontWeight: FontWeight.w500,fontSize: 10)),
         // SizedBox(width:5),
         // Text('click here to continue',style:TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 47, 19, 203,),))
          ])
      )


      
      ),
      

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
          }

          userlogin();
          


              },child:Container(alignment: Alignment.center,
      height: 70,
      width:330,
      padding: EdgeInsets.all(10),
      //color: Colors.red,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color.fromARGB(255, 19, 4, 104),
      
      ),
      child:
        Text('Log In',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
      
      ),),
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
              title: Text('Enter the pass key'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: passkeyController,
                    keyboardAppearance: Brightness.light,
                   
                    decoration: InputDecoration(hintText: 'Enter the pass key'),
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
                  child: Text('Submit'),
                  onPressed: () {
                    if (passkeyController.text.trim() == passkey) {
                      passkeyController.clear(); // Clear the passkey field
                      Navigator.of(context).pop(); // Close the dialog
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ano_view_details(),
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
  child: Padding(
    padding: EdgeInsets.only(left: 80),
    child: Row(
      children: [
        Text(
          'ANO \'s ',
          style: TextStyle(
            color: Color.fromARGB(255, 47, 19, 203),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5),
        Text(
          'click here to continue',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ],
    ),
  ),
),


      

      /*GestureDetector(
        onTap:(){
          Navigator.push(context,MaterialPageRoute(builder: (context) => ano_view_details()));
        },
        child:Padding(padding:EdgeInsets.only(left:80),child:Row(children:[
          Text('ANO \'s ',style:TextStyle(color: Color.fromARGB(255, 47, 19, 203,),fontWeight: FontWeight.bold)),
          SizedBox(width:5),
          Text('click here to continue',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))
          ])
      ),
),*/




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
          Navigator.push(context, MaterialPageRoute(builder: (context) => ncc_sign() ));

          
        },
        child:Text('Sign In To Continue ',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,decoration: TextDecoration.underline)))
     

      
      ],),

      
    
    
    
    ))));
  }
}