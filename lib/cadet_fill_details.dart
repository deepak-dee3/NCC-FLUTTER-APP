import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncc/firebase_imp.dart/imp.dart';
import 'package:ncc/main.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:quickalert/quickalert.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionService {
  // Secret key and IV for encryption
  static final key = encrypt.Key.fromUtf8('16charactersecre'); // 16-character key
  static final iv = encrypt.IV.fromLength(16); // 16-byte IV for AES encryption

  // Encrypt text
  static String encryptText(String plainText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64; // Return encrypted text in base64 format
  }

  // Decrypt text
  static String decryptText(String encryptedText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    return decrypted;
  }
}

class fill_details extends StatefulWidget{
  final String email;
  
  fill_details({required this.email});

  @override
  State<fill_details> createState() => _fill_detailsState();
}

class _fill_detailsState extends State<fill_details> {

  final _formKey = GlobalKey<FormState>();

  String ? imageurl;
  final ImagePicker _imagepic = ImagePicker();
  pickimage() async
  {
    XFile ? res = await _imagepic.pickImage(source: ImageSource.gallery);
    if (res != null) {
      File imageFile = File(res.path);
      int fileSize = await imageFile.length();

      // Check if image size is below 300 KB (307200 bytes)
      if (fileSize <= 200 * 1024) {
        uploadfirebase(imageFile);
      } else {
        Fluttertoast.showToast(
          msg: 'Please pick an image below 200 KB in size.',
          toastLength: Toast.LENGTH_LONG,
        );}}}

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

    }}

    validateForm() {
    if (_formKey.currentState!.validate()) { 
      try{

      



       Regimental_number = _regi_controller.text.trim();
       Email = widget.email.trim();
    Name = _name.text;
   Directorate = _dir_controller.text.trim();
    Group = _group_controller.text.trim();
   Battalion = _battalion_controller.text.trim();
   Firstname = _fnamecontroller.text.trim();
   Lastname = _lnamecontroller.text.trim();
   Gender = _gender_controller.text.trim();
    Mobile = _mobile_controller.text.trim();
   DOB = _dob_controller.text.trim();
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

      
      // **Use formKey to validate form**
      // Process data here
      create(Regimental_number,Email,Name,Directorate,Group,Battalion,Firstname,Lastname,Gender,Mobile,Batch_Starts,Batch_ends,Father_name,Father_number,Father_occupation,Mother_name,Mother_number,Mother_occupation,Address,Blood_group,Aadhar,Community,College,Degree,Department,Bank_number,Branch,Ifsc,DOB);

          //  create(EncryptionService.encryptText(_regi_controller.text.trim()),
          //  EncryptionService.encryptText(widget.email.trim()),
          //  EncryptionService.encryptText(_name.text),
          //  EncryptionService.encryptText(_dir_controller.text.trim()),
          //  EncryptionService.encryptText(_group_controller.text.trim()),
          //  EncryptionService.encryptText(_battalion_controller.text.trim()),
          //  EncryptionService.encryptText(_fnamecontroller.text.trim()),
          //  EncryptionService.encryptText(_lnamecontroller.text.trim()),
          //  EncryptionService.encryptText(_gender_controller.text.trim()),
          //  EncryptionService.encryptText(_mobile_controller.text.trim()),
          //  EncryptionService.encryptText(_dob_controller.text.trim()),
          //  EncryptionService.encryptText(_batchstarts_controller.text.trim()),
          //  EncryptionService.encryptText(_batchends_controller.text.trim()),
          //  EncryptionService.encryptText(_fathername_controller.text.trim()),
          //  EncryptionService.encryptText(_fathermobile_controller.text.trim()),
          //  EncryptionService.encryptText(_fatheroccupation_controller.text.trim()),
          //  EncryptionService.encryptText(_mothername_controller.text.trim()),
          //  EncryptionService.encryptText(_mothernumber_controller.text.trim()),
          //  EncryptionService.encryptText(_motheroccupation_controller.text.trim()),



          //  EncryptionService.encryptText(_address_controller.text.trim()),
          //   EncryptionService.encryptText(_blood_controller.text.trim()),
          //  EncryptionService.encryptText(_aadhar_controller.text.trim()),
          //  EncryptionService.encryptText(_community_controller.text.trim()),
          //  EncryptionService.encryptText(_college_controller.text.trim()),
          //  EncryptionService.encryptText(_degree_controller.text.trim()),
          //  EncryptionService.encryptText(_dept_controller.text.trim()),
          //  EncryptionService.encryptText(_bank_controller.text.trim()),
          //  EncryptionService.encryptText(_branch_controller.text.trim()),
          //  EncryptionService.encryptText(_ifsc_controller.text.trim()),
          // //  EncryptionService.encryptText(),
          // //  EncryptionService.encryptText(),

          //  );


      _dir_controller.clear();
   _group_controller .clear();
   _battalion_controller.clear();
  _fnamecontroller.clear();
   _lnamecontroller .clear();
  _gender_controller .clear();
   _mobile_controller.clear();
   _dob_controller.clear();
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

  
     QuickAlert.show(
    context: context,
    type: QuickAlertType.success,
    text: 'Information Uploaded Successfully!',
    headerBackgroundColor: Colors.blue,
    onConfirmBtnTap: () {
      // Navigate to Home after alert is dismissed
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
        (route) => false,
      );
    },
  );
    }catch(e)
    {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        title: 'Oops...',
        text: 'Sorry, something went wrong',
      );
    }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: EdgeInsets.only(bottom: 20, left: 70, top: 25),
          backgroundColor: Colors.red,
          content: Text('All the details are required *', style: TextStyle(fontSize: 15, color: Colors.white)),
        ),
      );
    }
  }

  String Regimental_number = " ",Name = " ",Directorate = " ",Group = " ";
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
  String Email = " ";
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
  TextEditingController _dob_controller = TextEditingController();
  
  Future<void> _selectdate() async{

    DateTime? _picked = await showDatePicker(context: context,
    initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));

    if(_picked!=null)
    {
      setState(() {
        _dob_controller.text = _picked.toString().split(" ")[0];
      });
    }

  }
  @override

  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    
    return  
     WillPopScope(
      onWillPop: () async{
         Navigator.pop(context);
         return false;
        
      },
      child: 
    Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,

      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Container(
         // color: Colors.blue.withOpacity(0.2),
        child:Column(children: [
           SizedBox(height: screenHeight*0.083,),

             Center(child: Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 2.0, 
   
            child:Lottie.asset('assets/animation/Animation - 1721493362106.json')),),
          ),
            
            SizedBox(height: screenHeight*0.016,),
            Align(alignment: Alignment.topLeft,
            child:Shimmer.fromColors(baseColor: Color.fromARGB(255, 6, 6, 184),highlightColor: Colors.white,
              child:Text('    CADET DETAILS',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 21,color: Color.fromARGB(255, 6, 6, 184))),),),

             SizedBox(height: screenHeight*0.023,),

            Form(
                  key: _formKey, // **Added Form widget with formKey**
                  child: Column(
                    children: [
                      Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Regimental Number *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _regi_controller,

             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else if (!RegExp(r'^TN\d{2}(SDA|SWA|JDA|JWA)\d+$').hasMatch(value)) {
        return 'Enter valid number (e.g., TN23SDA824600)';
      }
                    return null;
                  },

                    
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.numbers_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                        hintText:"Enter your Regimental Number",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                          //hintText:"Enter your Regimental Number",
                    ),
                    
                  ],
                ),
              )),
               SizedBox(height: screenHeight*0.023,),

            

       
           Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rank & Name *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _name,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
                    // controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.person_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                            hintText:"Enter your Rank & Name",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
             
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Directorate *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _dir_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else  if (RegExp(r'\d').hasMatch(value)) {
        return 'The directorate name should not contain numbers';
      }
                    return null;
                  },
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.diversity_2_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                            hintText:"Enter your Directorate ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Group *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _group_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else  if (RegExp(r'\d').hasMatch(value)) {
        return 'The group name should not contain numbers';
      }
                    return null;
                  },
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.diversity_3_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Group ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
      
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Battalion *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _battalion_controller,
             validator: (value) {
  if (value == null || value.isEmpty) {
    return "Fill this required field";
  }
  // Check if value contains both numbers and alphabets
  else if (!RegExp(r'^(?=.*[0-9])(?=.*[a-zA-Z])').hasMatch(value)) {
    return "eg : 15 BN , Erode";
  }
  return null; // Valid input
}
,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.groups_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                        hintText:"Enter your Battalion ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

         
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "First Name *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _fnamecontroller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else  if (RegExp(r'\d').hasMatch(value)) {
        return 'The first name should not contain numbers';
      }
                    return null;
                  },
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.person_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your First Name ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

         
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Last Name *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _lnamecontroller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else  if (RegExp(r'\d').hasMatch(value)) {
        return 'The last name should not contain numbers';
      }
                    return null;
                  },
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
prefixIcon: Icon(Icons.person_2_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your last Name ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

          Container(
  width: double.infinity,
  margin: EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    color: Colors.blue.withOpacity(0.2),
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.03),
        spreadRadius: 10,
        blurRadius: 3,
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.only(
        left: 20, top: 15, bottom: 5, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "JD / JW / SD / SW *",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: const Color.fromARGB(255, 24, 4, 123),
          ),
        ),
        DropdownButtonFormField<String>(
          value: null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Fill this required field";
            }
            return null;
          },
          onChanged: (String? newValue) {
            // Handle dropdown value change
            setState(() {
              _gender_controller.text = newValue!;
            });
          },
          items: ['JD', 'JW', 'SD', 'SW'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.post_add_rounded),
            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
            hintText: "Select JD / JW / SD / SW",
            hintStyle: TextStyle(color: Color(0xff67727d), fontSize: 13),
            border: InputBorder.none,
          ),
        ),
      ],
    ),
  ),
)
,
          
              SizedBox(height: screenHeight*0.023,),

        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mobile Number *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _mobile_controller,
             validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your mobile number';
  } else if (value.length != 10) {
    return 'Mobile number must be exactly 10 digits';
  } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Please enter a valid mobile number';
  }
  return null;
},
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.phone_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText:"Enter your Mobile Number ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),


         
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date Of Birth *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       onTap:(){
               _selectdate();
              },
                       controller: _dob_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    return null;
                  },
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.date_range_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Select your DOB ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Batch Starts *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _batchstarts_controller,
            validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Fill this required field';
  } else if (!RegExp(r'^\d{4}$').hasMatch(value)) {
    return 'Please enter exactly four digits';
  }
  return null;
},
            keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.arrow_circle_right_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText:"Enter the year ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

         
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Batch Ends *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _batchends_controller,
            validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Fill this required field';
  } else if (!RegExp(r'^\d{4}$').hasMatch(value)) {
    return 'Please enter exactly four digits';
  }
  return null;
},
            keyboardType: TextInputType.number,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.arrow_circle_left_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter the year  ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

         
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Father's Name *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _fathername_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                     else if (RegExp(r'\d').hasMatch(value)) {
        return 'Father Name should not contain numbers';
      }
                    return null;
                  },
            keyboardType: TextInputType.name,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.person_4_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText:"Enter your Father's Name ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Father's Number *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _fathermobile_controller,
             validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Fill this required field';
      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
        return 'Please enter exactly 10 digits';
      }
      return null;
    },
            keyboardType: TextInputType.number,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                        prefixIcon: Icon(Icons.phone_android_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Father's Number  ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),


            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Father's Occupation *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _fatheroccupation_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else  if (RegExp(r'\d').hasMatch(value)) {
        return 'Occupation should not contain numbers';
      }
                    return null;
                  },
            keyboardType: TextInputType.text,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.work_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Father's Occupation ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

         
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mother's Name *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _mothername_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else  if (RegExp(r'\d').hasMatch(value)) {
        return 'Mother Name should not contain numbers';
      }
                    return null;
                  },
            keyboardType: TextInputType.name,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.person_3_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Mother's Name ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
         
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mother's  Number *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _mothernumber_controller,
              validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Fill this required field';
      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
        return 'Please enter exactly 10 digits';
      }
      return null;
    },
            keyboardType: TextInputType.number,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                        prefixIcon: Icon(Icons.phone_android_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Mother's Number ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
     
         
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mother's Occupation *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _motheroccupation_controller,
            validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Fill this required field';
      }  if (RegExp(r'\d').hasMatch(value)) {
        return 'Mother Occupation should not contain numbers';
      }
      return null;
    },
            keyboardType: TextInputType.text,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.work_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText:"Enter your Mother's Occupation ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
 controller: _address_controller,
             validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Fill this required field';
      }

      // Regex pattern to check if the address contains a pin code at the end
      final pinCodePattern = RegExp(r'\b\d{6}\b$');
      if (!pinCodePattern.hasMatch(value)) {
        return 'Include "-" with 6 digit pin code at end';
      }

      return null;
    },
    keyboardType: TextInputType.multiline,
    maxLines: null,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                        prefixIcon: Icon(Icons.location_pin),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText:"Enter your Permanent Address ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),

          Container(
  width: double.infinity,
  margin: EdgeInsets.symmetric(horizontal: 20),
  decoration: BoxDecoration(
    color: Colors.blue.withOpacity(0.2),
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.03),
        spreadRadius: 10,
        blurRadius: 3,
      ),
    ],
  ),
  child: Padding(
    padding: const EdgeInsets.only(
        left: 20, top: 15, bottom: 5, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Blood Group *",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 13,
            color: const Color.fromARGB(255, 24, 4, 123),
          ),
        ),
        DropdownButtonFormField<String>(
          value: null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Fill this required field';
            }
            return null;
          },
          onChanged: (String? newValue) {
            setState(() {
              _blood_controller.text = newValue!;
            });
          },
          items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.bloodtype_rounded),
            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
            hintText: "Select your Blood Group",
            hintStyle: TextStyle(color: Color(0xff67727d), fontSize: 13),
            border: InputBorder.none,
          ),
        ),
      ],
    ),
  ),
)
,
       
              SizedBox(height: screenHeight*0.023,),
        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aadhar Number *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _aadhar_controller,
             validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Fill this required field';
      } else if (!RegExp(r'^\d{12}$').hasMatch(value)) {
        return 'Please enter a valid 12-digit Aadhar number';
      }
      return null;
    },
    keyboardType: TextInputType.number,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.attach_file_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Aadhar Number ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Community *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                        controller: _community_controller,
            validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Fill this required field';
      } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
        return 'Please enter only alphabetic characters and spaces';
      }
      return null;
    },
    keyboardType: TextInputType.text,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.people_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Community ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
         
        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "College / University *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                        controller: _college_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                     else if(!RegExp(r'^[a-zA-Z\s\-\.]+$').hasMatch(value))
                    {
                      return 'Only alphabetics are allowed';
                    }
                    
                    return null;
                  },
            keyboardType: TextInputType.text,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.school_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your College / University Name ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
           

       
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Degree *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _degree_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else if(!RegExp(r'^[a-zA-Z\s\-\.]+$').hasMatch(value))
                    {
                      return 'Only alphabetics are allowed';
                    }
                    return null;
                  },
            keyboardType: TextInputType.text,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                        prefixIcon: Icon(Icons.book_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Degree ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
       
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Department *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _dept_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else if(!RegExp(r'^[a-zA-Z\s\-\.]+$').hasMatch(value))
                    {
                      return 'Only alphabetics are allowed';
                    }
                    return null;
                  },
            keyboardType: TextInputType.name,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.sell_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Department ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
       
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bank Account Number *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                       controller: _bank_controller,
            validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Fill this required field';
      } else if (!RegExp(r'^[0-9\s\-]+$').hasMatch(value)) {
        return 'Please enter a valid bank account number';
      }
      return null;
    },
    keyboardType: TextInputType.number,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                         prefixIcon: Icon(Icons.account_balance_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your Account Number ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
       
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Branch Name *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                     controller: _branch_controller,
             validator: (value){
                    if(value == null || value.isEmpty)
                    {
                      return "Fill this required field";
                    }
                    else if (!RegExp(r'^[a-zA-Z\s\-\.]+$').hasMatch(value)) {
        return 'Please enter a valid branch name without numbers';
      }
                    return null;
                  },
            keyboardType: TextInputType.text,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.account_tree_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText:"Enter your Branch  ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
        
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.03),
                      spreadRadius: 10,
                      blurRadius: 3,
                      // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 5, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "IFSC Code *",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextFormField( 
                      controller: _ifsc_controller,
            keyboardType: TextInputType.text,
            validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Fill this required field';
      } else if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
        return 'Please enter valid IFSC code';
      }
      return null;
    },
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.code_rounded),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                         hintText:"Enter your IFSC Code ",
                          hintStyle: TextStyle(color: Color(0xff67727d),fontSize:13),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.023,),
         

         Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectableText('Note : ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(width:5),
            SelectableText('Your image should '),
            SizedBox(width:1),
            SelectableText('below 200 kb',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),

          ],
         ),

         SizedBox(height: screenHeight*0.033,),

          GestureDetector(onTap: (){
            pickimage();
          }, child:Container(padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 15,
              offset: Offset(0, 0), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.lightBlueAccent.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 15,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
            child: Text('Upload Image ',style: TextStyle(fontWeight: FontWeight.bold),))),
          SizedBox(height:screenHeight*0.033),
          
          GestureDetector(onTap:(){

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
        Shimmer.fromColors(highlightColor: Colors.black,baseColor:const Color.fromARGB(255, 255, 255, 255) ,
          child:Text('Completed',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)))
      
      ),),
      SizedBox(height:20)

        ],)
      )
    ])))));
  }
}

