import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:myapp/api/Api.dart';
import 'package:myapp/helpers/screen.dart';

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
    Screen().init(context);

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.yBlock * 74 : Screen.yBlock * 80,
        width: Screen.isMobile() || Screen.isLandScape() || Screen.isTablet() ? Screen.width : Screen.xBlock * 80,
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
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: Screen.inputWidth(),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
