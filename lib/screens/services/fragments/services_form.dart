import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:myapp/api/ApiService.dart';
import 'package:myapp/api/DeleteService.dart';
import 'package:myapp/api/Helper.dart';
import 'package:myapp/api/UpdateService.dart';
import 'package:myapp/helpers/screen.dart';
import 'package:myapp/models/Content.dart';
import 'package:myapp/models/Service.dart';
import 'package:myapp/models/SubCategory1.dart';
import 'package:myapp/models/SubCategory2.dart';


class ServicesForm extends StatefulWidget {
  @override
  _ServicesFormState createState() => _ServicesFormState();
}

class _ServicesFormState extends State<ServicesForm> {
  List<Service> services = [];
  List<SubCategory1> subCategories1 = [];
  List<SubCategory2> subCategories2 = [];

  Content content;

  var test;

  _ServicesFormState() {
    getServices();
  }

  getServices() async {
    var _services = await ApiService.fetchServices();
    setState(() {
      services = _services;
    });
  }

  getSubCategories1() async {
    var _subCategories1 = await ApiService.fetchSub1();
    setState(() {
      subCategories1 = _subCategories1;
      subCategories2 = [];
    });
  }

  getSubCategories2() async {
    var _subCategories2 = await ApiService.fetchSub2();
    setState(() {
      subCategories2 = _subCategories2;
    });
  }

  fetchContent() async {
    var _content = await ApiService.fetchContent();
    setState(() {
      content = _content;
    });
  }

  final addSerivceModal = () => {};

  Image image;

