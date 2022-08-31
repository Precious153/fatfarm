
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'homepage.dart';
import 'signUp.dart';
import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  bool _visible = true;
  bool isLoading = false;
  bool isLoading2 = false;
  TextEditingController _name = TextEditingController();

  TextEditingController _desc = TextEditingController();

  TextEditingController _price = TextEditingController();

  final _key = GlobalKey<FormState>();
  bool notLoading = true;
  var imagePath;
  CollectionReference _collectionRef=
  FirebaseFirestore.instance.collection
    ('users-data');
  sendUserName() async {
    return _collectionRef.doc().set({
      'name':_name.text,
      'description':_desc.text,
      'price':_price.text,
      'imagepath':imagePath,
    }).then((value) => Navigator.pop(context)).catchError((error)=>print("something is wrong")) ;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff357619),
          title: const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text('Upload Produce',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        backgroundColor: const Color(0xffFFFFFF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 50),
              Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  color: Color(0xff357619),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'FF',
                    style: TextStyle(
                      color: Color(0xffFFFFFF),
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: 315,
                    child: TextFormField(
                      controller: _name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter Name',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8C8C8C),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: 315,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _price,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter Price',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8C8C8C),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    width: 315,
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,maxLines: 8,
                      controller: _desc,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: 'Enter Description',
                        hintStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8C8C8C),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff357619),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () async {
                      isLoading = true;
                      setState(() {});
                      final results = await FilePicker.platform.pickFiles(
                        allowMultiple: false,
                        type: FileType.custom,
                        allowedExtensions: ['png','jpg'],
                      );
                      if(results ==null){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('No file selected'),
                          ),
                        );
                        return null;
                      }
                      final path = results.files.single.path!;
                      final fileName = results.files.single.name ;

                      imagePath=path;
                      setState(() {

                      });
                      print(path);
                      print(fileName);
                      Future.delayed(Duration(seconds: 5)).then((value) {
                        isLoading = false;
                        setState(() {});
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Homepage()));
                      });
                    },
                    child: isLoading == false
                        ? const Center(
                            child: Text(
                              'Select Image',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                                color: Colors.white))),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff357619),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      isLoading2 = true;
                      setState(() {});
                      Future.delayed(Duration(seconds: 5)).then((value) {
                        isLoading2 = false;
                        setState(() {});
                        sendUserName();
                      });
                    },
                    child: isLoading2 == false
                        ? const Center(
                            child: Text(
                              'Upload Produce',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                                color: Colors.white))),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
