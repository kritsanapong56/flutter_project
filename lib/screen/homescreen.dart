import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(),
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        margin: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Center(
              child: Text("ยินดีต้อนรับ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontFamily: 'SukhumvitSet-Bold'),
                  textAlign: TextAlign.center),
            ),
            Expanded(
              flex: 5,
              child: Image(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin:
                  EdgeInsets.only(top: 50.0, bottom: 50, left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      width: double.maxFinite,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFF9671),
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10.0, left: 20, right: 20),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          elevation: 15.0,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "เริ่มต้นใช้งาน",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontFamily: 'SukhumvitSet-Bold'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