  final contentController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    contentController.dispose();
    super.dispose();
  }

  Widget contentBox({width, rows, modal, buttonPadding}) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: width,
          margin: EdgeInsets.only(
            top: 50.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue.withOpacity(1), width: 3),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: rows,
              ),
            ),
          ),
        ),
        Positioned(
          left: buttonPadding,
          top: 35.0,
          child: InkWell(
            onTap: () {
              modal();
            },
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blue,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget boxesRow({spacing}) {
    if (Screen.isMobile() || Screen.isLandScape() || Screen.isTablet())
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          contentBox(
            width: Screen.xBlock * 90,
            rows: [
              for (var article in services)
                ServiceRow(
                  getServices: getServices,
                  getSubCategories1: getSubCategories1,
                  article: article,
                ),
            ],
            modal: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddCategory(getServices: getServices);
              },
            ),
            buttonPadding: Screen.xBlock * 10,
          ),
          contentBox(
              width: Screen.xBlock * 90,
              rows: [
                for (var article in subCategories1)
                  SubCategory1Row(
                    getSubCategories1: getSubCategories1,
                    getSubCategories2: getSubCategories2,
                    article: article,
                  ),
              ],
              modal: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddSubCategory1(
                        getSubCategories1: getSubCategories1,
                      );
                    },
                  ),
              buttonPadding: Screen.xBlock * 10),
          contentBox(
            width: Screen.xBlock * 90,
            rows: [
              for (var article in subCategories2)
                SubCategory2Row(
                  getSubCategories2: getSubCategories2,
                  getContent: fetchContent,
                  article: article,
                ),
            ],
            modal: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddSubCategory2(
                  getSubCategories2: getSubCategories2,
                );
              },
            ),
            buttonPadding: Screen.xBlock * 10,
          ),
        ],
      );
    else
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          contentBox(
            width: Screen.xBlock * 25,
            rows: [
              for (var article in subCategories2)
                SubCategory2Row(
                  getSubCategories2: getSubCategories2,
                  getContent: fetchContent,
                  article: article,
                ),
            ],
            modal: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddSubCategory2(
                  getSubCategories2: getSubCategories2,
                );
              },
            ),
            buttonPadding: 25,
          ),
          SizedBox(
            width : Screen.xBlock * 2
          ),
          contentBox(
            width: Screen.xBlock * 25,
            rows: [
              for (var article in subCategories1)
                SubCategory1Row(
                  getSubCategories1: getSubCategories1,
                  getSubCategories2: getSubCategories2,
                  article: article,
                ),
            ],
            modal: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddSubCategory1(
                  getSubCategories1: getSubCategories1,
                );
              },
            ),
            buttonPadding: 25,
          ),
          SizedBox(
            width : Screen.xBlock * 2
          ),
          contentBox(
            width: Screen.xBlock * 25,
            rows: [
              for (var article in services)
                ServiceRow(
                  getServices: getServices,
                  getSubCategories1: getSubCategories1,
                  article: article,
                ),
            ],
            modal: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AddCategory(getServices: getServices);
              },
            ),
            buttonPadding: 25,
          ),
        ],
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Screen.isMobile()||Screen.isLandScape()||Screen.isTablet() ? Screen.yBlock * 74 : Screen.yBlock * 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            boxesRow(
              spacing: 50,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: contentController,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل المحتوى هنا',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  )),
            ),
            Material(
              child: InkWell(
                onTap: () async {
                  if (!ApiService.validateContent(contentController.text)) {
                    return;
                  }
                  EasyLoading.show(status: 'Please Wait');
                  var result = await ApiService.addContent(contentController.text);
                  if (result) {
                    EasyLoading.showSuccess('Content updated');
                  } else {
                    EasyLoading.showError('Unable to save data');
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
                        'تحديث',
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
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class ServiceRow extends StatelessWidget {
  const ServiceRow({Key key, this.article, @required this.getSubCategories1, @required this.getServices}) : super(key: key);

  final getServices;
  final Service article;
  final getSubCategories1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ApiService.selectedCategory = article;
        getSubCategories1();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blue.withOpacity(0.25), width: 2),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Helper.isSelectedCategory(article) ? Colors.blue[200] : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    EasyLoading.show(status: 'Please Wait');
                    var result = await DeleteService.category(article.main);
                    if (result) {
                      getServices();
                      EasyLoading.showSuccess('Service deleted');
                    } else {
                      EasyLoading.showError('Unable to delete');
                    }
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: Screen.iconSize(),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return UpdateCategory(getServices: this.getServices, article: this.article);
                      },
                    );
                  },
                  child: Icon(
                    Icons.edit,
                    color: Colors.black,
                    size: Screen.iconSize(),
                  ),
                ),
                Container(
                  width: Screen.rowFontWidth(),
                  child: Text(
                    article.main,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Screen.rowFont(),
                      fontFamily: 'Arabic',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategory1Row extends StatelessWidget {
  const SubCategory1Row({
    Key key,
    this.article,
    @required this.getSubCategories2,
    @required this.getSubCategories1,
  }) : super(key: key);

  final SubCategory1 article;
  final getSubCategories2;
  final getSubCategories1;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ApiService.selectedSubCategory1 = article;
        getSubCategories2();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blue.withOpacity(0.25), width: 2),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Helper.isSelectedSubCategory1(article) ? Colors.blue[200] : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    EasyLoading.show(status: 'Please Wait');
                    var result = await DeleteService.subCategory1(article.main, article.sub1);
                    if (result) {
                      getSubCategories1();
                      EasyLoading.showSuccess('Subcategory 1 deleted');
                    } else {
                      EasyLoading.showError('Unable to delete');
                    }
                  },
                  child: Container(
                    width: Screen.iconSize(),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: Screen.iconSize(),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return UpdateSubCategory1(
                          article: article,
                          getSubCategories1: getSubCategories1,
                        );
                      },
                    );
                  },
                  child: Container(
                    width: Screen.iconSize(),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: Screen.iconSize(),
                    ),
                  ),
                ),
                Container(
                  width: Screen.rowFontWidth(),
                  child: Text(
                    article.sub1,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Screen.rowFont(),
                      fontFamily: 'Arabic',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategory2Row extends StatelessWidget {
  const SubCategory2Row({
    Key key,
    this.article,
    @required this.getContent,
    @required this.getSubCategories2,
  }) : super(key: key);

  final SubCategory2 article;
  final getContent;
  final getSubCategories2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ApiService.selectedSubCategory2 = article;
        getContent();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.blue.withOpacity(0.25), width: 2),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Helper.isSelectedSubCategory2(article) ? Colors.blue[200] : Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () async {
                    EasyLoading.show(status: 'Please Wait');
                    var result = await DeleteService.subCategory2(article.main, article.sub1, article.sub2);
                    if (result) {
                      getSubCategories2();
                      EasyLoading.showSuccess('SubCategory 2 deleted');
                    } else {
                      EasyLoading.showError('Unable to delete');
                    }
                  },
                  child: Container(
                    width: Screen.iconSize(),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: Screen.iconSize(),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return UpdateSubCategory2(
                          article: article,
                          getSubCategories2: getSubCategories2,
                        );
                      },
                    );
                  },
                  child: Container(
                    width: Screen.iconSize(),
                    child: Icon(
                      Icons.edit,
                      color: Colors.black,
                      size: Screen.iconSize(),
                    ),
                  ),
                ),
                Container(
                  width: Screen.rowFontWidth(),
                  child: Text(
                    article.sub2,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: Screen.rowFont(),
                      fontFamily: 'Arabic',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class AddCategory extends StatefulWidget {
  AddCategory({Key key, @required this.getServices}) : super(key: key);

  final getServices;
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final categoryController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "أضف الخدمة",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  fontSize: Screen.h2(),
                  fontFamily: "Arabic",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: Screen.modalInput(),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(5),
                  child: TextFormField(
                    controller: categoryController,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل اسم الخدمة',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                child: InkWell(
                  onTap: () async {
                    if (!ApiService.validateCategory(categoryController.text)) {
                      EasyLoading.showError("Please fill all fields");
                      return;
                    }
                    EasyLoading.show(status: 'Please Wait');
                    var result = await ApiService.addCategory(categoryController.text);
                    if (result) {
                      setState(() {
                        categoryController.text = '';
                      });
                      widget.getServices();
                      EasyLoading.showSuccess('Service saved');
                    } else {
                      EasyLoading.showError('Unable to save data');
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
                          'أضف',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateCategory extends StatefulWidget {
  UpdateCategory({Key key, @required this.getServices, @required this.article}) : super(key: key);

  final getServices;
  final article;
  @override
  _UpdateCategoryState createState() => _UpdateCategoryState(article);
}

class _UpdateCategoryState extends State<UpdateCategory> {
  final categoryController = TextEditingController();
  var article;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    categoryController.dispose();
    super.dispose();
  }

  _UpdateCategoryState(_article) {
    article = _article;
    categoryController.text = article.main;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تحديث الخدمة",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  fontSize: Screen.h2(),
                  fontFamily: "Arabic",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: Screen.modalInput(),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(5),
                  child: TextFormField(
                    controller: categoryController,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل اسم الخدمة',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                child: InkWell(
                  onTap: () async {
                    if (!ApiService.validateCategory(categoryController.text)) {
                      EasyLoading.showError("Please fill all fields");
                      return;
                    }
                    EasyLoading.show(status: 'Please Wait');
                    var result = await UpdateService.category(categoryController.text, article.main);
                    if (result) {
                      setState(() {});
                      widget.getServices();
                      EasyLoading.showSuccess('Service updated');
                    } else {
                      EasyLoading.showError('Unable to update');
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
                          'تحديث',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class AddSubCategory1 extends StatefulWidget {
  AddSubCategory1({Key key, @required this.getSubCategories1}) : super(key: key);

  final getSubCategories1;
  @override
  _AddSubCategory1State createState() => _AddSubCategory1State();
}

class _AddSubCategory1State extends State<AddSubCategory1> {
  final subCategory1Controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    subCategory1Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "إضافة فئة فرعية واحدة",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  fontSize: Screen.h2(),
                  fontFamily: "Arabic",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: Screen.modalInput(),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(5),
                  child: TextFormField(
                    controller: subCategory1Controller,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل اسم الخدمة',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                child: InkWell(
                  onTap: () async {
                    if (!ApiService.validateSubCategory1(subCategory1Controller.text)) {
                      return;
                    }
                    EasyLoading.show(status: 'Please Wait');
                    var result = await ApiService.addSubCategory1(subCategory1Controller.text);
                    if (result) {
                      setState(() {
                        subCategory1Controller.text = '';
                      });
                      widget.getSubCategories1();
                      EasyLoading.showSuccess('Sub Category 1 saved');
                    } else {
                      EasyLoading.showError('Unable to save data');
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
                          'أضف',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateSubCategory1 extends StatefulWidget {
  UpdateSubCategory1({Key key, @required this.getSubCategories1, @required this.article}) : super(key: key);

  final getSubCategories1;
  final article;
  @override
  _UpdateSubCategory1State createState() => _UpdateSubCategory1State(article);
}

class _UpdateSubCategory1State extends State<UpdateSubCategory1> {
  final categoryController = TextEditingController();
  var article;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    categoryController.dispose();
    super.dispose();
  }

  _UpdateSubCategory1State(_article) {
    article = _article;
    categoryController.text = article.sub1;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تحديث فئة فرعية واحدة",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  fontSize: Screen.h2(),
                  fontFamily: "Arabic",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: Screen.modalInput(),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(5),
                  child: TextFormField(
                    controller: categoryController,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل اسم الخدمة',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                child: InkWell(
                  onTap: () async {
                    if (!ApiService.validateCategory(categoryController.text)) {
                      EasyLoading.showError("Please fill all fields");
                      return;
                    }
                    EasyLoading.show(status: 'Please Wait');
                    var result = await UpdateService.subCategory1(article.main, categoryController.text, article.sub1);
                    if (result) {
                      setState(() {});
                      widget.getSubCategories1();
                      EasyLoading.showSuccess('Category updated');
                    } else {
                      EasyLoading.showError('Unable to update');
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
                          'تحديث',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class AddSubCategory2 extends StatefulWidget {
  AddSubCategory2({Key key, @required this.getSubCategories2}) : super(key: key);

  final getSubCategories2;
  @override
  _AddSubCategory2State createState() => _AddSubCategory2State();
}

class _AddSubCategory2State extends State<AddSubCategory2> {
  final subCategory2Controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    subCategory2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "أضف الفئة الفرعية الثانية",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  fontSize: Screen.h2(),
                  fontFamily: "Arabic",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: Screen.modalInput(),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(5),
                  child: TextFormField(
                    controller: subCategory2Controller,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل اسم الخدمة',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                child: InkWell(
                  onTap: () async {
                    if (!ApiService.validateSubCategory2(subCategory2Controller.text)) {
                      return;
                    }
                    EasyLoading.show(status: 'Please Wait');
                    var result = await ApiService.addSubCategory2(subCategory2Controller.text);
                    if (result) {
                      setState(() {
                        subCategory2Controller.text = '';
                      });
                      widget.getSubCategories2();
                      EasyLoading.showSuccess('Sub Category 2 saved');
                    } else {
                      EasyLoading.showError('Unable to save data');
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
                          'أضف',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateSubCategory2 extends StatefulWidget {
  UpdateSubCategory2({Key key, @required this.getSubCategories2, @required this.article}) : super(key: key);

  final getSubCategories2;
  final article;
  @override
  _UpdateSubCategory2State createState() => _UpdateSubCategory2State(article);
}

class _UpdateSubCategory2State extends State<UpdateSubCategory2> {
  final categoryController = TextEditingController();
  var article;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    categoryController.dispose();
    super.dispose();
  }

  _UpdateSubCategory2State(_article) {
    article = _article;
    categoryController.text = article.sub2;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
          Screen.modalPaddingX(),
          Screen.modalPaddingY(),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "تحديث فئة فرعية الثانية",
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  fontSize: Screen.h2(),
                  fontFamily: "Arabic",
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: Screen.modalInput(),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(5),
                  child: TextFormField(
                    controller: categoryController,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      hintText: 'أدخل اسم الخدمة',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Material(
                child: InkWell(
                  onTap: () async {
                    if (!ApiService.validateCategory(categoryController.text)) {
                      EasyLoading.showError("Please fill all fields");
                      return;
                    }
                    EasyLoading.show(status: 'Please Wait');
                    var result = await UpdateService.subCategory2(article.main, article.sub1, categoryController.text, article.sub2);
                    if (result) {
                      setState(() {});
                      widget.getSubCategories2();
                      EasyLoading.showSuccess('Category updated');
                    } else {
                      EasyLoading.showError('Unable to update');
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
                          'تحديث',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
