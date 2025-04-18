import 'package:flutter/material.dart';
import 'package:ncc/cadet_fill_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ncc/main.dart';
import 'package:shimmer/shimmer.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:metaballs/metaballs.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/quickalert.dart';

class ncc_sign extends StatefulWidget{
  @override
  State<ncc_sign> createState() => _ncc_signState();
}

class _ncc_signState extends State<ncc_sign> {

  String email = ' ', password = ' ', username = ' ',phone = ' ';
  TextEditingController emailcontroller =  TextEditingController();
  TextEditingController passcontroller =  TextEditingController();
  TextEditingController namecontroller =  TextEditingController();
  TextEditingController phonecontroller =  TextEditingController();

  final _formkey= GlobalKey<FormState>();
  final storage = FlutterSecureStorage();

  registration() async {
    if(password!=null)
    {
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        await storage.write(key: 'password', value: password); 
        //String? storedPassword = await storage.read(key: 'password');
       // await storage.delete(key: 'password');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,
        duration: Duration(seconds:  30),
          content: Text("Attention : Don't exit this page without finishing ",style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold))));

      //     Fluttertoast.showToast(
      //   msg: "Attention : Don't exit this page",
      //   toastLength: Toast.LENGTH_LONG,
      //   gravity: ToastGravity.TOP,
      //   backgroundColor: Colors.red,
      //   textColor: Colors.white,
      //   fontSize: 16.0,
      // );
      //  QuickAlert.show(
      //   context: context,
      //   type: QuickAlertType.loading,
      //   title: 'Loading',
      //   text: 'Uploading your image',
      //   confirmBtnText: 'okay'
      // );

        Navigator.push(context, MaterialPageRoute(builder: (context) => fill_details(email: email)));
        emailcontroller.clear();
        namecontroller.clear();
        passcontroller.clear();
       

      }on FirebaseAuthException catch (e)
      {
        if(e.code == 'weak passord'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password provided is too weak',style:TextStyle(fontSize: 20))));
        }/*else if(e.code == 'email-already-in-use')
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('email in use',style:TextStyle(fontSize: 20))));
        }*/
        return null;
        }} }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    
    return  WillPopScope(
      onWillPop: () async{
         Navigator.pop(context);
         return false;
        
      },
      child:
    Scaffold(
      backgroundColor: Colors.white,
    
      resizeToAvoidBottomInset: false,
    body:
  CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300, // Height of the app bar
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Background color of the AppBar
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                     
                      // Lottie animation placed here
                      Container(
                        height: 250,
                        width: 100,
                        child: Transform.scale(
                          scale: 2.0,
                          child: Lottie.asset('assets/animation/Animation - 1721316481945.json'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),child:
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:Container(
        decoration: BoxDecoration(
         // color:Colors.red.withAlpha(15),
         color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // Highlight: Curved top-left corner
            topRight: Radius.circular(20), // Highlight: Curved top-right corner
          ),
          // gradient: LinearGradient(colors: [
          //   Color.fromARGB(255, 144, 1, 169),
          //   Colors.yellow,
          //   Colors.green,
          //   Colors.brown,
          // ]),
         
        ),
        
      child:Form(key: _formkey,
      
      child:Column(children: [

      SizedBox(height:screenHeight*0.035),


     Shimmer.fromColors(
      baseColor: Colors.black,
      highlightColor: Colors.grey[100]!,
      child: Text('Sign Up Page ',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),),
    
      SizedBox(height: screenHeight*0.035,),

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
                      "Enter your name *",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13, color: Colors.black
                          //color: Color(0xff67727d)
                          ),
                    ),
                    TextFormField(
                      controller: namecontroller,
                      validator: (value) {
                        if(value == null || value.isEmpty)
                        {
                          return "Name must not be null";

                        }
                        else if(!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)){

                          return "Should not contain numbers";
                        }
                        return null;
                      },
                     
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          prefixIconColor: Colors.black,
                          hintText: "Your Name",
                          
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )
              ),
      SizedBox(height: screenHeight*0.035),

      
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
                      "Enter your correct mail *",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13, color: Colors.black
                         // color: Color(0xff67727d)
                          ),
                    ),
                    TextFormField(
                     controller: emailcontroller,
                 validator: (value) {
    if (value == null || value.isEmpty) {
      return "Email must not be null";
    } else if (!value.contains("@")) {
      return "Email must contain '@'";
    }
   
    else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
      return "Enter valid email (e.g., mail@domain.com)";
    } 
    else if (!RegExp(r'^[^@]+ncc[^@]*@[^@]+\.[^@]+$').hasMatch(value)) {
      return "must contain ncc(e.g., mailncc@domain.com)";
    }
    return null;
  },
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_lock_outlined),
                          prefixIconColor: Colors.black,
                          hintText: "Your Mail",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )
              ),

      SizedBox(height: screenHeight*0.035),

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
                      "Enter your password *",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,color: Colors.black,
                          fontSize: 13,
                          //color: Color(0xff67727d)
                          
                          ),
                    ),
                    TextFormField(
                     controller: passcontroller,
                validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your user password";
                    }
                   else if (!RegExp(r'^(?=.*[0-9])(?=.*[!@#\$%^&*()_+[\]{}|;:,.<>?]).+$').hasMatch(value)) {
                     return "Aleast one special character and number * ";
                    }
    
                    return null;
                  },
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password_rounded),
                          prefixIconColor: Colors.black,
                          hintText: "Set Your Password",
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )
              ),
      SizedBox(height:screenHeight*0.030),

   
            SizedBox(height: screenHeight*0.035,),
      GestureDetector(onTap:(){

              if(_formkey.currentState!.validate())
          {
            setState(() {
              email = emailcontroller.text.trim();
              username = namecontroller.text.trim();
              password = passcontroller.text.trim();

            });
          }

          registration();

              //Navigator.push(context, MaterialPageRoute(builder: (context) => choosing_items()));
            },
        child:Container(alignment: Alignment.center,
     height:  screenHeight * 0.08,
      width:double.infinity,
       margin: EdgeInsets.symmetric(horizontal: 20),
      //padding: EdgeInsets.all(10),
      //color: Colors.red,

      decoration: BoxDecoration(
        boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 19, 4, 104),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
            
          ],
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 19, 4, 104),
      
      ),
      child: Text('Sign Up Here',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold)), )
       // Text('Sign In',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
      
      ),
      SizedBox(height:screenHeight*0.035),
 ],),)
    ))))])));
  }
}