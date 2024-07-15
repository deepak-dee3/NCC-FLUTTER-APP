import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:ncc/CADETS/cadet_update_profile.dart';

class cadet_up4 extends StatefulWidget{
  @override
  State<cadet_up4> createState() => _cadet_up4State();
}

class _cadet_up4State extends State<cadet_up4> {

   update(String collname, String docname, Map<String, dynamic> fields) async {
    await FirebaseFirestore.instance.collection(collname).doc(docname).update(fields);
    print('data updated');

    _update_regi_controller.clear();

    _update_bate_controller.clear();
    _update_bats_controller.clear();
    _update_col_controller.clear();
    _update_deg_controller.clear();
    _update_dept_controller.clear();
     _update_blood_controller.clear();
    _update_comm_controller.clear();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Uploaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );

    
  }
  TextEditingController _update_regi_controller = TextEditingController();
 TextEditingController _update_bats_controller = TextEditingController();
  TextEditingController _update_bate_controller = TextEditingController();
 TextEditingController _update_col_controller = TextEditingController();
 TextEditingController _update_deg_controller = TextEditingController();
 TextEditingController _update_dept_controller = TextEditingController();
 TextEditingController _update_blood_controller = TextEditingController();
 TextEditingController _update_comm_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return   WillPopScope(
      onWillPop: () async{
         Navigator.pop(context);
         return false;
        
      },
      child:
    Scaffold(

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

            controller: _update_bats_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },

            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.mobile_friendly),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BATCH STARTS *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_bate_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.home),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BATCH ENDS *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_col_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.person_4),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'COLLEGE *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_deg_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.phone),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),
           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'DEGREE *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_dept_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.work),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

 
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'DEPARTMENT *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_blood_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.person_3),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BLOOD GROUP *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_comm_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.phone),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'COMMUNITY *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

         
          SizedBox(height: 20,),

           GestureDetector(
            
               onTap: () {
                  update('CADETS', _update_regi_controller.text, {
                    'BatchFrom': _update_bats_controller.text,
                    'BatchTo': _update_bate_controller.text,
                    'College': _update_col_controller.text,
                    'Degree': _update_deg_controller.text,
                    'Department': _update_dept_controller.text,
                    'Blood Group': _update_blood_controller.text,
                    'Community': _update_comm_controller.text,
                    
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



        




    ));
  }
}