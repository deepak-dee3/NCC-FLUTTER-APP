import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import 'package:ncc/firebase_imp.dart/imp.dart';
import 'package:ncc/main.dart';

class fill_details extends StatefulWidget{

  @override
  State<fill_details> createState() => _fill_detailsState();
}

class _fill_detailsState extends State<fill_details> {

  String ? imageurl;

  final ImagePicker _imagepic = ImagePicker();

  pickimage() async
  {

    XFile ? res = await _imagepic.pickImage(source: ImageSource.gallery);

    if(res != null)
    {
      uploadfirebase(File(res.path));
    }

  }

  uploadfirebase(image)  async{
    try{

      Reference image_ref = FirebaseStorage.instance.ref().child('Images/${_regi_controller.text}');

      await image_ref.putFile(image).whenComplete(() => 
      {

        Fluttertoast.showToast(msg: 'Image uploaded')

      });

      imageurl = await image_ref.getDownloadURL();

    }
    catch(e){
      print('print error occured');

    }

  }


  validateForm() {
  if (_regi_controller.text.isEmpty || _name.text.isEmpty || _aadhar_controller.text.isEmpty || _address_controller.text.isEmpty || _bank_controller.text.isEmpty || _batchends_controller.text.isEmpty || _batchstarts_controller.text.isEmpty ||
  _battalion_controller.text.isEmpty || _blood_controller.text.isEmpty || _branch_controller.text.isEmpty || _college_controller.text.isEmpty  || _community_controller.text.isEmpty || _degree_controller.text.isEmpty || Mother_occupation.isEmpty
  || Mother_number.isEmpty ||_dept_controller.text.isEmpty || _dir_controller.text.isEmpty || _fathermobile_controller.text.isEmpty || _fathername_controller.text.isEmpty  ||_fatheroccupation_controller.text.isEmpty || _fnamecontroller.text.isEmpty
  || _gender_controller.text.isEmpty || _group_controller.text.isEmpty || _lnamecontroller.text.isEmpty || _mobile_controller.text.isEmpty || _mothername_controller.text.isEmpty || _mothernumber_controller.text.isEmpty || _ifsc_controller.text.isEmpty) {

   ScaffoldMessenger.of(context).showSnackBar(SnackBar(padding: EdgeInsets.only(bottom: 20,left:70,top:25),backgroundColor: Colors.red,content: Text('All the details are required *',style:TextStyle(fontSize: 15,color: Colors.white))));

  }
  else{

    Regimental_number = _regi_controller.text.trim();
    Name = _name.text;
   Directorate = _dir_controller.text.trim();
    Group = _group_controller.text.trim();
   Battalion = _battalion_controller.text.trim();
   Firstname = _fnamecontroller.text.trim();
   Lastname = _lnamecontroller.text.trim();
   Gender = _gender_controller.text.trim();
    Mobile = _mobile_controller.text.trim();
   //DOB = _dob_controller.text.trim();
   Batch_Starts = _batchstarts_controller.text.trim();
   Batch_ends = _batchends_controller.text.trim();
   Father_name = _fathername_controller.text.trim();
   Father_number = _fathermobile_controller.text.trim();
   Father_occupation = _fatheroccupation_controller.text.trim();
   Mother_name = _mothername_controller.text.trim();
  Mother_number = _mothernumber_controller.text.trim();
  Mother_occupation = _motheroccupation_controller.text.trim();
 Address = _address_controller.text.trim();
  Blood_group = _blood_controller.text.trim();
   Aadhar = _aadhar_controller.text.trim();
   Community = _community_controller.text.trim();
  College = _college_controller.text.trim();
    Degree = _degree_controller.text.trim();
   Department =_dept_controller.text.trim();
   Bank_number =_bank_controller.text.trim();
  Branch = _branch_controller.text.trim();
  Ifsc = _ifsc_controller.text.trim();

  



 create(Regimental_number,Name,Directorate,Group,Battalion,Firstname,Lastname,Gender,Mobile,Batch_Starts,Batch_ends,Father_name,Father_number,Father_occupation,Mother_name,Mother_number,Mother_occupation,Address,Blood_group,Aadhar,Community,College,Degree,Department,Bank_number,Branch,Ifsc);


        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));


