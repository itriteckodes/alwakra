import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_image_picker/flutter_web_image_picker.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  Image image;
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
                            child: image != null
                                ? Image(
                                    image: image.image,
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
                              final _image = await FlutterWebImagePicker.getImage;
                              setState(() {
                                image = _image;
                              });
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
                        onTap: () {},
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
