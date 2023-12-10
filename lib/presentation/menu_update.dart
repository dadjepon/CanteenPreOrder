import 'package:canteen_preorderapp/models/database_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:html' as html;

class AddFoodItemScreen extends StatefulWidget {
  @override
  _AddFoodItemScreenState createState() => _AddFoodItemScreenState();
}

class _AddFoodItemScreenState extends State<AddFoodItemScreen> {
  String? _uploadedFileURL;
  html.File? _imageFile;
  String? _confirmationMessage;
  final _cafeteriaController = TextEditingController();
  final _foodDescriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _foodNameController = TextEditingController();
  final _statusController = TextEditingController();
  final _menuTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation
  late final DatabaseService _dataService;

  @override
  void initState() {
    _dataService = DatabaseService();
    super.initState();
  }

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
      await _dataService.addFoodItem(
          foodName: _foodNameController.text,
          foodDescription: _foodDescriptionController.text,
          foodImage: _uploadedFileURL!,
          price: _priceController.text,
          availabilityStatus: _statusController.text,
          menuType: _menuTypeController.text,
          timestamp: FieldValue.serverTimestamp().toString(),
          cafeteria: _cafeteriaController.text);
      // Handle post submission logic (e.g., show a success message, clear the form, etc.)
      _cafeteriaController.clear();
      _foodDescriptionController.clear();
      _priceController.clear();
      _foodNameController.clear();
      setState(() {
        _uploadedFileURL = null; // Reset the uploaded file URL
        _confirmationMessage =
            'Details successfully submitted. You can add new records.';
      });
    } else {
      // Handle the case when form is not valid or image is not uploaded
      print('Form is not valid or no image selected');
    }
  }

  Future<void> uploadToFirebaseStorage() async {
    if (_imageFile != null) {
      String fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${_imageFile!.name}';
      FirebaseStorage storage = FirebaseStorage.instance;

      try {
        final ref = storage.ref().child(fileName);

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
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('images');
    return collectionRef
        .add({
          'url': imageUrl,
          'timestamp': FieldValue.serverTimestamp(),
        })
        .then((value) => print("Image URL Added"))
        .catchError((error) => print("Failed to add image URL: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text('Upload Menu Item'),
          backgroundColor: const Color(0xFF6B0808)),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Row(
              // Replace the existing Column widget with a Row widget
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Left column for image upload
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      child: _uploadedFileURL != null
                          ? Image.network(_uploadedFileURL!)
                          : Text('No image selected.'),
                    ),
                    Container(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: _pickAndUploadImage,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.upload_file),
                            SizedBox(width: 10),
                            Text('Upload Image'),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                      ),
                    ),
                    if (_confirmationMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _confirmationMessage!,
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                  ],
                ),

                // Right column for form
                Column(
                  children: <Widget>[
                    // Field name
                    Container(
                      padding: EdgeInsets.all(10),
                      child:
                          Text('Menu Update', style: TextStyle(fontSize: 20)),
                    ),

                    // Field input box
                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: _cafeteriaController,
                        decoration:
                            InputDecoration(labelText: 'Cafeteria Name'),
                        validator: (value) => value!.isEmpty
                            ? 'Please enter cafeteria name'
                            : null,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: _statusController,
                        decoration:
                            InputDecoration(labelText: 'Availabity Status'),
                        validator: (value) => value!.isEmpty
                            ? 'Please enter food availability'
                            : null,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: _foodNameController,
                        decoration: InputDecoration(labelText: 'Food Name'),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter food name' : null,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: _foodDescriptionController,
                        decoration:
                            InputDecoration(labelText: 'Food Description'),
                        validator: (value) => value!.isEmpty
                            ? 'Please enter food description'
                            : null,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: _menuTypeController,
                        decoration: InputDecoration(labelText: 'Menu Type'),
                        validator: (value) => value!.isEmpty
                            ? 'Please enter the menu type'
                            : null,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),

                    Container(
                      width: 200,
                      child: TextFormField(
                        controller: _priceController,
                        decoration: InputDecoration(labelText: 'Price'),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter the price' : null,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ), // Add more fields as needed...

                    SizedBox(height: 20),

                    // Submit button
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: Text('Submit Menu Item'),
                    ),
                  ],
                ),
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
