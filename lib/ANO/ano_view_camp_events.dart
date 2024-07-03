import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ano_camp_view_details extends StatefulWidget {
  @override
  State<ano_camp_view_details> createState() => _ano_camp_view_detailsState();
}

class _ano_camp_view_detailsState extends State<ano_camp_view_details> {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<Map<String, dynamic>>> _fetchImageUrlsWithTitles() async {
    List<Map<String, dynamic>> imageList = [];
    try {
      // Reference to the folder
      final ref = _storage.ref().child('CAMP_EVENT_Images');

      // Fetch list of items (images)
      final ListResult result = await ref.listAll();

      // Iterate through each item and fetch download URL
      for (var imageRef in result.items) {
        final url = await imageRef.getDownloadURL();
        final title = imageRef.name; // Use image name as title
        imageList.add({'url': url, 'title': title});
      }
    } catch (e) {
      print('Error fetching images: $e');
      // Handle error as needed
    }

    return imageList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 167, 212, 248),
      appBar: AppBar(
        title: Text(''),
        backgroundColor: const Color.fromARGB(255, 164, 210, 248),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchImageUrlsWithTitles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No images found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final imageUrl = snapshot.data![index]['url'];
                final title = snapshot.data![index]['title'];

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      height: 250, // Adjust container height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue,
                        image: DecorationImage(
                          image: NetworkImage(imageUrl,),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  /* Text(
                                    'Description or additional details',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
