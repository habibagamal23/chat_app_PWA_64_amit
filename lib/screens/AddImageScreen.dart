import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pwachat/supbase/supabaseStorage.dart';

import 'HomeScreen.dart';

class Addimagescreen extends StatefulWidget {
  const Addimagescreen({super.key});

  @override
  State<Addimagescreen> createState() => _AddimagescreenState();
}

class _AddimagescreenState extends State<Addimagescreen> {
  File? imagge;

  pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? xfile = await picker.pickImage(source: ImageSource.camera);
    if (xfile != null) {
      setState(() {
        imagge = File(xfile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Choose Your Iamge Profile"),
        InkWell(
          onTap: pickImage,
          child: CircleAvatar(
            radius: 50,
            backgroundImage: imagge != null ? FileImage(imagge!) : null,
            child: imagge == null ? Icon(Icons.camera) : null,
          ),
        ),
        ElevatedButton(
            onPressed: () async {
              if (imagge != null) {
                await SupabaseStorage().UploadImage(imagge!);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please Choose Image")));
              }
            },
            child: Text("Upload u image "))
      ]),
    );
  }
}
