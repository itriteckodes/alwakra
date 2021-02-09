import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/api/Api.dart';
import 'package:myapp/helpers/screen.dart';

class Weddings extends StatefulWidget {
  @override
  _WeddingsState createState() => _WeddingsState();
}

class _WeddingsState extends State<Weddings> {
  Image image;
  Uint8List intListImage;
  String imageString;

  var option1Text;

//father, groom, location, date, address, mobile, image;
  final fatherController = TextEditingController();
  final groomController = TextEditingController();
  final locationController = TextEditingController();
  final dateController = TextEditingController();
  final addressController = TextEditingController();
  final mobileController = TextEditingController();
  var error = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fatherController.dispose();
    groomController.dispose();
    locationController.dispose();
    dateController.dispose();
    addressController.dispose();
    mobileController.dispose();
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
      padding: const EdgeInsets.all(0),
      child: Container(
        height: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.yBlock * 74 : Screen.yBlock * 80,
        width: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.width : Screen.xBlock * 80,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.75,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        width: Screen.borderBoxWidth(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(right: Screen.xBlock * 2),
                                child: intListImage != null
                                    ? Image(
                                        image: getImageFile().image,
                                        width: Screen.imageBoxWidth(),
                                        height: 90,
                                      )
                                    : Text(
                                        'لم يتم تحديد أي صورة',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Screen.h6(),
                                          fontFamily: 'Arabic',
                                        ),
                                      ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await _startFilePicker();
                              },
                              child: DottedBorder(
                                dashPattern: [4, 4, 4, 4],
                                color: Colors.blue[400],
                                strokeWidth: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(Screen.xBlock * 2),
                                  child: Icon(
                                    Icons.add,
                                    size: Screen.h4(),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Screen.xBlock),
                          ],
                        ),
                      ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: Screen.inputWidth(),
                      child: Text(
                        'اسم المعرس',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Arabic',
                        ),
                      ),
                    ),
                    Container(
                      width: Screen.inputWidth(),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5),
                        child: TextFormField(
                          controller: groomController,
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
                      width: Screen.inputWidth(),
                      child: Text(
                        'اسم والد المعرس',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Arabic',
                        ),
                      ),
                    ),
                    Container(
                      width: Screen.inputWidth(),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5),
                        child: TextFormField(
                          controller: fatherController,
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
                      width: Screen.inputWidth(),
                      child: Text(
                        'تاريخ الزواج',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Arabic',
                        ),
                      ),
                    ),
                    Container(
                      width: Screen.inputWidth(),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5),
                        child: TextFormField(
                          controller: dateController,
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
                      width: Screen.inputWidth(),
                      child: Text(
                        'للاستفسار',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Arabic',
                        ),
                      ),
                    ),
                    Container(
                      width: Screen.inputWidth(),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5),
                        child: TextFormField(
                          controller: mobileController,
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
                      width: Screen.inputWidth(),
                      child: Text(
                        'الموقع',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Arabic',
                        ),
                      ),
                    ),
                    Container(
                      width: Screen.inputWidth(),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5),
                        child: TextFormField(
                          controller: locationController,
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
                      width: Screen.inputWidth(),
                      child: Text(
                        'عنوان الزفاف',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontFamily: 'Arabic',
                        ),
                      ),
                    ),
                    Container(
                      width: Screen.inputWidth(),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(5),
                        child: TextField(
                          controller: addressController,
                          maxLines: 8,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () async {
                        if (!Api.validateWedding(
                          fatherController.text,
                          groomController.text,
                          dateController.text,
                          mobileController.text,
                          locationController.text,
                          addressController.text,
                          imageString,
                        )) {
                          EasyLoading.showError("Please fill all fields");
                          return;
                        }
                        EasyLoading.show(status: 'Please Wait');
                        var result = await Api.submitWedding(
                          fatherController.text,
                          groomController.text,
                          dateController.text,
                          mobileController.text,
                          locationController.text,
                          addressController.text,
                          imageString,
                        );
                        if (result) {
                          setState(() {
                            image = null;
                            intListImage = null;
                            imageString = null;
                            fatherController.text = '';
                            groomController.text = '';
                            dateController.text = '';
                            mobileController.text = '';
                            locationController.text = '';
                            addressController.text = '';
                          });
                          EasyLoading.showSuccess('Wedding saved');
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
