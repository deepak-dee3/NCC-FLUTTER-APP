import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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



  const ImageFromFirebase({Key? key, required this.cadetname, required this.regg_no,required this.dtrate,required this.grp,required this.btn,required this.accnum,required this.accbrnch,required this.adrs,required this.phn,required this.ftname,required this.ftphn,required this.ftocc,required this.mtname,required this.mtphn,required this.mtocc,required this.adh,required this.bate,required this.bats,required this.clg,required this.deg,required this.dpt,required this.bl,required this.com}) : super(key: key);
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
    return Scaffold(
      
      body: SingleChildScrollView(child:Column(
        children:[
          SizedBox(height:100),
        Center(child:Container(
         // color: Colors.red,

          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 200,
          width: 300,
        child: imageUrl.isEmpty
            ? CircularProgressIndicator()
            : Image.network(
              //color: Colors.red,
              width: 100,
              height: 100,

                imageUrl,
                loadingBuilder: (context, child, progress) {
                  return progress == null ? child : CircularProgressIndicator();
                },
                errorBuilder: (context, error, stackTrace) {
                  return Text('Error loading image');
                },
              ),
      ),
    ),

    SizedBox(height:40),
    Padding(padding: EdgeInsets.all(10),child:Text('NCC DETAILS',style: TextStyle(fontWeight: FontWeight.bold),)),

    SizedBox(height:20),

    Container(height:450,width:330,
    decoration:BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),

    child:Column(children: [
      SizedBox(height: 13,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.cadetname}' ,
            border: InputBorder.none),
        ),

        
      )),

      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.cadetname}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.dtrate}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.grp}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.btn}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      
          
    ],)
    ),
    SizedBox(height:20),

    

    Padding(padding: EdgeInsets.all(10),child:Text('PERSONAL DETAILS',style: TextStyle(fontWeight: FontWeight.bold),)),

    SizedBox(height:20),

    Container(height:700,width:330,
    decoration:BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),

    child:Column(children: [
      SizedBox(height: 17,),

     

      

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.phn}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.adrs}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.ftname}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.ftphn}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.ftocc}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.mtname}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.mtphn}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.mtocc}' ,
            border: InputBorder.none),
        ),

        
      )),


      
      
    ],)
    ),

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////

    SizedBox(height:20),

    Padding(padding: EdgeInsets.all(10),child:Text('ACCOUNT DETAILS',style: TextStyle(fontWeight: FontWeight.bold),)),

    SizedBox(height:20),

    Container(height:350,width:330,
    decoration:BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),

    child:Column(children: [
      SizedBox(height: 13,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.accnum}' ,
            border: InputBorder.none),
        ),

        
      )),

      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.accbrnch}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'ifsc code ' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),
      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.adh}' ,
            border: InputBorder.none),
        ),

        
      )),
      
      SizedBox(height: 10,),

      

      

      








      
    ],)
    ),
    SizedBox(height:30),

    
    Padding(padding: EdgeInsets.all(10),child:Text('ADDITIONAL DETAILS',style: TextStyle(fontWeight: FontWeight.bold),)),

    SizedBox(height:20),

    Container(height:620,width:330,
    decoration:BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(20)),

    child:Column(children: [
      SizedBox(height: 13,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.bats}' ,
            border: InputBorder.none),
        ),

        
      )),

      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.bate}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.clg}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.deg}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.dpt}' ,
            border: InputBorder.none),
        ),

        
      )),
      SizedBox(height: 10,),
       SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.bl}' ,
            border: InputBorder.none),
        ),

        
      )),
       SizedBox(height: 10,),

      Padding(padding: EdgeInsets.all(10),child:Container(
        

        decoration: BoxDecoration(
          
          color:Colors.white.withOpacity(0.2),borderRadius: BorderRadius.circular(20),),
        child:TextField(
          
          
          
          decoration: InputDecoration(hintText:'${widget.com}' ,
            border: InputBorder.none),
        ),

        
      )),

      

      

      

      
      
    ],)
    ),
    SizedBox(height:20),





    


    ])));
  }
}
