import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncc/ANO/ano_view_details.dart';
import 'package:ncc/CADETS/cadet_main_page.dart';
import 'package:ncc/Notification/notification.dart';
import 'package:lottie/lottie.dart';
import 'package:image_compression_flutter/image_compression_flutter.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quickalert/quickalert.dart';

class cadet_upload_achievements extends StatefulWidget{
  @override
  State<cadet_upload_achievements> createState() => _cadet_upload_achievementsState();
}

class _cadet_upload_achievementsState extends State<cadet_upload_achievements> {


   String? imageurl;
  final ImagePicker _imagepic = ImagePicker();
  TextEditingController _camp_achieve_controller = TextEditingController();

  XFile? _pickedImage;

  Future<void> pickimage() async {
    XFile? res = await _imagepic.pickImage(source: ImageSource.gallery);

    if (res != null) {
      setState(() {
        _pickedImage = res;
      });
    }
  }

  Future<void> pickimage_cam() async {
    XFile? res = await _imagepic.pickImage(source: ImageSource.camera);

    if (res != null) {
      setState(() {
        _pickedImage = res;
      });
    }
  }

   Future<File> compressImage(XFile image) async {
  final compressedImageData = await FlutterImageCompress.compressWithFile(
    image.path,
    minWidth: 900,
    minHeight: 900,
    quality: 95,
  );

  if (compressedImageData == null) {
    throw Exception("Error compressing image");
  }

  final tempDir = await getTemporaryDirectory();
  final tempFilePath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
  final compressedImageFile = File(tempFilePath)..writeAsBytesSync(compressedImageData);

  return compressedImageFile;
}


  Future<void> uploadfirebase() async {
    try {
      if (_pickedImage == null) {
        Fluttertoast.showToast(msg: 'Please pick an image');
        return;
      }

      if (_camp_achieve_controller.text.isEmpty) {
        Fluttertoast.showToast(msg: 'Please fill in the content first');
        return;
      }
      QuickAlert.show(
        context: context,
        type: QuickAlertType.loading,
        title: 'Loading',
        text: 'Uploading your image',
      );

    /*  Reference image_ref =  important
          FirebaseStorage.instance.ref().child('ACHIEVEMENTS_BY_C/${_camp_achieve_controller.text}');*/

           // **Added code to get current date and time**
      final now = DateTime.now();
      final formattedDate = "${now.day}-${now.month}-${now.year} ${now.hour}:${now.minute}:${now.second}";

      // **Modified content to include date and time**
      final contentWithDate = "${_camp_achieve_controller.text} (Uploaded on: $formattedDate)";

      // **Updated Firebase Storage reference to include content with date**
      Reference image_ref = FirebaseStorage.instance.ref().child('ACHIEVEMENTS_BY_C/$contentWithDate');

      File compressedFile = await compressImage(_pickedImage!);

      await image_ref.putFile(File(_pickedImage!.path)).whenComplete(() {
       // Fluttertoast.showToast(msg: 'Image uploaded');

        NotificationService.showInstantNotification("Uploaded Successfully", "${_camp_achieve_controller.text} is uploaded");

        _camp_achieve_controller.clear();

      Navigator.push(context, MaterialPageRoute(builder: (context) => cadet_main_page()));
      });

      imageurl = await image_ref.getDownloadURL();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Uploaded successfully'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      print('Error uploading image: $e');
      // Handle error as needed
    }
  }




  @override
  Widget build(BuildContext context) {
    return   WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:
     Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Container(
        child: Column(
          children: [
            SizedBox(height: 80),


            Container(
            height: 250,
            width: 100,child:Transform.scale(
            scale: 1.5, 
   
            child:Lottie.asset('assets/animation/Animation - 1721312844095.json')),),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(28),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 15, 18, 117),
                ),
                child: TextFormField(
                  controller: _camp_achieve_controller,
                  keyboardType: TextInputType.name,
                  style: TextStyle(color: Colors.white), 
                  decoration: InputDecoration(

                    prefixIcon: Icon(Icons.notes),
                    prefixIconColor: Colors.white,
                    hintText: 'Enter the content',
                    hintStyle: TextStyle(fontSize: 13, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 80, top: 30),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {
                        pickimage_cam();
                      },
                      icon: Icon(Icons.camera),
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {
                        pickimage();
                      },
                      icon: Icon(Icons.image),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  SizedBox(width: 15),
                  Text('Camera', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 75),
                  Text('Gallery', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 60),
            GestureDetector(
              onTap: () {
                uploadfirebase();
               
              },
              child: Container(
                width: 220,
                height: 60,
                child: Text('Complete',
                    style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 18, 13, 93),
                ),
              ),
            ),
          ],
        ),
      ),
    )
      
    ));
  }
}