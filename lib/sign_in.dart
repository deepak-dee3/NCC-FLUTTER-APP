import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ncc/cadet_fill_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ncc/main.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  registration() async {
    if(password!=null)
    {
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registered Successfully',style:TextStyle(fontSize: 20))));

        Navigator.push(context, MaterialPageRoute(builder: (context) => fill_details()));
        emailcontroller.clear();
        namecontroller.clear();
        passcontroller.clear();
        phonecontroller.clear();

      }on FirebaseAuthException catch (e)
      {
        if(e.code == 'weak passord'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password provided is too weak',style:TextStyle(fontSize: 20))));
        }else if(e.code == 'email-already-in-use')
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('email in use',style:TextStyle(fontSize: 20))));
        }}} }

  @override
  Widget build(BuildContext context) {
    
    return  WillPopScope(
      onWillPop: () async{
         Navigator.pop(context);
         return false;
        
      },
      child:
    Scaffold(
      backgroundColor: Colors.transparent,
    /*  body:Column(children: [

        SizedBox(height:120),

        Padding(padding:EdgeInsets.only(left:27),child:Container(
          child:Stack(
            children: [
              Padding(padding: EdgeInsets.all(10),
              child:Container(width:330,height:600,
              decoration: BoxDecoration(color:Color.fromARGB(255, 31, 1, 96),borderRadius: BorderRadius.circular(20)),)
            ),
            Stack(
            children: [
              Padding(padding: EdgeInsets.all(20),
              child:Container(width:330,height:600,
              decoration: BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(20)),)
            )
            ],
          ),
            ],
          ),
          
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
            ,color: Colors.red,
          ),
          height:600,width:330)),
      ],)

      */
      resizeToAvoidBottomInset: false,
    body:
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child:Container(
        decoration: BoxDecoration(
          color:Colors.red.withAlpha(15),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), // Highlight: Curved top-left corner
            topRight: Radius.circular(20), // Highlight: Curved top-right corner
          ),
        ),
        //decoration: BoxDecoration(color:Colors.blue.withOpacity(0.2),borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
       // color:Colors.blue.withOpacity(0.2),
      child:Form(key: _formkey,
      /*alignment: Alignment.center,
      padding:EdgeInsets.all(32),
      decoration: BoxDecoration(image:DecorationImage(image: NetworkImage(''),fit: BoxFit.cover)), */
      child:Column(children: [

      SizedBox(height:50),

      Center(child:Image(image: AssetImage('assets/three_head-removebg-preview.png',),width:150,height:150)),

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
      child:TextFormField(
        decoration: InputDecoration(border: InputBorder.none,
        hintText: '     Enter your name',
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
      child:TextFormField(
      
        decoration: InputDecoration(border: InputBorder.none,
        hintText: '     Enter your email',
         errorStyle: TextStyle(color: Color.fromARGB(255, 32, 1, 144),fontSize: 12),
        ),
        validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your user email";
                    }
                    return null;
                  },
                  
        controller: emailcontroller,       
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
          
        decoration: InputDecoration(border: InputBorder.none,
        hintText: '     Enter your password',
         errorStyle: TextStyle(color: Color.fromARGB(255, 32, 1, 144),fontSize: 12),

        ),
        validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your user password";
                    }
                    return null;
                  },
        controller: passcontroller,
        
        textAlign: TextAlign.start,
        
      )
      
      ),
      SizedBox(height:30),

      Container(alignment: Alignment.center,
      height: 70,
      width:330,
      padding: EdgeInsets.only(left:10,top:8),
      //color: Colors.red,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
         color: Colors.red.shade500,
      
      ),
      child:
        IntlPhoneField(
          controller: phonecontroller,
          initialCountryCode: 'IN',
          disableLengthCheck: true,
          
        decoration: InputDecoration(border: InputBorder.none,
        hintText: 'Enter your number',
        
        contentPadding: EdgeInsets.only(top:8),
              
        ),
        textAlign: TextAlign.start,
        keyboardType: TextInputType.phone,        
        
      )      
      ),
      SizedBox(height: 20,),     
      SizedBox(height:30),
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
      height: 70,
      width:330,
      padding: EdgeInsets.all(10),
      //color: Colors.red,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color.fromARGB(255, 19, 4, 104),
      
      ),
      child:
        Text('Sign In',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
      
      ),),
      SizedBox(height:30),


      SizedBox(height: 10,),
            ],),

    )
    ))));
  }
}