        _regi_controller.clear();
        
    _dir_controller.clear();
   _group_controller .clear();
   _battalion_controller.clear();
  _fnamecontroller.clear();
   _lnamecontroller .clear();
  _gender_controller .clear();
   _mobile_controller.clear();
  _batchstarts_controller  .clear();
  _batchends_controller.clear();
  _fathername_controller  .clear();
  _fathermobile_controller .clear();
   _fatheroccupation_controller.clear();
_mothername_controller .clear();
   _mothernumber_controller.clear();
  _motheroccupation_controller.clear();
   _address_controller .clear();
   _blood_controller .clear();
    _aadhar_controller.clear();
  _community_controller .clear();
   _college_controller .clear();
   _dept_controller.clear();
   _bank_controller .clear();
   _branch_controller.clear();

  }
}

  

  

  String Regimental_number = " ";
  String Name = " ";
  String Directorate = " ";
  String Group = " ";
  String Battalion = " ";
  String Firstname = " " ;
  String Lastname = " ";
  String Gender = " ";
   String Mobile = " ";
  String DOB = " ";
  String Batch_Starts = " " ;
  String Batch_ends = " ";
  String Father_name = " ";
  String Father_number = " ";
  String Father_occupation = " " ;
  String Mother_name = " ";
  String Mother_number = " ";
   String Mother_occupation = " ";
  String Address = " ";
  String Blood_group = " " ;
  String Aadhar = " ";
  String Community = " ";
  String College = " ";
   String Degree = " ";
  String Department = " ";
  String Bank_number = " " ;
  String Branch = " ";
  String Ifsc = " ";
  //String Community = " ";

  TextEditingController _regi_controller = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController  _dir_controller= TextEditingController();
  TextEditingController _group_controller = TextEditingController();
  TextEditingController _battalion_controller = TextEditingController();
  TextEditingController _fnamecontroller= TextEditingController();
  TextEditingController _lnamecontroller = TextEditingController();
  TextEditingController _gender_controller = TextEditingController();
  TextEditingController  _mobile_controller= TextEditingController();
  TextEditingController _degree_controller = TextEditingController();
  TextEditingController _batchstarts_controller = TextEditingController();
  TextEditingController _batchends_controller= TextEditingController();
  TextEditingController _fathername_controller = TextEditingController();
  TextEditingController _fathermobile_controller = TextEditingController();
  TextEditingController  _fatheroccupation_controller= TextEditingController();
  TextEditingController _mothername_controller = TextEditingController();
  TextEditingController _mothernumber_controller = TextEditingController();
  TextEditingController _motheroccupation_controller= TextEditingController();
  TextEditingController _address_controller = TextEditingController();
  TextEditingController _blood_controller = TextEditingController();
  TextEditingController  _aadhar_controller= TextEditingController();
  TextEditingController _community_controller = TextEditingController();
  TextEditingController _college_controller = TextEditingController();
  TextEditingController _dept_controller= TextEditingController();
  TextEditingController _bank_controller = TextEditingController();
  TextEditingController _branch_controller = TextEditingController();
  TextEditingController _ifsc_controller = TextEditingController();
  


  Future<void> _selectdate() async{

    DateTime? _picked = await showDatePicker(context: context,
    initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));

    if(_picked!=null)
    {
      setState(() {
        _datecontroller.text = _picked.toString().split(" ")[0];
      });
    }

  }

  TextEditingController _datecontroller = TextEditingController();

  @override

  
  Widget build(BuildContext context) {
    

    return   
    Scaffold(
      resizeToAvoidBottomInset: false,

      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Container(
          color: Colors.blue.withOpacity(0.2),
        child:Column(children: [
          SizedBox(height: 80,),

          Align(alignment: Alignment.topLeft,
            child:Text('    Cadet Details',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.red)),),
            
            SizedBox(height: 10,),

          Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _regi_controller,

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
           Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _name,
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
             

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'NAME',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),


           Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _dir_controller,
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

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'DIRECTORATE',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

           Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _group_controller,
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

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'GROUP',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
           Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _battalion_controller,
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

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BATTALION',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

        /* Row(children:[ Padding(padding:EdgeInsets.all(10),child:TextFormField(
            decoration: InputDecoration(hintText: 'First Name',hintStyle: TextStyle(fontSize: 13),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
         /* Padding(padding:EdgeInsets.all(30),child:TextFormField(
            decoration: InputDecoration(hintText: 'Last Name',hintStyle: TextStyle(fontSize: 13),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          ))*/
          ])  */

          Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _fnamecontroller,
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
            
              hintText: 'FIRST NAME',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(
                
                borderRadius: BorderRadius.circular(20)),),
            
          )),

          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _lnamecontroller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },

            keyboardType: TextInputType.name,
            
            decoration: InputDecoration(prefixIconColor: Color.fromARGB(255, 29, 2, 110),
            

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
            
              prefixIcon: Icon(Icons.person_2_outlined),
              hintText: 'LAST NAME',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _gender_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },

            keyboardType: TextInputType.name,
            
            decoration: InputDecoration(prefixIconColor: Color.fromARGB(255, 29, 2, 110),
            

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
            
              prefixIcon: Icon(Icons.post_add_outlined),
              hintText: 'JD / JW / SD / SW',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

           Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _mobile_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(prefixIcon: Icon(Icons.phone),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'MOBILE NUMBER ',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),


          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _datecontroller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            decoration: InputDecoration(prefixIcon: Icon(Icons.date_range),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'DATE OF BIRTH',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
              readOnly: true,
              onTap:(){
               _selectdate();
              },
              
            
          )),
          Padding(padding:EdgeInsets.all(15),child:TextFormField(

            controller: _batchstarts_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.arrow_circle_right),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BATCH STARTS',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _batchends_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.arrow_circle_left),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BATCH ENDS',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _fathername_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.person_4_outlined),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'FATHER\'S NAME',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
           Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _fathermobile_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(prefixIcon: Icon(Icons.phone_android),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'FATHER\'S NUMBER ',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),


          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _fatheroccupation_controller,
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
              hintText: 'FATHER\'S OCCUPATION',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _mothername_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.person_3_outlined),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'MOTHER\'S NAME',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
           Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _mothernumber_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(prefixIcon: Icon(Icons.phone_android),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),


            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'MOTHER\'S NUMBER ',hintStyle: TextStyle(fontSize: 13,color: Color.fromARGB(255, 29, 2, 110),),
              
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          

          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _motheroccupation_controller,
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
              hintText: 'MOTHER\'S OCCUPATION',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

           Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _address_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(prefixIcon: Icon(Icons.location_pin),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 29, 2, 110))),
              hintText: 'ADDRESS',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _blood_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.bloodtype),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BLOOD GROUP',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _aadhar_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(prefixIcon: Icon(Icons.attach_file),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'AADHAR NUMBER',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _community_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.people),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'COMMUNITY',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
           Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _college_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.school),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'COLLEGE / UNIVERSITY',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
           

           Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _degree_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.person_3_outlined),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'DEGREE ',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
           Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _dept_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.person_3_outlined),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'DEPARTMENT',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _bank_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(prefixIcon: Icon(Icons.account_balance),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BANK ACCOUNT NUMBER',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _branch_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(prefixIcon: Icon(Icons.account_tree_outlined),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'BRANCH NAME',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),
          Padding(padding:EdgeInsets.all(15),child:TextFormField(
            controller: _ifsc_controller,
            keyboardType: TextInputType.name,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
            decoration: InputDecoration(prefixIcon: Icon(Icons.code),
             prefixIconColor: Color.fromARGB(255, 29, 2, 110),

            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Color.fromARGB(255, 29, 2, 110))),
              hintText: 'IFSC CODE',hintStyle: TextStyle(fontSize: 13,color:Color.fromARGB(255, 29, 2, 110)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),),
            
          )),

        /*  ElevatedButton(onPressed: () async{

            ImagePicker imagepicker = ImagePicker();
            XFile? file = await imagepicker.pickImage(source: ImageSource.gallery);
            print('${file?.path}');

            if(file == null) return ;

            String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();


            Reference referenceRoot = FirebaseStorage.instance.ref();
            Reference referenceDirImages = referenceRoot.child('images');

            Reference referenceImageToUpload = referenceDirImages.child(uniquefilename);

            referenceImageToUpload.putFile(File(file!.path));

          }, child: Text('Image')),

          */

          ElevatedButton(onPressed: (){
            pickimage();
          }, child: Text('upload')),
          SizedBox(height:30),
          

          GestureDetector(onTap:(){


  /*  Regimental_number = _regi_controller.text.trim();
    Name = _name.text;
   Directorate = _dir_controller.text.trim();
    Group = _group_controller.text.trim();
   Battalion = _battalion_controller.text.trim();
   Firstname = _fnamecontroller.text.trim();
   Lastname = _lnamecontroller.text.trim();
   Gender = _gender_controller.text.trim();
    Mobile = _mobile_controller.text.trim();
   //DOB = _dob_controller.text.trim();
   Batch_Starts = _batchstarts_controller.text.trim();
   Batch_ends = _batchends_controller.text.trim();
   Father_name = _fathername_controller.text.trim();
   Father_number = _fathermobile_controller.text.trim();
   Father_occupation = _fatheroccupation_controller.text.trim();
   Mother_name = _mothername_controller.text.trim();
  Mother_number = _mothernumber_controller.text.trim();
  Mother_occupation = _motheroccupation_controller.text.trim();
 Address = _address_controller.text.trim();
  Blood_group = _blood_controller.text.trim();
   Aadhar = _aadhar_controller.text.trim();
   Community = _community_controller.text.trim();
  College = _college_controller.text.trim();
    Degree = _degree_controller.text.trim();
   Department =_dept_controller.text.trim();
   Bank_number =_bank_controller.text.trim();
  Branch = _branch_controller.text.trim();

  



 create(Regimental_number,Name,Directorate,Group,Battalion,Firstname,Lastname,Gender,Mobile,Batch_Starts,Batch_ends,Father_name,Father_number,Father_occupation,Mother_name,Mother_number,Mother_occupation,Address,Blood_group,Aadhar,Community,College,Degree,Department,Bank_number,Branch);


        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));


        _regi_controller.clear();
        
    _dir_controller.clear();
   _group_controller .clear();
   _battalion_controller.clear();
  _fnamecontroller.clear();
   _lnamecontroller .clear();
  _gender_controller .clear();
   _mobile_controller.clear();
  _batchstarts_controller  .clear();
  _batchends_controller.clear();
  _fathername_controller  .clear();
  _fathermobile_controller .clear();
   _fatheroccupation_controller.clear();
_mothername_controller .clear();
   _mothernumber_controller.clear();
  _motheroccupation_controller.clear();
   _address_controller .clear();
   _blood_controller .clear();
    _aadhar_controller.clear();
  _community_controller .clear();
   _college_controller .clear();
   _dept_controller.clear();
   _bank_controller .clear();
   _branch_controller.clear(); */
   validateForm();
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
        Text('Completed',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
      
      ),),
      SizedBox(height:20)

          



        ],)
      )
    ));
  }
}

