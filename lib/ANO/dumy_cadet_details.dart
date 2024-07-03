import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';




class cadet_details extends StatefulWidget{
  @override
  State<cadet_details> createState() => _cadet_detailsState();
}

class _cadet_detailsState extends State<cadet_details> {
  
  
  @override
  Widget build(BuildContext context) {

    

   

    
    

    //final storage = FirebaseStorage.getInstance().getReference().child()
   
   return Scaffold(
    body:Container( 
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
            //padding: EdgeInsets.all(10),
            
            
              itemBuilder: (context,index)
            {
              final cadet = cadetdocs[index];
              //final regg_no = cadet['Regimental_number'] ?? 'no number';
              final cadetname = cadet['name'] ?? 'no name';
             // final image_path = cadet['Images/zzz'] ?? 'no image';
            
              

             
              return Column(children:[
                Card(elevation: 10,
                child:Container(
                  height:130,
                child:ListTile(
                //title: Text(cadetdocs[index][docname]),

                //title:Text(regg_no),

                title:Text(cadetname),
                //trailing: Image(image: image_path),
               
               
               
              ))),

              SizedBox(height:15),
              ]);
            });
          }
        },
        ),
      )


    

   );
  }
}

