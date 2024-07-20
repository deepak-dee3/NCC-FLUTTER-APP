import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ncc/ANO/cadets_all_details.dart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';




class ccadet_details extends StatefulWidget{
  @override
  State<ccadet_details> createState() => _ccadet_detailsState();
}

class _ccadet_detailsState extends State<ccadet_details> {
  bool _showShimmer = true;
  late List<DocumentSnapshot> filteredCadetDocs; 

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      setState(() {
        _showShimmer = false;
      });
    });
  }
  
  
  @override
  Widget build(BuildContext context) {

    //final storage = FirebaseStorage.getInstance().getReference().child()
   
   return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:Scaffold(
    backgroundColor: Colors.white,
    body:SingleChildScrollView(scrollDirection: Axis.vertical,child:Container(child:Column(children:[
      SizedBox(height:25),

        Container(
            height: 250,
            width: 100,
            child: Center(
              child: Transform.scale(
                scale: 2.5,
                child: Lottie.asset('assets/animation/Animation - 1721311751362.json'),
              ),
            ),
          ),
          
          

    
    Container( 
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
        
        stream: FirebaseFirestore.instance.collection("CADETS").snapshots(),
        builder: (context,petSnapShot)
        {
          if(petSnapShot.connectionState == ConnectionState.waiting)
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else{

            final cadetdocs = petSnapShot.data!.docs;
           // final docname = 'name';


            return ListView.builder(itemCount: cadetdocs.length,

            shrinkWrap: true, // Added to make ListView.builder scrollable inside SingleChildScrollView
                        physics: NeverScrollableScrollPhysics(),
            //padding: EdgeInsets.all(10),
            
            
              itemBuilder: (context,index)
            {
              final cadet = cadetdocs[index];
              final regg_no = cadet['Regimental_number'] ?? 'no number';
              final cadetname = cadet['name'] ?? 'no name';
             // final image_path = cadet['Images'] ?? 'no image';

             final dtrate = cadet['Directorate'] ?? 'no dir';
             final grp = cadet['Group'] ?? 'no grp';
             final btn = cadet['Battalion'] ?? 'no btn';

             final accnum = cadet['Bank Account Number'] ?? 'no bank';
             final accbrnch = cadet['Bank Branch'] ?? 'no branch';


             final phn = cadet['Mobile'] ?? 'no number';
             final adrs = cadet['Address'] ?? 'no address';
             final ftname = cadet['Fathers Name'] ?? 'no name';
             final ftphn = cadet['Father Number'] ?? 'no number';
             final ftocc = cadet['Father Occupation'] ?? 'no occupation';
             final mtname = cadet['Mother Name'] ?? 'no name';
             final mtphn = cadet['Mother Number '] ?? 'no number';
             final mtocc = cadet['Mother Occupation'] ?? 'no occupation';
             final adh = cadet['Aadhar Number'] ?? 'no number';

             final bats = cadet['BatchFrom'] ?? 'no';
             final bate = cadet['BatchTo'] ?? 'no';

             final clg = cadet['College'] ?? 'no';
             final deg = cadet['Degree'] ?? 'no';
             final dpt = cadet['Department'] ?? 'no';
             final bl = cadet['Blood Group'] ?? 'no';
             final com = cadet['Community'] ?? 'no';
             final ifsc = cadet['Ifsc'] ?? 'no';
             final dob = cadet['DOB'] ?? 'no';

             
            
              

             
              return _showShimmer
                                ? Shimmer.fromColors(
                                    baseColor: Colors.blue,
                                    highlightColor: Colors.white,
                                    period: Duration(seconds: 1),
                                    child:Column(children:[
                
                Card(elevation: 10,
                shadowColor: Colors.black,
                child:Container(
                  height:130,
                  decoration: BoxDecoration(color: Colors.blue),
                child:ListTile(
                //title: Text(cadetdocs[index][docname]),

                //title:Text(regg_no),
                contentPadding: EdgeInsets.all(20),

                title:Text(regg_no,style:GoogleFonts.blackOpsOne(textStyle: TextStyle( fontFamily: 'Prompt',color: Colors.black),),),
                subtitle: Text(cadetname,style: GoogleFonts.acme(textStyle:TextStyle( fontFamily: 'Prompt',color: Colors.black),),),
                //trailing: ImageFromFirebase(),
                trailing: Container(

                  child:GestureDetector(
                    child:Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.white,
        child:Text('View Details',style: GoogleFonts.prompt(textStyle:TextStyle(color: Color.fromARGB(255, 179, 41, 32),fontWeight: FontWeight.bold,fontSize: 13),),),),
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ImageFromFirebase(cadetname:cadetname,regg_no: regg_no,dtrate:dtrate,grp:grp,btn:btn,accnum:accnum,accbrnch:accbrnch,phn:phn,adrs:adrs,ftname:ftname,ftphn:ftphn,ftocc:ftocc,mtname:mtname,mtphn:mtphn,mtocc:mtocc,adh:adh,bats:bats,bate:bate,clg:clg,deg:deg,dpt:dpt,bl:bl,com:com,ifsc:ifsc,DOB:dob)));
                    },
                  )
                  

                ) 
              // trailing: Image(image: '${widget.regg_no}'),
                
                //trailing: Image.network('https://th.bing.com/th/id/OIP.XGbSok9Rdnx-zmSkuINqxgHaEo?w=308&h=187&c=7&r=0&o=5&dpr=1.5&pid=1.7',width: 120,),
               // trailing: Image(image: image_path),
               
               
               
              ))),

              SizedBox(height:15),
              ])):Column(children:[
                
                Card(elevation: 10,
                child:Container(
                  height:130,
                  decoration: BoxDecoration(color: Colors.blue),
                child:ListTile(
                //title: Text(cadetdocs[index][docname]),

                //title:Text(regg_no),
                contentPadding: EdgeInsets.all(20),

                title:Text(regg_no,style:GoogleFonts.blackOpsOne(textStyle: TextStyle( fontFamily: 'Prompt',color: Colors.black),),),
                subtitle: Text(cadetname,style: GoogleFonts.acme(textStyle:TextStyle( fontFamily: 'Prompt',color: Colors.black),),),
                //trailing: ImageFromFirebase(),
                trailing: Container(

                  child:GestureDetector(
                    child:Text('View Details',style: GoogleFonts.prompt(textStyle:TextStyle(color: Color.fromARGB(255, 179, 41, 32),fontWeight: FontWeight.bold,fontSize: 13),),),
                    onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ImageFromFirebase(cadetname:cadetname,regg_no: regg_no,dtrate:dtrate,grp:grp,btn:btn,accnum:accnum,accbrnch:accbrnch,phn:phn,adrs:adrs,ftname:ftname,ftphn:ftphn,ftocc:ftocc,mtname:mtname,mtphn:mtphn,mtocc:mtocc,adh:adh,bats:bats,bate:bate,clg:clg,deg:deg,dpt:dpt,bl:bl,com:com,ifsc:ifsc,DOB: dob,)));
                    },
                  )
                  

                ) 
               //trailing: Image(image: '${widget.regg_no}'),
              // trailing: Image.network('${widget.regg_no}'),

                
                //trailing: Image.network('https://th.bing.com/th/id/OIP.XGbSok9Rdnx-zmSkuINqxgHaEo?w=308&h=187&c=7&r=0&o=5&dpr=1.5&pid=1.7',width: 120,),
               // trailing: Image(image: image_path),
               
               
               
              ))),

              SizedBox(height:15),
              ]);
            });
          }
        },
        ),
      )])


    

   ))));
  }
}

