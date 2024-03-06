import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class Addmedicine extends StatefulWidget {
  const Addmedicine({super.key});

  @override
  State<Addmedicine> createState() => _Addmedicine();
}

class _Addmedicine extends State<Addmedicine>{
  @override
  TextEditingController txtMedicine = TextEditingController();
  TextEditingController txtMedicineQuantity = TextEditingController();
  int _selectedIndex = -1;
  var _selectedTimeTakeId = "0";
  void initState() {
    super.initState();
  }
  


String dropdownValue = 'หน่วยยา';
  void handleBottomSheetItemTap(String value) {
    setState(() {
      dropdownValue = value;
    });
    Navigator.pop(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "กรุณาเพิ่มยา",
          style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontFamily: 'SukhumvitSet-Bold'),
        ),
leading: IconButton(
          icon: const ImageIcon(
            AssetImage("assets/images/arrow_left.png"),
            size: 40,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
    ),

body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        margin: const EdgeInsets.only(top: 30.0),
        child: ListView(children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              flex: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  /////////////////////ชื่อยา/////////////////////////////////////////////////////
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, left: 10, right: 10),
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    width: double.maxFinite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'ชื่อยา', // Your additional text here
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontFamily: 'SukhumvitSet-Bold',
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                            height:
                                                10), // Adjust the spacing between text and TextField
                                        TextField(
                                          controller: txtMedicine,
                                          enabled: true,
                                          style: const TextStyle(
                                            fontSize: 25.0,
                                            fontFamily: 'SukhumvitSet-Bold',
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 15,
                                            ),
                                            border: const OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.all(
                                                Radius.circular(20.0),
                                              ),
                                              borderSide: BorderSide(
                                                width: 0,
                                                style: BorderStyle.none,
                                              ),
                                            ),
                                            filled: true,
                                            hintText: "ชื่อยา",
                                            hintStyle: TextStyle(
                                              fontFamily: 'SukhumvitSet-Medium',
                                              color: Colors.grey[800],
                                            ),
                                           
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ///////////////////////////ปริมาณยาที่ทานต่อครั้ง//////////////////////////////
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, left: 10, right: 10),
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    width: double.maxFinite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'ปริมาณยาที่ทานต่อครั้ง', // Your additional text here
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontFamily: 'SukhumvitSet-Bold',
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                            height:
                                                10), // Adjust the spacing between text and TextField
                                        TextField(
                                          controller: txtMedicineQuantity,
                                          enabled: true,
                                          keyboardType:
                                              const TextInputType.numberWithOptions(
                                                  decimal: true),
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(
                                                10),
                                            FilteringTextInputFormatter.allow(
                                                RegExp(r"^\d+(?:\.\d+)?$")),
                                          ],
                                          style: const TextStyle(
                                            fontSize: 25.0,
                                            fontFamily: 'SukhumvitSet-Bold',
                                            color: Colors.black,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 15,
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              borderSide: const BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none),
                                            ),
                                            filled: true,
                                            hintText: "ปริมาณยาที่ทานต่อครั้ง",
                                            hintStyle: TextStyle(
                                              fontFamily: 'SukhumvitSet-Medium',
                                              color: Colors.grey[800],
                                            ),
                                           
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
/////////////////////////////หน่วย/////////////////////////////////////////////////
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, left: 10, right: 10),
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    width: double.maxFinite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'หน่วยยา', // Your additional text here
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontFamily: 'SukhumvitSet-Bold',
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                            height:
                                                10), // Adjust the spacing between text and TextField
                                        Container(
                                          width: 380,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              showModalBottomSheet<void>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Column(
                                                    mainAxisSize: MainAxisSize
                                                        .min, // Prevent wrapping content
                                                    children: <Widget>[
                                                      ListTile(
                                                        title: Text('เม็ด',
                                                          style: TextStyle(
                                                            fontSize: 22,fontFamily:'SukhumvitSet-Medium',
                                                            color: Colors.grey[800],
                                                          ),
                                                        ),
                                                        onTap: () =>
                                                            handleBottomSheetItemTap('เม็ด'),
                                                      ),
                                                      ListTile(
                                                        title: Text('ออนซ์',
                                                          style: TextStyle(
                                                            fontSize: 22,fontFamily:'SukhumvitSet-Medium',
                                                            color: Colors.grey[800],
                                                          ),
                                                        ),
                                                        onTap: () =>
                                                            handleBottomSheetItemTap('ออนซ์'),
                                                      ),
                                                      ListTile(
                                                        title: Text('ช้อนชา',
                                                          style: TextStyle(
                                                            fontSize: 22,fontFamily:'SukhumvitSet-Medium',
                                                            color: Colors.grey[800],
                                                          ),
                                                        ),
                                                        onTap: () =>
                                                            handleBottomSheetItemTap('ช้อนชา'),
                                                      ),
                                                      ListTile(
                                                        title: Text(
                                                          'ช้อนโต๊ะ',
                                                          style: TextStyle(
                                                            fontSize: 22,fontFamily:'SukhumvitSet-Medium',
                                                            color: Colors.grey[800],
                                                          ),
                                                        ),
                                                        onTap: () =>
                                                            handleBottomSheetItemTap('ช้อนโต๊ะ'),
                                                      ),
                                                      ListTile(
                                                        title: Text('มิลลิกรัม',style: TextStyle(
                                                            fontSize: 22,fontFamily:'SukhumvitSet-Medium',
                                                            color: Colors.grey[800],
                                                          ),
                                                        ),
                                                        onTap: () =>
                                                            handleBottomSheetItemTap('มิลลิกรัม'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                        
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                            child: Text(
                                              dropdownValue, // Display "เลือก" if no value is selected
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontFamily:
                                                    'SukhumvitSet-Medium',
                                                color: Colors.grey[800],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // Container(
                                  //     padding: EdgeInsets.only(top: 20),
                                  //     alignment: Alignment.center,
                                  //     child: _buildChipsTypeTime())
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ]),
      ),




    );
  
  }






}