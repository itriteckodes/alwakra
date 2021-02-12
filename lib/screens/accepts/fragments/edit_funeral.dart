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

class EditFuneral extends StatefulWidget {
  EditFuneral({Key key, @required this.article}) : super(key: key);

  final article;
  @override
  _EditFuneralState createState() => _EditFuneralState(article);
}

class _EditFuneralState extends State<EditFuneral> {
  Image image;
  Uint8List intListImage;
  String imageString;

  var option1Text;
  var article;

//father, groom, location, date, address, mobile, image;
  final nameController = TextEditingController();
  final buryDateController = TextEditingController();
  final buryTimeController = TextEditingController();
  final burryAddressController = TextEditingController();
  final consolationDateController = TextEditingController();
  final menAddressController = TextEditingController();
  final menLocationController = TextEditingController();
  final menMobileController = TextEditingController();
  final womenAddressController = TextEditingController();
  final womenLocationController = TextEditingController();
  final womenMobileController = TextEditingController();

  var error = false;

  _EditFuneralState(_article) {
    article = _article;
    nameController.text = article.content;
    buryDateController.text = article.buryDate;
    buryTimeController.text = article.buryTime;
    burryAddressController.text = article.burryAddress;
    consolationDateController.text = article.consolationDate;
    menAddressController.text = article.menAddress;
    menLocationController.text = article.menLocation;
    menMobileController.text = article.menMobile;
    womenAddressController.text = article.womenAddress;
    womenLocationController.text = article.womenLocation;
    womenMobileController.text = article.womenMobile;
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    buryDateController.dispose();
    buryTimeController.dispose();
    burryAddressController.dispose();
    consolationDateController.dispose();
    menAddressController.dispose();
    menLocationController.dispose();
    menMobileController.dispose();
    womenAddressController.dispose();
    womenLocationController.dispose();
    womenMobileController.dispose();
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

  Widget normalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
              child: Text(
                'للاستفسار - رجال',
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
                  controller: menMobileController,
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
                ' عنوان عزا رجال',
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
                  controller: menAddressController,
                  maxLines: 6,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
              child: Text(
                'للاستفسار - النساء',
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
                  controller: womenMobileController,
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
                ' عنوان عزا النساء',
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
                  controller: womenAddressController,
                  maxLines: 6,
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
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    EasyLoading.show(status: 'Please Wait');
                    try {
                      // await AcceptApi.news(article);
                    } catch (e) {}
                    EasyLoading.showSuccess('Consolation Rejected');
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
                SizedBox(
                  width: Screen.xBlock * 1,
                ),
                InkWell(
                  onTap: () async {
                    EasyLoading.show(status: 'Please Wait');
                    try {
                      // await AcceptApi.news(article);
                    } catch (e) {}
                    EasyLoading.showSuccess('Consolation Accepted');
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
        SizedBox(
          width: 30,
        ),
        Column(
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
              width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
              child: Text(
                'الاسم',
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
                  controller: nameController,
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
                'تاريخ الدفن',
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
                  controller: buryDateController,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
              child: Text(
                'وقت الدفن',
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
                  controller: buryTimeController,
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
                'مكان الدفن',
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
                  controller: burryAddressController,
                  maxLines: 3,
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
            Container(
              width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
              child: Text(
                'تاريخ العزة',
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
                  controller: consolationDateController,
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
                'موقع عزة الرجال',
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
                  controller: menLocationController,
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
                'النساء',
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
                  controller: womenLocationController,
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
          ],
        )
      ],
    );
  }

  Widget mobileRow() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
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
                'الاسم',
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
                  controller: nameController,
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
                'تاريخ الدفن',
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
                  controller: buryDateController,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            Container(
              width: Screen.inputWidth(),
              child: Text(
                'وقت الدفن',
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
                  controller: buryTimeController,
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
                'مكان الدفن',
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
                  controller: burryAddressController,
                  maxLines: 3,
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
            Container(
              width: Screen.inputWidth(),
              child: Text(
                'تاريخ العزة',
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
                  controller: consolationDateController,
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
                'موقع عزة الرجال',
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
                  controller: menLocationController,
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
                'النساء',
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
                  controller: womenLocationController,
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
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: Screen.inputWidth(),
              child: Text(
                'للاستفسار - رجال',
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
                  controller: menMobileController,
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
                ' عنوان عزا رجال',
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
                  controller: menAddressController,
                  maxLines: 6,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            Container(
              width: Screen.inputWidth(),
              child: Text(
                'للاستفسار - النساء',
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
                  controller: womenMobileController,
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
                ' عنوان عزا النساء',
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
                  controller: womenAddressController,
                  maxLines: 6,
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
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    EasyLoading.show(status: 'Please Wait');
                    try {
                      // await AcceptApi.news(article);
                    } catch (e) {}
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
                SizedBox(
                  width: Screen.xBlock * 1,
                ),
                InkWell(
                  onTap: () async {
                    EasyLoading.show(status: 'Please Wait');
                    try {
                      // await AcceptApi.news(article);
                    } catch (e) {}
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? mobileRow() : normalRow(),
          ),
        ),
      ),
    );
  }
}
