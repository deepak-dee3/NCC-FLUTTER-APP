import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RetrieveImagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Uploaded Images")),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('images').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No images found."));
          }

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var imageUrl = snapshot.data!.docs[index]['url'];
              return Image.network(imageUrl, fit: BoxFit.cover);
            },
          );
        },
      ),
    );
  }
}
