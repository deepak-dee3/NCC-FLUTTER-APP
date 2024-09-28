import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:ncc/firebase_imp.dart/imp.dart';
import 'package:shimmer/shimmer.dart';
import 'package:metaballs/metaballs.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ImageFromFirebase extends StatefulWidget {
  final String cadetname;
  final String regg_no;
   final String dtrate;
    final String grp;
     final String btn;
     final String accnum;
     final String accbrnch;
  final String adrs;
   final String phn;
    final String ftname;
     final String ftphn;
     final String ftocc;
     final String mtname;
     final String mtphn;
     final String mtocc;
     final String adh;
     final String bats;
     final String bate;
     final String clg;
     final String deg;
     final String dpt;
     final String bl;
     final String com;
     final String ifsc;
     final String DOB;



  const ImageFromFirebase({Key? key, required this.cadetname, required this.regg_no,required this.dtrate,required this.grp,required this.btn,required this.accnum,required this.accbrnch,required this.adrs,required this.phn,required this.ftname,required this.ftphn,required this.ftocc,required this.mtname,required this.mtphn,required this.mtocc,required this.adh,required this.bate,required this.bats,required this.clg,required this.deg,required this.dpt,required this.bl,required this.com,required this.ifsc,required this.DOB}) : super(key: key);
  @override
  _ImageFromFirebaseState createState() => _ImageFromFirebaseState();
}

class _ImageFromFirebaseState extends State<ImageFromFirebase> {
  


  
  String imageUrl = '';
  //String cadet_img_path = 'zzz';
  //String cadet_img_path = '${widget.cadetname}';
  
  

  @override
  void initState() {
    super.initState();
    // Replace 'path/to/your/image' with the path to your image in Firebase Storage
    //getImageUrl('Images/zzz/');
   // getImageUrl('Images/$cadet_img_path');
   getImageUrl('Images/${widget.regg_no}');

  }

