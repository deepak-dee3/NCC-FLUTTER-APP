import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ncc/ANO/ano_view_details.dart';
import 'package:ncc/Notification/notification.dart';

class upload_camp_detailss extends StatefulWidget {
  @override
  State<upload_camp_detailss> createState() => _upload_camp_detailsState();
}

class _upload_camp_detailsState extends State<upload_camp_detailss> {
  String? imageurl;
  final ImagePicker _imagepic = ImagePicker();
  TextEditingController _campeve_controller = TextEditingController();

  XFile? _pickedImage;

  pickimage() async {
    XFile? res = await _imagepic.pickImage(source: ImageSource.gallery);

    if (res != null) {
      setState(() {
        _pickedImage = res;
      });
    }
  }

  pickimage_cam() async {
    XFile? res = await _imagepic.pickImage(source: ImageSource.camera);

    if (res != null) {
      setState(() {
        _pickedImage = res;
      });
    }
  }

  uploadfirebase() async {
    try {
      if (_pickedImage == null) {
        Fluttertoast.showToast(msg: 'Please pick an image');
        return;
      }

      if (_campeve_controller.text.isEmpty) {
        Fluttertoast.showToast(msg: 'Please fill in the content first');
        return;
      }

      Reference image_ref =
          FirebaseStorage.instance.ref().child('CAMP_EVENT_Images/${_campeve_controller.text}');

      await image_ref.putFile(File(_pickedImage!.path)).whenComplete(() {
       // Fluttertoast.showToast(msg: 'Image uploaded');

        NotificationService.showInstantNotification("Major Dr.P.S.Raghavendhran", "${_campeve_controller.text} is uploaded");

        _campeve_controller.clear();

      Navigator.push(context, MaterialPageRoute(builder: (context) => ano_view_details()));
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
    return  WillPopScope(
      onWillPop: () async {
        // Handle back button press
        Navigator.pop(context);
        return true;
      },
      child:Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(28),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 15, 18, 117),
                ),
                child: TextFormField(
                  controller: _campeve_controller,
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
    ));
  }
}

/*import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class UploadDetails extends StatefulWidget {
  @override
  _UploadDetailsState createState() => _UploadDetailsState();
}

class _UploadDetailsState extends State<UploadDetails> {
  final ImagePicker _imagePicker = ImagePicker();
  final TextEditingController _textController = TextEditingController();

  XFile? _pickedImage;
  File? _pickedPdf;

  Future<void> _pickImage() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      setState(() {
        _pickedImage = result;
      });
    }
  }

  Future<void> _pickImageFromCamera() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.camera);

    if (result != null) {
      setState(() {
        _pickedImage = result;
      });
    }
  }

  Future<void> _pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _pickedPdf = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_pickedImage == null) {
      Fluttertoast.showToast(msg: 'Please pick an image');
      return;
    }

    try {
      Reference imageRef = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');

      await imageRef.putFile(File(_pickedImage!.path!));

      String imageUrl = await imageRef.getDownloadURL();

      // Save image URL to Firestore or perform other actions as needed
      await FirebaseFirestore.instance.collection('uploaded_images').add({
        'url': imageUrl,
        'uploadedAt': Timestamp.now(),
        'description': _textController.text.trim(),
      });

      Fluttertoast.showToast(msg: 'Image uploaded successfully');

      setState(() {
        _pickedImage = null;
        _textController.clear();
      });
    } catch (e) {
      print('Error uploading image: $e');
      Fluttertoast.showToast(msg: 'Failed to upload image');
    }
  }

  Future<void> _uploadPdf() async {
    if (_pickedPdf == null) {
      Fluttertoast.showToast(msg: 'Please pick a PDF file');
      return;
    }

    try {
      Reference pdfRef = FirebaseStorage.instance.ref().child('pdfs/${DateTime.now().millisecondsSinceEpoch}.pdf');

      await pdfRef.putFile(_pickedPdf!);

      String pdfUrl = await pdfRef.getDownloadURL();

      // Save PDF URL to Firestore or perform other actions as needed
      await FirebaseFirestore.instance.collection('uploaded_pdfs').add({
        'url': pdfUrl,
        'uploadedAt': Timestamp.now(),
        'description': _textController.text.trim(),
      });

      Fluttertoast.showToast(msg: 'PDF uploaded successfully');

      setState(() {
        _pickedPdf = null;
        _textController.clear();
      });
    } catch (e) {
      print('Error uploading PDF: $e');
      Fluttertoast.showToast(msg: 'Failed to upload PDF');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image from Gallery'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _pickImageFromCamera,
              child: Text('Pick Image from Camera'),
            ),
            if (_pickedImage != null) Image.file(File(_pickedImage!.path)),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
            Divider(),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _pickPdf,
              child: Text('Pick PDF'),
            ),
            if (_pickedPdf != null) Text('Selected PDF: ${_pickedPdf!.path.split('/').last}'),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _uploadPdf,
              child: Text('Upload PDF'),
            ),
          ],
        ),
      ),
    );
  }
}*/

