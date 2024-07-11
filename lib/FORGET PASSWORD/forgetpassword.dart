import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ncc/main.dart';

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
        }


      }




  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body:Container(
        //color: Color.fromARGB(255, 188, 244, 190),
        color:Colors.red,
        child:Column(children: [

          SizedBox(height:100),

          Text('PASSWORD RECOVERY',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),

          SizedBox(height:50),
          Center(child:Container(
            width:350,height:300,color:Colors.white.withOpacity(0.3),
            child:Form(key:forget_formkey,
              child:Column(children: [

              SizedBox(height:10),

              Text('Enter Your Email',style:TextStyle(fontWeight: FontWeight.bold)),

              SizedBox(height:40),

              /*Container(
                height:60,
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 60),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 91, 158, 93),
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                child: TextFormField(
                  controller: forget_mailcontroller,
                  validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Enter your email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(border: InputBorder.none,prefixIcon: Icon(Icons.email),labelText: 'Enter your mail here *'),

                ),
              ),

            ],),

            ),), ), */

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
            decoration: InputDecoration(prefixIcon: Icon(Icons.mark_email_read_outlined),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),
             

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'Enter your mail here',hintStyle: TextStyle(fontSize: 13,color:Colors.white),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),





          SizedBox(height: 20,),

          SizedBox(width:200,child: ElevatedButton(onPressed: (){

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

    ))])));
  }
}