import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncc/ANO/ano_view_details.dart';

class upload_camp_details extends StatefulWidget{
  @override
  State<upload_camp_details> createState() => _upload_camp_detailsState();
}

class _upload_camp_detailsState extends State<upload_camp_details> {


  String ? imageurl;

  final ImagePicker _imagepic = ImagePicker();

  pickimage() async
  {

    if (_campeve_controller.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill in the content first');
      return;
    }

    XFile ? res = await _imagepic.pickImage(source: ImageSource.gallery);

    if(res != null)
    {
      uploadfirebase(File(res.path));
    }

  }

   pickimage_cam() async
  {
    if (_campeve_controller.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill in the content first');
      return;
    }

    XFile ? res = await _imagepic.pickImage(source: ImageSource.camera);

    if(res != null)
    {
      uploadfirebase(File(res.path));
    }

  }

  uploadfirebase(image)  async{
    try{

       if (_campeve_controller.text.isEmpty) {
        Fluttertoast.showToast(msg: 'Please fill in the content first');
        return;
      }

      Reference image_ref = FirebaseStorage.instance.ref().child('CAMP_EVENT_Images/${_campeve_controller.text}');

      await image_ref.putFile(image).whenComplete(() => 
      {

        Fluttertoast.showToast(msg: 'Image uploaded')

      });

      imageurl = await image_ref.getDownloadURL();

       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Uploaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );

    }
    catch(e){
      print('print error occured');

    }

  }

  TextEditingController _campeve_controller = TextEditingController();








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,

      body:Container(

        child:Column(children: [


          SizedBox(height:50),


          Padding(padding:EdgeInsets.all(28),child:Container(

            //color: Color.fromARGB(255, 14, 18, 106),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color.fromARGB(255, 15, 18, 117)),
            child:TextFormField(
            
            

            controller: _campeve_controller,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              //focusColor: Color.fromARGB(255, 22, 10, 94),
              prefixIcon: Icon(Icons.notes),
             prefixIconColor: Colors.white,

           // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'Enter the content  ',hintStyle: TextStyle(fontSize: 13,color:Colors.white),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),),



         



           

          Padding(padding:EdgeInsets.only(left:80,top:30),child:Row(
            children: [

             

              
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(color:Colors.red,borderRadius: BorderRadius.circular(10)),
                child:IconButton(onPressed: (){
                  pickimage_cam();
                }, icon: Icon(Icons.camera))),

                SizedBox(width:30),

             

               Container(height: 100,
                width: 100,
                 decoration: BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(10)),
                child:IconButton(onPressed: (){
                  pickimage();
                }, icon: Icon(Icons.image)))
            ],
          ),),

          SizedBox(height:30),

           Padding(padding: EdgeInsets.only(left:80),
           child:Row(
            children: [
              SizedBox(width: 15,),
              Text('Camera',style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width:75),
              Text('Gallery',style: TextStyle(fontWeight: FontWeight.bold),)
            ],
           )),



          SizedBox(height:60),


        GestureDetector(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => ano_view_details()));
           

            

          },

          child:Container(
            width: 220,
            height: 60,
            child: Text('Complete',style:TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold)),
            alignment:Alignment.center,decoration: BoxDecoration(
              
              borderRadius: BorderRadius.circular(20),
              color:Color.fromARGB(255, 18, 13, 93)),)
        )

         


          


         /* ElevatedButton(style: ElevatedButton.styleFrom( 
            fixedSize: Size(200, 60),
            backgroundColor: Color.fromARGB(255, 17, 6, 104),  ),
            onPressed: (){
            pickimage();
            _campeve_controller.clear();
          }, child: Text('upload camp image',style: TextStyle(color: Colors.white),)), */




        ],)
      )

      



      
      

      



    );
  }
}