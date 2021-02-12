import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/api/Api.dart';
import 'package:myapp/helpers/screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditImage extends StatefulWidget {
  EditImage({Key key, @required this.article}) : super(key: key);

  final article;
  @override
  _EditImageState createState() => _EditImageState(article);
}

class _EditImageState extends State<EditImage> {
  Image image;
  Uint8List intListImage;
  String imageString;

  var option1Text;
  var article;

  final headerController = TextEditingController();
  final contentController = TextEditingController();
  var error = false;

  _EditImageState(_article) {
    article = _article;
    headerController.text = article.header;
    contentController.text = article.content;
  }


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
    Screen().init(context);

    return Padding(
      padding:  EdgeInsets.fromLTRB(
        Screen.editPaddingX(),
        Screen.editPaddingY(),
        Screen.editPaddingX(),
        Screen.editPaddingX(),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Padding(
          padding: EdgeInsets.all(Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? 15 : 30),
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
                      width: Screen.inputWidth(),
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
                      width: Screen.inputWidth(),
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
                      width: Screen.inputWidth(),
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
                    Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            EasyLoading.show(status: 'Please Wait');
                            try{
                              // await AcceptApi.news(article);
                            } catch(e){

                            }
                            EasyLoading.showSuccess('News Rejected');
                            Navigator.pop(context);
                          },
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: Colors.red,
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(Screen.thumbX(), Screen.thumbY(), Screen.thumbX(), Screen.thumbY()),
                                child: Icon(
                                  FontAwesomeIcons.thumbsDown,
                                  size: Screen.bigButtonFont(),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: Screen.xBlock * 1,),
                        InkWell(
                          onTap: () async {
                            EasyLoading.show(status: 'Please Wait');
                            try{
                              // await AcceptApi.news(article);
                            } catch(e){

                            }
                            EasyLoading.showSuccess('News Accepted');
                            Navigator.pop(context);
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
                                padding: EdgeInsets.fromLTRB(Screen.thumbX(), Screen.thumbY(), Screen.thumbX(), Screen.thumbY()),
                                child: Icon(
                                  FontAwesomeIcons.thumbsUp,
                                  size: Screen.bigButtonFont(),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
