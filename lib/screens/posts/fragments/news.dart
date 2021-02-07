import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';
import 'package:myapp/api/Api.dart';
import 'dart:io' as Io;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  Image image;
  Uint8List intListImage;
  String imageString;

  var option1Text;

  final headerController = TextEditingController();
  final contentController = TextEditingController();
  var error = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    headerController.dispose();
    contentController.dispose();
    super.dispose();
  }

//method to load image and update `uploadedImage`

  _startFilePicker() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        FileReader reader = FileReader();

        reader.onLoadEnd.listen((e) {
          setState(() {
            intListImage = reader.result;
          });
        });

        reader.onError.listen((fileEvent) {
          setState(() {
            option1Text = "Some Error occured while reading the file";
          });
        });

        reader.readAsArrayBuffer(file);
      }
    });
  }

  getImageFile() {
    if (intListImage != null) {
      imageString = base64.encode(intListImage);
      return Image.memory(base64Decode(imageString));
    } else {
      print('Bytes not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            child: intListImage != null
                                ? Image(
                                    image: getImageFile().image,
                                    width: 300,
                                    height: 90,
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(right: 25),
                                    child: Text(
                                      'لم يتم تحديد أي صورة',
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Arabic',
                                      ),
                                    ),
                                  ),
                          ),
                          InkWell(
                            onTap: () async {
                              // final _image = await FlutterWebImagePicker.getImage;
                              // setState(() {
                              //   image = _image;
                              // });

                              await _startFilePicker();
                            },
                            child: DottedBorder(
                              dashPattern: [4, 4, 4, 4],
                              color: Colors.blue[400],
                              strokeWidth: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Icon(
                                  Icons.add,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
                        child: Text(
                          'العنوان',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Arabic',
                          ),
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5),
                          child: TextFormField(
                            controller: headerController,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
                        child: Text(
                          'المحتوى',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Arabic',
                          ),
                        ),
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(5),
                          child: TextField(
                            controller: contentController,
                            maxLines: 8,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      InkWell(
                        onTap: () async {
                          if (!Api.validateNews(headerController.text, contentController.text, imageString)) {
                            EasyLoading.showError("Please fill all fields");
                            return;
                          }
                          EasyLoading.show(status: 'Please Wait');
                          var result = await Api.submitNews(headerController.text, contentController.text, imageString);
                          if (result) {
                            setState(() {
                              image = null;
                              intListImage = null;
                              imageString = null;
                              headerController.text = '';
                              contentController.text = '';
                            });
                            EasyLoading.showSuccess('News saved');
                          } else {
                            EasyLoading.showSuccess('Unable to save data');
                          }
                        },
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(60, 6, 60, 6),
                              child: Text(
                                'إضافة',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: 'Arabic',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
