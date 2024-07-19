import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:lottie/lottie.dart';
import 'package:metaballs/metaballs.dart';
import 'package:ncc/CADETS/cadet_main_page.dart';

class cadet_up2 extends StatefulWidget{
  @override
  State<cadet_up2> createState() => _cadet_up2State();
}

class _cadet_up2State extends State<cadet_up2> {

  update(String collname, String docname, Map<String, dynamic> fields) async {
    await FirebaseFirestore.instance.collection(collname).doc(docname).update(fields);
    print('data updated');
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Uploaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );

    _update_regi_controller.clear();

     _update_btn_controller.clear();
    _update_dir_controller.clear();
    _update_name_controller.clear();
    _update_group_controller.clear();

    _update_phn_controller.clear();
    _update_add_controller.clear();
    _update_fname_controller.clear();
    _update_fnum_controller.clear();
    _update_focc_controller.clear();
     _update_mname_controller.clear();
    _update_mnum_controller.clear();
    _update_mocc_controller.clear();
    
    _update_accnum_controller.clear();
    _update_accbr_controller.clear();
    _update_ifsc_controller.clear();
    _update_adh_controller.clear();

     _update_bate_controller.clear();
    _update_bats_controller.clear();
    _update_col_controller.clear();
    _update_deg_controller.clear();
    _update_dept_controller.clear();
     _update_blood_controller.clear();
    _update_comm_controller.clear();


   // SnackBar(content: content)
    
  }
  TextEditingController _update_regi_controller = TextEditingController();

  TextEditingController _update_name_controller = TextEditingController();

 TextEditingController _update_dir_controller = TextEditingController();

 TextEditingController _update_group_controller = TextEditingController();

 TextEditingController _update_btn_controller = TextEditingController();



 TextEditingController _update_phn_controller = TextEditingController();
  TextEditingController _update_add_controller = TextEditingController();
 TextEditingController _update_fname_controller = TextEditingController();
 TextEditingController _update_fnum_controller = TextEditingController();
 TextEditingController _update_focc_controller = TextEditingController();
 TextEditingController _update_mname_controller = TextEditingController();
 TextEditingController _update_mnum_controller = TextEditingController();
 TextEditingController _update_mocc_controller = TextEditingController();

  TextEditingController _update_accnum_controller = TextEditingController();
 TextEditingController _update_accbr_controller = TextEditingController();
 TextEditingController _update_ifsc_controller = TextEditingController();
 TextEditingController _update_adh_controller = TextEditingController();

  TextEditingController _update_bats_controller = TextEditingController();
  TextEditingController _update_bate_controller = TextEditingController();
 TextEditingController _update_col_controller = TextEditingController();
 TextEditingController _update_deg_controller = TextEditingController();
 TextEditingController _update_dept_controller = TextEditingController();
 TextEditingController _update_blood_controller = TextEditingController();
 TextEditingController _update_comm_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:
    Scaffold(

      body:Metaballs(
  color: const Color.fromARGB(255, 66, 133, 244),
  effect: MetaballsEffect.follow(
    growthFactor: 1,
    smoothing: 1,
    radius: 0.5,
  ),
  gradient: LinearGradient(
    colors: [
      const Color.fromARGB(255, 90, 60, 255),
      const Color.fromARGB(255, 120, 255, 255),
    ],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft
  ),
  metaballs: 40,
  animationDuration: const Duration(milliseconds: 200),
  speedMultiplier: 1,
  bounceStiffness: 3,
  minBallRadius: 15,
  maxBallRadius: 40,
  glowRadius: 0.7,
  glowIntensity: 0.6,
  child: 
      SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child:Container(
          child:Column(
            children: [

              SizedBox(height:90),

                Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 2.0, 
   
            child:Lottie.asset('assets/animation/Animation - 1721310244114.json')),),

             

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



              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_phn_controller,

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
              hintText: 'MOBILE NUMBER *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_add_controller,

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
              hintText: 'ADDRESS *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_fname_controller,

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
              hintText: 'FATHER NAME *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_fnum_controller,

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
              hintText: 'FATHER NUMBER *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_focc_controller,

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
              hintText: 'FATHER OCCUPATION *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_mname_controller,

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
              hintText: 'MOTHER NAME *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_mnum_controller,

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
              hintText: 'MOTHER NUMBER *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          SizedBox(height:10),


              Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _update_mocc_controller,

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
              hintText: 'MOTHER OCCUPATION *',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          SizedBox(height: 20,),

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
             // onTap: () {
               // uploadfirebase();

              // update('CADETS', 'update_regi_controller', 'Regimental_number', f1, f2, f3, f4)
               onTap: () {
                  update('CADETS', _update_regi_controller.text, {
                    'Name': _update_name_controller.text,
                    'Directorate': _update_dir_controller.text,
                    'Group': _update_group_controller.text,
                    'Battalion': _update_btn_controller.text,
                    'Mobile': _update_phn_controller.text,
                    'Address': _update_add_controller.text,
                    'Fathers Name': _update_fname_controller.text,
                    'Father Number': _update_fnum_controller.text,
                    'Father Occupation': _update_focc_controller.text,
                    'Mother Name': _update_mname_controller.text,
                    'Mother Number ': _update_mnum_controller.text,
                    'Mother Occupation': _update_mocc_controller.text,
                     'Bank Account Number': _update_accnum_controller.text,
                    'Bank Branch': _update_accbr_controller.text,
                    'Ifsc': _update_ifsc_controller.text,
                    'Aadhar Number': _update_adh_controller.text,
                    'BatchFrom': _update_bats_controller.text,
                    'BatchTo': _update_bate_controller.text,
                    'College': _update_col_controller.text,
                    'Degree': _update_deg_controller.text,
                    'Department': _update_dept_controller.text,
                    'Blood Group': _update_blood_controller.text,
                    'Community': _update_comm_controller.text,
                    
                    
                  });

                  Navigator.push(context, MaterialPageRoute(builder: (context) => cadet_main_page()));
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
    )));
  }
}