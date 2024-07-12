import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";

class cadet_up1 extends StatefulWidget{
                 
  @override
  State<cadet_up1> createState() => _cadet_up1State();
}

class _cadet_up1State extends State<cadet_up1> {
                 //f1 = field number 1
  update(String collname,docname,field,var f1,var f2,var f3,var f4) async{

  await FirebaseFirestore.instance.collection(collname).doc(docname).update({field:f1,field:f2,field:f3,field:f4});

  print('data updated');

}

 TextEditingController _update_regi_controller = TextEditingController();
  TextEditingController _update_name_controller = TextEditingController();

 TextEditingController _update_dir_controller = TextEditingController();

 TextEditingController _update_group_controller = TextEditingController();

 TextEditingController _update_btn_controller = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child:Container(
          child:Column(
            children: [

              SizedBox(height:90),

              Icon(Icons.lock,size: 50,),

              SizedBox(height: 50,),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_regi_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.numbers_sharp),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'REGIMENTAL NUMBER *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_regi_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.numbers_sharp),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'NAME *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_regi_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.numbers_sharp),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'DIRECTORATE *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_regi_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.numbers_sharp),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'GROUP *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_regi_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.numbers_sharp),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BATTALION *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height: 20,),

          //ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.upgrade), label:  Text('Complete'))


           GestureDetector(
              onTap: () {
               // uploadfirebase();
               
              },
              child: Container(
                width: 220,
                height: 60,
                child: Text('Complete',
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  //color: Color.fromARGB(255, 18, 13, 93),
                  color:Colors.red,
                ),
              ),
            ),










            ],

          )
        )
      )

      /*  update(String collname,docname,field,var newfield) async{

  await FirebaseFirestore.instance.collection(collname).doc(docname).update({field:newfield});

  print('data updated');

}

 ElevatedButton(onPressed: (){
          update('Users', 'tom', 'name', 'jimmy');
        }, child: Text('update')), */


        




    );
  }
}