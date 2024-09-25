import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
     /* for (var imageRef in result.items) {
        final url = await imageRef.getDownloadURL();
        final title = imageRef.name; // Use image name as title
        imageList.add({'url': url, 'title': title});
      }*/
       for (var imageRef in result.items) {
        final url = await imageRef.getDownloadURL();
        final title = imageRef.name ?? null; // Use image name as title
        final metadata = await imageRef.getMetadata();
        final timeCreated = metadata.timeCreated;
        imageList.add({'url': url, 'title': title, 'timeCreated': timeCreated});
      }

      // Sort images by creation date, most recent first
      imageList.sort((a, b) => b['timeCreated'].compareTo(a['timeCreated']));
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
                    imageProvider:  CachedNetworkImageProvider(images[index]['url']),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    heroAttributes: PhotoViewHeroAttributes(tag: images[index]['url']),
                  );
                },
                scrollPhysics: BouncingScrollPhysics(),
                backgroundDecoration: BoxDecoration(color: Colors.black),
                pageController: PageController(initialPage: initialIndex),
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
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:Scaffold(
     // backgroundColor: Color.fromARGB(255, 167, 212, 248),
      
      body:Column(children:[

        SizedBox(height: MediaQuery.of(context).size.height * 0.10,),

         Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 2.0, 
   
            child:Lottie.asset('assets/animation/Animation - 1721542924636.json')),),

            SizedBox(height:20),


       FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchImageUrlsWithTitles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child:  Container(alignment: Alignment.center,
            height: 250,
            width: 100,child:Transform.scale(
            scale: 2.0, 
   
            child:Lottie.asset('assets/animation/Animation - 1722269088878.json')),),);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No images found'));
          } else {
            return Expanded(child:ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final imageUrl = snapshot.data![index]['url'];
                final title = snapshot.data![index]['title'];

                 final timeCreated = snapshot.data![index]['timeCreated'];
                          final now = DateTime.now();
                          final isNew = now.difference(timeCreated).inHours < 48;

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
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,blurRadius: 7,
                            )
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.blue,
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            if (isNew)
                                        Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              'NEW',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
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
                                      maxLines: null,
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
            ));
          }
        },
      ),
    ])));
  }
}