  Future<void> getImageUrl(String imagePath) async {
    try {
      // Get download URL from Firebase Storage
      final ref = firebase_storage.FirebaseStorage.instance.ref(imagePath);
      imageUrl = await ref.getDownloadURL();
      setState(() {}); // Update the state to refresh the UI with the new image URL
    } catch (e) {
      print('Error getting image URL: $e');
      // Handle any errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    
    var screenHeight = MediaQuery.of(context).size.height;
    return  WillPopScope(
      
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:Scaffold(
        
      backgroundColor: Colors.white,
      body: /*Metaballs(
  color: Color.fromARGB(255, 37, 3, 226),
  effect: MetaballsEffect.follow(
    growthFactor: 1,
    smoothing: 1,
    radius: 0.5,
  ),
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 5, 41, 226).withOpacity(0.2),
      Color.fromARGB(255, 10, 2, 236).withOpacity(0.2),
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
  child: */
    Stack(
      children: [
        // Background Image
       Align(alignment: Alignment.center,
        child: Container(
         
          height: 200,
          width: 100,
          
          decoration: BoxDecoration(
            
           
            image: DecorationImage(
              image: AssetImage('assets/ncclogo-removebg-preview.png'), // Use your image path here
              fit: BoxFit.contain, // Adjusts the image to cover the entire background
            ),
          ),
        )),SingleChildScrollView(
        child:
         Column(
          children: [
            SizedBox(height: 100),
      GestureDetector(
  onTap: () {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(28),color:Colors.blue.withOpacity(0.3)),
         // color: Colors.blue.withOpacity(0.3),
          child: InteractiveViewer(
            panEnabled: true, // Enables panning (dragging)
            minScale: 1.0,
            maxScale: 4.0, // Allows zooming up to 4x
            child: ClipOval(
              child: Image.network(
                imageUrl.isNotEmpty ? imageUrl : '',
                fit: BoxFit.contain, // Ensures the entire image is seen without cropping
                width: 200,
                height: 200,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300], 
                  child: Icon(Icons.person, size: 100, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  },
  child: CircleAvatar(
    radius: 100, // Adjust radius as needed
    backgroundColor: Colors.blue[50], // Background color
    child: ClipOval(
      child: imageUrl.isNotEmpty
          ? Image.network(
              imageUrl,
              fit: BoxFit.cover, // Use BoxFit.cover to fill the CircleAvatar properly
              width: 200,
              height: 200,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                child: Icon(Icons.person, size: 100, color: Colors.white),
              ),
            )
          : Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                width: 200,
                height: 200,
              ),
            ),
    ),
  ),
)

,
SizedBox(height: screenHeight*0.04,),

   

     Padding(padding: EdgeInsets.all(10),
    child:Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child:Text('NCC DETAILS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),),

        SizedBox(height: 50,),
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
                      "Regimental Number",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                           color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                     //controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                         
                          prefixIcon: Icon(Icons.numbers_sharp),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.regg_no.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
             SizedBox(height: screenHeight*0.022,),


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
                      "Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextField( readOnly: true,
                    // controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.person),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.cadetname.toUpperCase()}',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),


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
                      "Directorate",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                   //  controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        
            
                          prefixIcon: Icon(Icons.diversity_2),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.dtrate.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),

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
                      "Group",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                    // controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.diversity_3),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.grp.toUpperCase()}' ,
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
             SizedBox(height: screenHeight*0.022,),

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
                      "Battalion",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                    // controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.group),
                          prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.btn.toUpperCase()}' ,
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.052,),
    
     Padding(padding: EdgeInsets.all(10),
    child:Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child:Text('PERSONAL DETAILS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),),

         SizedBox(height: screenHeight*0.052,),
   

         
    
    
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
                      "Date Of Birth",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                           color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                     //controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                         
                          prefixIcon: Icon(Icons.date_range),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.DOB}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
             SizedBox(height: screenHeight*0.022,),


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
                      "Mobile Number",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextField( readOnly: true,
                    // controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.phone),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.phn.toUpperCase()}',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
                SizedBox(height: screenHeight*0.022,),


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
                      "Address",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                   //  controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        
            
                          prefixIcon: Icon(Icons.location_pin),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.adrs.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
           SizedBox(height: screenHeight*0.022,),

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
                      "Father's Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                    // controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_4_outlined),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.ftname.toUpperCase()}' ,
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
               SizedBox(height: screenHeight*0.022,),

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
                      "Father Mobile Number",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                    // controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone_android),
                          prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.ftphn.toUpperCase()}' ,
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
               SizedBox(height: screenHeight*0.022,),
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
                      "Father Occupation",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                           color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                     //controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                         
                          prefixIcon: Icon(Icons.work),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.ftocc.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
             SizedBox(height: screenHeight*0.022,),


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
                      "Mother's Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextField( readOnly: true,
                    // controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.person_3_outlined),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.mtname.toUpperCase()}',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),


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
                      "Mother Number",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                   //  controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        
            
                          prefixIcon: Icon(Icons.phone_android),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.mtphn.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),

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
                      "Mother Occupation",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                    // controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.work),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.mtocc.toUpperCase()}' ,
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
               SizedBox(height: screenHeight*0.052,),
                Padding(padding: EdgeInsets.all(10),
    child:Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child:Text('ACCOUNT DETAILS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),),

        SizedBox(height: screenHeight*0.052,),
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
                      "Account Number",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                           color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                     //controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                         
                          prefixIcon: Icon(Icons.account_balance),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.accnum.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),


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
                      "Bank Branch",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextField( readOnly: true,
                    // controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.account_tree_outlined),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.accbrnch.toUpperCase()}',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
           SizedBox(height: screenHeight*0.022,),


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
                      "IFSC Code",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                   //  controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                        
            
                          prefixIcon: Icon(Icons.code),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.ifsc.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
                SizedBox(height: screenHeight*0.022,),

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
                      "Adhar Number",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                    // controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock_person),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.adh.toUpperCase()}' ,
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
                SizedBox(height: screenHeight*0.052,),
    
     Padding(padding: EdgeInsets.all(10),
    child:Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child:Text('ADDITIONAL DETAILS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),),

         SizedBox(height: screenHeight*0.052,),
   

         
    
    
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
                      "Batch Starts",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                           color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                     //controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                         
                          prefixIcon: Icon(Icons.arrow_circle_right),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.bats.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),


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
                      "Batch Ends",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextField( readOnly: true,
                    // controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.arrow_circle_left),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.bate.toUpperCase()}',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),


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
                      "College Name",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                        maxLines: null, 
        
        
                   //  controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                        overflow: TextOverflow.visible,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                         contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        
            
                          prefixIcon: Icon(Icons.school),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.clg.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
               SizedBox(height: screenHeight*0.022,),

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
                      "Degree",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                    // controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.book),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.deg.toUpperCase()}' ,
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),

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
                      "Department",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                    // controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.sell_sharp),
                          prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.dpt.toUpperCase()}' ,
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
              SizedBox(height: screenHeight*0.022,),
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
                      "Blood Group",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                           color: const Color.fromARGB(255, 24, 4, 123),
                          ),
                    ),
                    TextField(
                       readOnly: true,
                     //controller: login_emailcontroller,
               
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                      decoration: InputDecoration(
                         
                          prefixIcon: Icon(Icons.bloodtype),
                            prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.bl.toUpperCase()}',
                           hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                  ],
                ),
              )),
             SizedBox(height: screenHeight*0.022,),


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
                      "Community",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                         // color: Color(0xff67727d)
                         color: const Color.fromARGB(255, 24, 4, 123),
                       
                          ),
                    ),
                    TextField( readOnly: true,
                    // controller: login_emailcontroller,
                
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          ),
                      decoration: InputDecoration(
                        
                          prefixIcon: Icon(Icons.people),
                           prefixIconColor: const Color.fromARGB(255, 24, 4, 123),
                          hintText: '${widget.com.toUpperCase()}',
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none),
                    ),
                    
                  ],
                ),
              )),
               SizedBox(height: screenHeight*0.05,),
                GestureDetector(
                  onTap: ()
                  {
                    Fluttertoast.showToast(msg: 'Double Tap to Delete All Details');
                  },

              onDoubleTap:(){

                delete('CADETS',widget.regg_no);


               
              },child:Container(alignment: Alignment.center,
      height:  screenHeight * 0.08,
      width:double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      //color: Colors.red,

      decoration: BoxDecoration(
         boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 18, 8, 88).withOpacity(0.6),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, 0),
                  ),
                 
                  
                ],
        borderRadius: BorderRadius.circular(40),
        color: const Color.fromARGB(255, 195, 20, 8),
       
      
      ),child:
      
        Shimmer.fromColors(baseColor: Colors.white,highlightColor: Colors.black,
          child:Text('Delete Details',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17,)))
      
      )),
      SizedBox(height: screenHeight*0.05,),

    ]))])));
  }
}

