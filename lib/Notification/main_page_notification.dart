/*import 'package:flutter/material.dart';

class dismissible extends StatefulWidget{
  @override
  State<dismissible> createState() => _dismissibleState();
}

class _dismissibleState extends State<dismissible> {

  List<String> fruits = ['Apple','Mango','Orange','Pine'];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('Dissmissible Text'),),


      body:ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (context,index) {
        final fruit = fruits[index];


        return Dismissible(key: Key(fruit),

        background: Container(color:Colors.red),
        secondaryBackground: Container(color: Colors.green,),



         child:Card(child: ListTile(title:Text(fruits[index]))),onDismissed: (direction) {

          if(direction == DismissDirection.startToEnd){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(fruits[index])));
          }
          else{

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text(fruits[index])));



          }
          
        },);
      })
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:lottie/lottie.dart';

class cadet_vview_events extends StatefulWidget {
  @override
  State<cadet_vview_events> createState() => _cadet_vview_eventsState();
}

class _cadet_vview_eventsState extends State<cadet_vview_events> {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  List<String> dismissedTitles = []; // To keep track of dismissed items

  Future<List<String>> _fetchImageTitles() async {
    List<String> titles = [];
    try {
      // Reference to the folder
      final ref = _storage.ref().child('CAMP_EVENT_Images');

      // Fetch list of items (images)
      final ListResult result = await ref.listAll();

      // Iterate through each item and fetch the title
      for (var imageRef in result.items) {
        final title = imageRef.name; // Use image name as title
        titles.add(title);
      }
    } catch (e) {
      print('Error fetching images: $e');
      // Handle error as needed
    }

    return titles;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        // backgroundColor: const Color.fromARGB(255, 164, 210, 248),
        body: Column(
          children: [
            Center(
              child: Container(
                height: 250,
                width: 100,
                child: Transform.scale(
                  scale: 2.0,
                  child: Lottie.asset('assets/animation/Animation - 1721316481945.json'),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<String>>(
                future: _fetchImageTitles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No images found'));
                  } else {
                    // Filter out dismissed items
                    final filteredTitles = snapshot.data!
                        .where((title) => !dismissedTitles.contains(title))
                        .toList();

                    return ListView.builder(
                      padding: EdgeInsets.all(20.0),
                      itemCount: filteredTitles.length,
                      itemBuilder: (context, index) {
                        final title = filteredTitles[index];
                        return Dismissible(
                          key: Key(title), // Use a unique key for each item
                          onDismissed: (direction) {
                            setState(() {
                              dismissedTitles.add(title); // Add to dismissed list
                            });
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          secondaryBackground: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Card(
                            elevation: 10,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 100, // Adjust container height as needed
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
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
            ),
          ],
        ),
      ),
    );
  }
}
