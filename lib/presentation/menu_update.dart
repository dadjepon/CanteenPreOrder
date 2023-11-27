import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:html' as html;


class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  String? _uploadedFileURL;
   html.File? _imageFile;
   String? _confirmationMessage; 
  html.File? _cloudFile; // New state variable
  Uint8List? _fileBytes; // New state variable
  final _cafeteriaController = TextEditingController();
  final _foodDescriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _foodNameController  = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

// Future<void> _pickAndUploadImage() async {
//   var mediaData = await ImagePickerWeb.getImageInfo;
//   if (mediaData != null && mediaData.fileName != null) {
//     String mimeType = mime(Path.basename(mediaData.fileName!)) ?? 'image/png';
//     html.File mediaFile = html.File(mediaData.data as List<Object>, mediaData.fileName!, {'type': mimeType});

//     setState(() {
//       _cloudFile = mediaFile;
//       _fileBytes = mediaData.data;
//     });

//     uploadToFirebaseStorage();
//   } else {
//     // Handle the case when mediaData is null or fileName is null
//     print('No image selected or file name is missing');
//   }
// }

  Future<void> _pickAndUploadImage() async {
    // Create a file input element
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.click();

    // Listen for file selection
    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      if (files!.isNotEmpty) {
        final file = files.first;
        setState(() {
          _imageFile = file;
        });
        uploadToFirebaseStorage();
      }
    });
  }


Future<void> _submitForm() async {
    if (_formKey.currentState!.validate() && _uploadedFileURL != null) {
      // Perform saving data to Firestore
      await FirebaseFirestore.instance.collection('menu').add({
        'cafeteria': _cafeteriaController.text,
        'foodDescription': _foodDescriptionController.text,
        'price': _priceController.text,
        'foodName':_foodNameController.text,
        'foodImage': _uploadedFileURL,
        'timestamp': FieldValue.serverTimestamp(),
      });
      // Handle post submission logic (e.g., show a success message, clear the form, etc.)
      _cafeteriaController.clear();
      _foodDescriptionController.clear();
      _priceController.clear();
      _foodNameController.clear();
      setState(() {
        _uploadedFileURL = null; // Reset the uploaded file URL
        _confirmationMessage = 'Details successfully submitted. You can add new records.';
      });
    } else {
      // Handle the case when form is not valid or image is not uploaded
      print('Form is not valid or no image selected');
    }
  }

// Future<void> uploadToFirebaseStorage() async {
//   if (_cloudFile != null) {
//     String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}_${_cloudFile!.name}';
//     FirebaseStorage storage = FirebaseStorage.instance;
//     try {
//       final ref = storage.ref().child(fileName);
//       await ref.putData(_fileBytes!); // Using putData with Uint8List
//       String downloadURL = await ref.getDownloadURL();
//       setState(() {
//         _uploadedFileURL = downloadURL;
//       });
//       await _storeLinkInFirestore(downloadURL);
//     } catch (e) {
//       print(e); // Handle errors
//     }
//   }
// }

Future<void> uploadToFirebaseStorage() async {
  if (_imageFile != null) {
    String fileName = '${DateTime.now().millisecondsSinceEpoch}_${_imageFile!.name}';
    FirebaseStorage storage = FirebaseStorage.instance;

    try {
      final ref = storage.ref().child(fileName);

      // Use putFile if _imageFile is a File
      // Use putBlob if _imageFile is a Blob
      // Assuming _imageFile is of type html.File, which is analogous to Blob
      await ref.putBlob(_imageFile!); // Updated to putBlob

      String downloadURL = await ref.getDownloadURL();
      setState(() {
        _uploadedFileURL = downloadURL;
      });
      await _storeLinkInFirestore(downloadURL);
    } catch (e) {
      print(e); // Handle errors
    }
  }
}


  Future<void> _storeLinkInFirestore(String imageUrl) async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection('images');
    return collectionRef.add({
      'url': imageUrl,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) => print("Image URL Added"))
      .catchError((error) => print("Failed to add image URL: $error"));
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Menu Item')),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _cafeteriaController,
                  decoration: InputDecoration(labelText: 'Cafeteria Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter cafeteria name' : null,
                ),
                TextFormField(
                  controller: _foodNameController,
                  decoration: InputDecoration(labelText: 'Food Description'),
                  validator: (value) => value!.isEmpty ? 'Please enter a description' : null,
                ),
                TextFormField(
                  controller: _foodDescriptionController,
                  decoration: InputDecoration(labelText: 'Food Name'),
                  validator: (value) => value!.isEmpty ? 'Please enter a Name' : null,
                ),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Please enter a price' : null,
                ),
                SizedBox(height: 20),
                _uploadedFileURL != null ? Image.network(_uploadedFileURL!) : Text('No image selected.'),
                ElevatedButton(
                  onPressed: _pickAndUploadImage,
                  child: Text('Upload Image'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit Menu Item'),
                ),
                 if (_confirmationMessage != null) 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _confirmationMessage!,
                      style: TextStyle(color: Colors.green),
                    ),),
              ],
            ),
          ),
        ),
      ),
    );
  }

   @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _cafeteriaController.dispose();
    _foodDescriptionController.dispose();
    _priceController.dispose();
    _foodNameController.dispose();
    super.dispose();
  }
}