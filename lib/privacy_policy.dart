import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metaballs/metaballs.dart';
import 'package:shimmer/shimmer.dart';

class privacypolicy extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

      body:Container(
          child: Padding(padding: EdgeInsets.all(20),child:Column(
            

            children: [

              SizedBox(height: 50,),

              Expanded(flex: 1,
                child:Align(alignment: Alignment.centerLeft,child: Container(
                  child: Text('Privacy Policy :',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Color.fromARGB(255, 229, 7, 18)),),
                )
                
                  ),),

              Expanded(flex:5,
                child: Container(
                child:Text('This is committed to protecting your privacy. This Privacy Policy outlines how we handle your information when you use our NCC APP. We collect personal data as well as image data like photos you upload, including event and achievement images. We also collect usage data, including device information, access times, pages viewed, and app crashes. We use this information to manage your account and facilitate image uploads, improve functionality, ensure security, and address your inquiries. We employ security measures to protect your data with complete security. Updates to this policy will be noted. Continued use of the NCC APP implies acceptance of changes.',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              )),

              
 
            ],
          ),
        ),
      ));
    
  }

}

