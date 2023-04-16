import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/provider/blog_provider.dart';
import '../../../data/provider/chat.dart';

class CreateBlog extends StatefulWidget {
  const CreateBlog({super.key});

  @override
  CreateBlogState createState() => CreateBlogState();
}

class CreateBlogState extends State<CreateBlog> {
  String authorName = '', title = '', desc = '';

  late ChatProvider chatProvider;
  late XFile? selectedImage;
  File? imageFile;
  bool _isLoading = false;
  String imageUrl = '';
  CrudMethods crudMethods = CrudMethods();

  Future getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          _isLoading = true;
        });
        uploadImageFile();
      }
    }
  }

  Future<void> uploadImageFile() async {
    final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final UploadTask? uploadTask =
        chatProvider.uploadImageFile(imageFile!, fileName);
    try {
      final TaskSnapshot? snapshot = await uploadTask;
      imageUrl = (await snapshot?.ref.getDownloadURL())!;
      setState(() {
        _isLoading = false;
      });
    } on FirebaseException catch (_) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> uploadBlog() async {
    // print(selectedImage);
    // if (selectedImage != null) {
    setState(() {
      _isLoading = true;
    });

    final Map<String, String> blogMap = {
      'imgUrl': '',
      'authorName': authorName,
      'title': title,
      'desc': desc
    };
    crudMethods.addData(blogMap).then((result) {
      Navigator.pop(context);
    });
    //   });
    // } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Blog',
              style: TextStyle(fontSize: 22, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              uploadBlog();
            },
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Icon(Icons.file_upload)),
          )
        ],
      ),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            )
          : Column(
            children:  <Widget>[
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: imageFile != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          height: 170,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          width: MediaQuery.of(context).size.width,
                          child: const Icon(
                            Icons.add_a_photo,
                            color: Colors.black45,
                          ),
                        )),
              const SizedBox(
                height: 8,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(hintText: 'Author Name'),
                      onChanged: (val) {
                        authorName = val;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: 'Title'),
                      onChanged: (val) {
                        title = val;
                      },
                    ),
                    TextField(
                      decoration: const InputDecoration(hintText: 'Desc'),
                      onChanged: (val) {
                        desc = val;
                      },
                    )
                  ],
                ),
              )
            ],
          ),
    );
  }
}
