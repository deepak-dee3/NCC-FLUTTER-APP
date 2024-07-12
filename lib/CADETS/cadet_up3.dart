import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:ncc/CADETS/cadet_update_profile.dart';

class cadet_up3 extends StatefulWidget{
  @override
  State<cadet_up3> createState() => _cadet_up3State();
}

class _cadet_up3State extends State<cadet_up3> {



  update(String collname, String docname, Map<String, dynamic> fields) async {
    await FirebaseFirestore.instance.collection(collname).doc(docname).update(fields);
    print('data updated');

    _update_regi_controller.clear();
    _update_accnum_controller.clear();
    _update_accbr_controller.clear();
    _update_ifsc_controller.clear();
    _update_adh_controller.clear();

   // SnackBar(content: content)
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Uploaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );

    
  }

 TextEditingController _update_regi_controller = TextEditingController();
  TextEditingController _update_accnum_controller = TextEditingController();

 TextEditingController _update_accbr_controller = TextEditingController();

 TextEditingController _update_ifsc_controller = TextEditingController();

 TextEditingController _update_adh_controller = TextEditingController();





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

            controller: _update_accnum_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.account_balance),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'ACCOUNT NUMBER *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_accbr_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.account_tree),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BRANCH *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_ifsc_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.code),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'IFSC *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_adh_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },


            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.attach_file),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

             


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'ADHAR NUMBER *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height: 20,),

          //ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.upgrade), label:  Text('Complete'))


           GestureDetector(
             // onTap: () {
               // uploadfirebase();

              // update('CADETS', 'update_regi_controller', 'Regimental_number', f1, f2, f3, f4)
               onTap: () {
                  update('CADETS', _update_regi_controller.text, {
                    'Regimental_number': _update_regi_controller.text,
                    'BANK ACCOUNT NUMBER': _update_accnum_controller.text,
                    'BANK BRANCH': _update_accbr_controller.text,
                    'IFSC': _update_ifsc_controller.text,
                    'ADHAR NUMBER': _update_adh_controller.text,
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