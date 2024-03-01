import 'package:flutter/material.dart';

class Addprofile extends StatefulWidget {
  const Addprofile({super.key});

  @override
  State<Addprofile> createState() => _AddprofileState();
}

class _AddprofileState extends State<Addprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xfff6f6f9),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(88, 135, 255, 1),
        leadingWidth: 0,
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: const EdgeInsets.only(top: 30.0),
        child: ListView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/profile.png",
                        width: 100,
                        height: 100,
                      ),
                      const Text(
                        "ชื่อ - สกุล",
                        style: TextStyle(
                            fontFamily: 'SukhumvitSet-Bold', fontSize: 23),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10),
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0),
                                  width: double.maxFinite,
                                  child: const TextField(
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontFamily: 'SukhumvitSet-Bold',
                                        color: Colors.white),
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 15),
                                        //ปรับตำแหน่งcursor เริ่มต้นในช่องข้อความ
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20.0),
                                            ),
                                            borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none)),
                                        filled: true,
                                        hintText: "ชื่อ : ชื่อ-นามสกุล",
                                        hintStyle: TextStyle(
                                            fontFamily: 'SukhumvitSet-Medium',
                                            color: Colors.white),
                                        fillColor:
                                            Color.fromRGBO(88, 135, 255, .8)),
                                    // fillColor: Colors.white70),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        margin: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(right: 5),
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(
                          left: 5, right: 5, top: 10, bottom: 10),
                    ),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.blue),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                        return 2.0;
                      },
                    ),
                  ),
                  onPressed: () {
                     Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          "ย้อนกลับ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'SukhumvitSet-Bold'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(left: 5),
                width: double.maxFinite,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.only(
                          left: 5, right: 5, top: 10, bottom: 10),
                    ),
                    shape: MaterialStateProperty.resolveWith(
                        (states) => RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            )),
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.blue),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                        return 2.0;
                      },
                    ),
                  ),
                  // onPressed: () {
                  //   if(txtMedicine.text.isNotEmpty && txtMedicineQuantity.text.isNotEmpty ) {
                  //     AppUrl.objAddItemMedicine.nameMedicine = txtMedicine.text.toString();
                  //     AppUrl.objAddItemMedicine.unitSubMedicineName = txtMedicineQuantity.text.toString();
                  //     _pushPagetest(context,false);
                  //    }else {
                  //     _openPopupInvalidate(context,"กรุณากรอกข้อมูลให้ครบถ้วน");
                  //   }
                  // },

                  onPressed: () {
                    // ทำอะไรก็ตามที่คุณต้องการเมื่อกดปุ่ม "หน้าถัดไป"
                    // ในตัวอย่างนี้เราจะแสดงข้อมูลที่ถูกเลือก
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: const Text(
                          "ถัดไป",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'SukhumvitSet-Bold'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
