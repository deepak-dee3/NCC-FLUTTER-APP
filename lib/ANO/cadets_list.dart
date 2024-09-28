/*import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ncc/ANO/cadets_all_details.dart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

class ccadet_details extends StatefulWidget{
  @override
  State<ccadet_details> createState() => _ccadet_detailsState();
}

class _ccadet_detailsState extends State<ccadet_details> {
  
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
                scale: 3.0,
                child: Lottie.asset('assets/animation/HCQVEI3eoF.json'),
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

             
            
              

             
              return Column(children:[
                
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
        baseColor: const Color.fromARGB(255, 113, 9, 2),
        highlightColor: Colors.white,
        child:Text('View Details',style: GoogleFonts.prompt(textStyle:TextStyle(color: const Color.fromARGB(255, 113, 9, 2),fontWeight: FontWeight.bold,fontSize: 13),),),),
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
              ]);
            });
          }
        },
        ),
      )])
   ))));
  }
}
*/
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:ncc/ANO/cadets_all_details.dart.dart';

class ccadet_details extends StatefulWidget {
  @override
  State<ccadet_details> createState() => _ccadet_detailsState();
}

class _ccadet_detailsState extends State<ccadet_details> {
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();
  String searchQuery = '';
  String imageUrl1 = ' ';
   Future<void> getImageUrl1(String programName1) async {
    String imagePath1 = 'Images/$programName1.jpeg'; // Construct image path dynamically

    try {
      final ref1 = firebase_storage.FirebaseStorage.instance.ref(imagePath1);
      final url1 = await ref1.getDownloadURL();
      setState(() {
        imageUrl1 = url1;
      });
      print('Image URL: $url1');
    } catch (e) {
      print('Error getting image URL: $e');
      if (e is firebase_storage.FirebaseException) {
        print('Firebase Storage Error: ${e.code}');
        print('Message: ${e.message}');
      } else {
        print('Unknown Error: $e');
      }
      // Provide a placeholder or default image if the image is not found
      setState(() {
        imageUrl1 = ''; // Optionally set a placeholder image URL here
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            flexibleSpace: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: TextField(
                  controller: searchController,
                  focusNode: searchFocusNode,
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase(); // Update search query
                    });
                  },
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 24, 4, 123),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    //floatingLabelAlignment: FloatingLabelAlignment.,
                   
                    labelText: "Search by Regimental Number or Name",
                    labelStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),
                    prefixIcon: Icon(Icons.search, size:33,weight: 100,color: const Color.fromARGB(255, 113, 9, 2)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            searchFocusNode.unfocus(); // Unfocus the search bar when tapping outside
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(10),
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("CADETS")
                          .snapshots(),
                      builder: (context, petSnapShot) {
                        if (petSnapShot.connectionState == ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          final cadetdocs = petSnapShot.data!.docs;

                          // Filter cadetdocs based on search query
                          final filteredCadetDocs = cadetdocs.where((cadet) {
                            final regg_no = cadet['Regimental_number']?.toString().toLowerCase() ?? '';
                            final cadetname = cadet['name']?.toString().toLowerCase() ?? '';
                            return regg_no.contains(searchQuery) || cadetname.contains(searchQuery);
                          }).toList();

                          return ListView.builder(
                            itemCount: filteredCadetDocs.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final cadet = filteredCadetDocs[index];
                              final regg_no = cadet['Regimental_number'] ?? 'no number';
                              final cadetname = cadet['name'] ?? 'no name';
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

                              return Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
                                   
                                    elevation: 10,
                                    shadowColor: Colors.black,
                                    child: Container(
                                      height: 130,
                                      decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),
                                      child: ListTile(
                                       
                                        contentPadding: EdgeInsets.all(20),
                                        title: Text(
                                          regg_no,
                                          style: GoogleFonts.blackOpsOne(
                                            textStyle: TextStyle(
                                              fontFamily: 'Prompt',
                                              color: const Color.fromARGB(255, 24, 4, 123),
                                            ),
                                          ),
                                        ),
                                        subtitle: Text(
                                          cadetname,
                                          style: GoogleFonts.acme(
                                            textStyle: TextStyle(
                                              fontFamily: 'Prompt',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                    

                                        trailing: GestureDetector(
                                          child: Shimmer.fromColors(
                                            baseColor: const Color.fromARGB(255, 113, 9, 2),
                                            highlightColor: Colors.white,
                                            child: Text(
                                              'View Details',
                                              style: GoogleFonts.prompt(
                                                textStyle: TextStyle(
                                                  color: const Color.fromARGB(255, 113, 9, 2),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ImageFromFirebase(
                                                  cadetname: cadetname,
                                                  regg_no: regg_no,
                                                  dtrate: dtrate,
                                                  grp: grp,
                                                  btn: btn,
                                                  accnum: accnum,
                                                  accbrnch: accbrnch,
                                                  phn: phn,
                                                  adrs: adrs,
                                                  ftname: ftname,
                                                  ftphn: ftphn,
                                                  ftocc: ftocc,
                                                  mtname: mtname,
                                                  mtphn: mtphn,
                                                  mtocc: mtocc,
                                                  adh: adh,
                                                  bats: bats,
                                                  bate: bate,
                                                  clg: clg,
                                                  deg: deg,
                                                  dpt: dpt,
                                                  bl: bl,
                                                  com: com,
                                                  ifsc: ifsc,
                                                  DOB: dob,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
class ccadet_details extends StatefulWidget {
  @override
  State<ccadet_details> createState() => _ccadet_detailsState();
}

class _ccadet_detailsState extends State<ccadet_details> {
  // Controller for the search bar
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 25),

                // Animation Container
                Container(
                  height: 250,
                  width: 100,
                  child: Center(
                    child: Transform.scale(
                      scale: 3.0,
                      child: Lottie.asset('assets/animation/HCQVEI3eoF.json'),
                    ),
                  ),
                ),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: "Search by Regimental Number or Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.toLowerCase(); // Update search query
                      });
                    },
                  ),
                ),

                // List of Cadets
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(10),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("CADETS").snapshots(),
                    builder: (context, petSnapShot) {
                      if (petSnapShot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final cadetdocs = petSnapShot.data!.docs;

                        // Filter cadets based on the search query
                        final filteredCadets = cadetdocs.where((cadet) {
                          final regg_no = cadet['Regimental_number']?.toLowerCase() ?? '';
                          final cadetname = cadet['name']?.toLowerCase() ?? '';
                          return regg_no.contains(_searchQuery) || cadetname.contains(_searchQuery);
                        }).toList();

                        return ListView.builder(
                          itemCount: filteredCadets.length,
                          shrinkWrap: true, // Make the ListView scrollable inside SingleChildScrollView
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final cadet = filteredCadets[index];
                            final regg_no = cadet['Regimental_number'] ?? 'no number';
                            final cadetname = cadet['name'] ?? 'no name';
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

                            return Column(
                              children: [
                                Card(
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 130,
                                    decoration: BoxDecoration(color: Colors.blue),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.all(20),
                                      title: Text(
                                        regg_no,
                                        style: GoogleFonts.blackOpsOne(
                                          textStyle: TextStyle(fontFamily: 'Prompt', color: Colors.black),
                                        ),
                                      ),
                                      subtitle: Text(
                                        cadetname,
                                        style: GoogleFonts.acme(
                                          textStyle: TextStyle(fontFamily: 'Prompt', color: Colors.black),
                                        ),
                                      ),
                                      trailing: GestureDetector(
                                        child: Shimmer.fromColors(
                                          baseColor: const Color.fromARGB(255, 113, 9, 2),
                                          highlightColor: Colors.white,
                                          child: Text(
                                            'View Details',
                                            style: GoogleFonts.prompt(
                                              textStyle: TextStyle(
                                                color: const Color.fromARGB(255, 113, 9, 2),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ImageFromFirebase(
                                                cadetname: cadetname,
                                                regg_no: regg_no,
                                                dtrate: dtrate,
                                                grp: grp,
                                                btn: btn,
                                                accnum: accnum,
                                                accbrnch: accbrnch,
                                                phn: phn,
                                                adrs: adrs,
                                                ftname: ftname,
                                                ftphn: ftphn,
                                                ftocc: ftocc,
                                                mtname: mtname,
                                                mtphn: mtphn,
                                                mtocc: mtocc,
                                                adh: adh,
                                                bats: bats,
                                                bate: bate,
                                                clg: clg,
                                                deg: deg,
                                                dpt: dpt,
                                                bl: bl,
                                                com: com,
                                                ifsc: ifsc,
                                                DOB: dob,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/

