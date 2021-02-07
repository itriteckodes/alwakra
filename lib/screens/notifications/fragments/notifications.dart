import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/api/Api.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final headerController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    headerController.dispose();
    contentController.dispose();
    super.dispose();
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
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: (MediaQuery.of(context).size.width * (0.85 * 0.40)),
                        child: Text(
                          'عنوان الأشعار',
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
                          'رسالة الأشعار',
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
                          EasyLoading.show(status: 'Please Wait');
                          var result = await Api.sendNotification(headerController.text, contentController.text);
                          if (result) {
                            setState(() {
                              headerController.text = '';
                              contentController.text = '';
                            });
                            EasyLoading.showSuccess('Notification sent');
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
                                'إرسال',
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
