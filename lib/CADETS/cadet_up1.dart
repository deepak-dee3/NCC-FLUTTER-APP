import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:ncc/CADETS/cadet_update_profile.dart';

class cadet_up1 extends StatefulWidget{
                 
  @override
  State<cadet_up1> createState() => _cadet_up1State();
}

class _cadet_up1State extends State<cadet_up1> {
                 //f1 = field number 1
  //update(String collname,docname,field,var f1,var f2,var f3,var f4) async{
update(String collname, String docname, Map<String, dynamic> fields) async {
    await FirebaseFirestore.instance.collection(collname).doc(docname).update(fields);
    print('data updated');

    _update_regi_controller.clear();
    _update_btn_controller.clear();
    _update_dir_controller.clear();
    _update_name_controller.clear();
    _update_group_controller.clear();

   // SnackBar(content: content)
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Uploaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );

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

            controller: _update_name_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.person),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'NAME *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_dir_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.diversity_2),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'DIRECTORATE *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_group_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.groups),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'GROUP *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_btn_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },

            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.diversity_3),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BATTALION *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height: 20,),

           GestureDetector(
            
               onTap: () {
                  update('CADETS', _update_regi_controller.text, {
                    'Regimental_number': _update_regi_controller.text,
                    'Name': _update_name_controller.text,
                    'Directorate': _update_dir_controller.text,
                    'Group': _update_group_controller.text,
                    'Battalion': _update_btn_controller.text,
                  });

                  Navigator.push(context, MaterialPageRoute(builder: (context) => upadte_profile()));
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

      
    );
  }
}