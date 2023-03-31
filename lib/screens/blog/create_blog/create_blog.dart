import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../../data/provider/blog_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import '../../../data/provider/chat.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName = '', title = '', desc = '';

  late ChatProvider chatProvider;
  late XFile? selectedImage;
  File? imageFile;
  bool _isLoading = false;
  String imageUrl = '';
  CrudMethods crudMethods = new CrudMethods();

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          _isLoading = true;
        });
        print("Hear1");
        uploadImageFile();

      }
    }
  }
  void uploadImageFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = chatProvider.uploadImageFile(imageFile!, fileName);
    try {
      print("Hear2");
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        _isLoading = false;
      });
    } on FirebaseException catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }
  uploadBlog() async {
    // print(selectedImage);
    // if (selectedImage != null) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> blogMap = {
        "imgUrl": "",
        "authorName": authorName,
        "title": title,
        "desc": desc
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
          children: <Widget>[
            Text(
              "Blog",
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
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.file_upload)),
          )
        ],
      ),
      body: _isLoading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  getImage();
                },
                child: imageFile != null
                    ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
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
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  width: MediaQuery.of(context).size.width,
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.black45,
                  ),
                )),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(hintText: "Author Name"),
                    onChanged: (val) {
                      authorName = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Title"),
                    onChanged: (val) {
                      title = val;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: "Desc"),
                    onChanged: (val) {
                      desc = val;
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
