/*import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class cadet_view_achievements extends StatefulWidget{
  @override
  State<cadet_view_achievements> createState() => _cadet_view_achievementsState();
}

class _cadet_view_achievementsState extends State<cadet_view_achievements> {


  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<Map<String, dynamic>>> _fetchImageUrlsWithTitles() async {
    List<Map<String, dynamic>> imageList = [];
    try {
      // Reference to the folder
      final ref = _storage.ref().child('ACHIEVEMENTS_BY_C/');

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
    
    return(
      Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 210, 248),
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
                        //borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
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
                              decoration:BoxDecoration(color: Colors.black.withOpacity(0.5),borderRadius: BorderRadius.circular(5)) ,
                              
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
    )
    );
  }
} */

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class cadet_view_achievements extends StatefulWidget {
  @override
  State<cadet_view_achievements> createState() => _cadet_view_achievementsState();
}

class _cadet_view_achievementsState extends State<cadet_view_achievements> {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<List<Map<String, dynamic>>> _fetchImageUrlsWithTitles() async {
    List<Map<String, dynamic>> imageList = [];
    try {
      // Reference to the folder
      final ref = _storage.ref().child('ACHIEVEMENTS_BY_C/');

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

  void _showImage(BuildContext context, int initialIndex, List<Map<String, dynamic>> images) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Stack(
            children: [
              PhotoViewGallery.builder(
                itemCount: images.length,
                builder: (context, index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(images[index]['url']),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    heroAttributes: PhotoViewHeroAttributes(tag: images[index]['url']),
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(color: Colors.black),
                pageController: PageController(initialPage: initialIndex),
                onPageChanged: (index) {},
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 8.0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    images[initialIndex]['title'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 164, 210, 248),
      appBar: AppBar(
        title: Text('Achievements'),
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

                return GestureDetector(
                  onTap: () {
                    _showImage(context, index, snapshot.data!);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        height: 250, // Adjust container height as needed
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
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
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