/* Padding(padding: EdgeInsets.all(10),
    child:Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child:Text('NCC DETAILS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),),

    SizedBox(height:20),

    Container(height:450,width:330,
    decoration:BoxDecoration(
      boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 21, 6, 240),
              blurRadius: 10,
            )
          ],
      
      
      color: Color.fromARGB(255, 29, 8, 97).withOpacity(0.9),borderRadius: BorderRadius.circular(10)),

    child:Column(children: [
      SizedBox(height: 19,),

      Padding(padding: EdgeInsets.all(10),child:
      Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(
          readOnly: true,
          
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.numbers_sharp),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),
            
             hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            hintText:'${widget.regg_no.toUpperCase()}' ,
            border: InputBorder.none),
        ),

        
      )),

      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.person),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),
            hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            hintText:'${widget.cadetname.toUpperCase()}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(
            
            prefixIcon: Icon(Icons.diversity_2),
            prefixIconColor: Color.fromARGB(255, 187, 168, 2),
            hintText:'${widget.dtrate.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
          
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(
            
            prefixIcon: Icon(Icons.diversity_3),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.grp.toUpperCase()}' '${widget.btn.toUpperCase()}' '${widget.dtrate.toUpperCase()}' '${widget.cadetname.toUpperCase()}',hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(
            
            prefixIcon: Icon(Icons.groups),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.btn.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),


      
          
    ],)
    ),
    SizedBox(height:20),

    

    Padding(padding: EdgeInsets.all(10),
    child:Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child:Text('PERSONAL DETAILS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),),

    SizedBox(height:20),

    Container(height:870,width:330,
    decoration:BoxDecoration(
      boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 21, 6, 240),
              blurRadius: 10,
            )
          ],
      color: Color.fromARGB(255, 29, 8, 97).withOpacity(0.9),borderRadius: BorderRadius.circular(10)),

    child:Column(children: [
      SizedBox(height: 17,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
         
          decoration: InputDecoration(prefixIcon: Icon(Icons.date_range),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.DOB}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.phone),
           prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'+91 ${widget.phn}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        height: 150,

        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
        maxLines: null, 
        style: TextStyle(overflow: TextOverflow.visible,),
      
          decoration: InputDecoration(prefixIcon: Icon(Icons.location_pin),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            hintStyle: TextStyle(
          fontFamily: 'Lato',
          color: Colors.white, 
        ),
            hintText:'${widget.adrs.toUpperCase()}' ,
            border: InputBorder.none),
            
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.person_4_outlined),
            prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.ftname.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.phone_android),
            prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'+91 ${widget.ftphn.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.work),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.ftocc.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.person_3_outlined),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.mtname.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.phone_android),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'+91 ${widget.mtphn.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.work),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.mtocc.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),


      
      
    ],)
    ),

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    SizedBox(height:20),

    Padding(padding: EdgeInsets.all(10),
    child:Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child:SelectableText('ACCOUNT DETAILS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),),

    SizedBox(height:20),

    Container(height:350,width:330,
    decoration:BoxDecoration(
      boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 21, 6, 240),
              blurRadius: 10,
            )
          ],
      color: Color.fromARGB(255, 29, 8, 97).withOpacity(0.9),borderRadius: BorderRadius.circular(10)),

    child:Column(children: [
      SizedBox(height: 13,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.account_balance),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.accnum.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),

      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(
          readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.account_tree_outlined),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.accbrnch.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.code),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.ifsc.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),
      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(
          readOnly: true,
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.lock_person),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.adh.toUpperCase()}' ,hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      
      SizedBox(height: 10,),

     
      
    ],)
    ),
    SizedBox(height:30),

    
    Padding(padding: EdgeInsets.all(10),
    child:Shimmer.fromColors(
        baseColor: Colors.black,
        highlightColor: Colors.white,
        child:Text('ADDITIONAL DETAILS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)),),

    SizedBox(height:20),

    Container(height:650,width:330,
    decoration:BoxDecoration(
      boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 21, 6, 240),
              blurRadius: 10,
            )
          ],
      color: Color.fromARGB(255, 29, 8, 97).withOpacity(0.9),borderRadius: BorderRadius.circular(10)),

    child:Column(children: [
      SizedBox(height: 20,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
           color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),

          
          //color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),
          ),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.arrow_circle_right),
            prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.bats.toUpperCase()}' ,
          hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),

      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        
        

        decoration: BoxDecoration(
           color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),

          
         // color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),
         ),
        child:TextField(readOnly: true,
        
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.arrow_circle_left),
            prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.bate.toUpperCase()}' ,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
           hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        height: 90,
        

        decoration: BoxDecoration(
        color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),


          
         // color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),
          ),
        child:TextField(readOnly: true,
         maxLines: null, 
        style: TextStyle(overflow: TextOverflow.visible,),
        
        
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.school),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.clg.toUpperCase()}' ,
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
           hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
           color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),
          
          //color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),
),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.book),
          prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.deg.toUpperCase()}' ,
           hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),
          ),
        child:TextField(readOnly: true,
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.sell_sharp),
          prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.dpt.toUpperCase()}' ,
           hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),
       SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(
          readOnly: true,
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.bloodtype),
            prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.bl.toUpperCase()}' ,
           hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color: Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),
       SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(10),),
        child:TextField(
          readOnly: true,
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.people),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.com.toUpperCase()}' ,
           hintStyle: TextStyle(
          fontFamily: 'Lato-Regular',
          color:Colors.white, 
        ),
            border: InputBorder.none),
        ),

        
      )),

    ],)
    ), ]))));*/