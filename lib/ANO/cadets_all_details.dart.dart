import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:shimmer/shimmer.dart';
import 'package:metaballs/metaballs.dart';


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
    return  WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:Scaffold(
      //backgroundColor: Colors.blue.shade100,
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
    SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Center(child:Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                BoxShadow(color: Color.fromARGB(255, 29, 8, 97),blurRadius: 10),

              ]),
              child:CircleAvatar(
              

               radius: 100,
                child: imageUrl.isEmpty
                    ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            
                            color: Colors.white,
                          ),
                        )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InteractiveViewer(maxScale: 5,
                          child:
                        Image.network(
                          imageUrl,
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                :Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            color: Colors.white,
                          ),
                        );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Text('Error loading image');
                          },
                        ),),
                      ),
              ),),
            ),

    SizedBox(height:40),
    Padding(padding: EdgeInsets.all(10),
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

      Padding(padding: EdgeInsets.all(10),child:Container(
        

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
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.diversity_2),
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
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.diversity_3),
             prefixIconColor: Color.fromARGB(255, 187, 168, 2),hintText:'${widget.grp.toUpperCase()}' ,hintStyle: TextStyle(
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
          
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.groups),
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
          
          
          decoration: InputDecoration(prefixIcon: Icon(Icons.attach_file),
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
    ),
    

    ]))));
  }
}
