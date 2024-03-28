import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/listmedicine.dart';
import 'package:flutter_application_1/menu/menulist.dart';
import 'package:flutter_application_1/test.dart';
import 'package:flutter_application_1/ui/Addmedicine.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart'; // import package ของ calendar

class Home extends StatefulWidget {
  const Home({Key? key, required List data}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedIndex = 0; 

  // List of icons for the bottom navigation bar
  static const List<Map<String, dynamic>> _icons = [
    {"icon": Icons.medication, "label": "ยา", "page": listmedicine()},
    {"icon": Icons.home, "label": "หน้าลัก", "page": Home(data: [],)},
    {"icon": Icons.menu, "label": "เมนู", "page": menulist()},
  ];

  // Function to handle item tap in bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Navigate to the selected page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _icons[index]["page"]),
      );
    });
  }

final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('medicine').snapshots();





  var dateOutputDate = DateTime.now();
  var selectedDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(88, 135, 255, 1),
        title: Text('ชื่อ-นามสกุล'),
        leading: Icon(Icons.person),
        actions: [
          IconButton(
            icon: Icon(Icons.add), // ไอคอนเพิ่มยา
            onPressed: () {
              // เพิ่มโค้ดเมื่อปุ่มถูกคลิก
              // สามารถเปิดหน้าเพิ่มยาหรือทำอะไรก็ได้ตามที่ต้องการ
            },
          ),
        ],
      ),
      body: Container(
          child: Column(
            children: [
              Container(
                height: 150,
                child: EventCalendar(
                  dateTime: CalendarDateTime(
                    year: dateOutputDate.year,
                    month: dateOutputDate.month,
                    day: dateOutputDate.day,
                    calendarType: CalendarType.GREGORIAN,
                  ),
                  calendarOptions: CalendarOptions(
                      toggleViewType: false, viewType: ViewType.DAILY),
                  dayOptions: DayOptions(
                    compactMode: false,
                    dayFontSize: 16.0,
                    disableFadeEffect: true,
                    weekDaySelectedColor: Colors.black,
                    selectedTextColor: Colors.black,
                    selectedBackgroundColor:
                        const Color.fromRGBO(141, 206, 254, 1.0),
                  ),
                  headerOptions: HeaderOptions(
                      weekDayStringType: WeekDayStringTypes.SHORT,
                      monthStringType: MonthStringTypes.FULL,
                      headerTextColor: Colors.black),
                  // headerOptions: HeaderOptions(weekDayStringType: WeekDayStringTypes.SHORT),
                  calendarType: CalendarType.GREGORIAN,
                  calendarLanguage: 'en',
                  onInit: () {
                    DateTime dateTemp = DateTime(dateOutputDate.year,
                        dateOutputDate.month, dateOutputDate.day, 0, 0);
                    var sDate =
                        DateFormat('yyyy-MM-dd').format(dateTemp).toString();
                    selectedDate = sDate;
                    var inputFormat = DateFormat('yyyy-MM-dd');
                    dateOutputDate =
                        inputFormat.parse(selectedDate); // <-- dd/MM 24H format
                    //loadDataMedicineToDay
                    (selectedDate);
                  },
       onDateTimeReset: (date) {
                    setState(() {
                      DateTime dateTemp =
                          DateTime(date.year, date.month, date.day, 0, 0);
                      var sDate =
                          DateFormat('yyyy-MM-dd').format(dateTemp).toString();
                      selectedDate = sDate;
                      var inputFormat = DateFormat('yyyy-MM-dd');
                      dateOutputDate = inputFormat.parse(selectedDate);
                    });
                  },
                  onChangeDateTime: (date) {
                    setState(() {
                      DateTime dateTemp =
                          DateTime(date.year, date.month, date.day, 0, 0);
                      var sDate =
                          DateFormat('yyyy-MM-dd').format(dateTemp).toString();
                      selectedDate = sDate;
                      var inputFormat = DateFormat('yyyy-MM-dd');
                      dateOutputDate = inputFormat.parse(selectedDate);
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(88, 135, 255, 1),
                    borderRadius: BorderRadius.circular(25.0)),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Text(
                    DateFormat.yMMMd().format(dateOutputDate).toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontFamily: 'SukhumvitSet-Bold'),
                    textAlign: TextAlign.center),
              ),
              Expanded(
      child: Container(
  width: double.maxFinite,
  height: double.maxFinite,
  child: StreamBuilder<QuerySnapshot>(
    stream: user,
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (snapshot.hasError) {
        return const Text('Something went wrong');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text('Loading');
      }
      final data = snapshot.requireData;
      return ListView.builder(
  itemCount: data.size,
  itemBuilder: (context, index) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: cardColor, // ใช้สีของ cardColor
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Card(
  color: Colors.lightGreen[200], // กำหนดสีเขียวอ่อนให้กับพื้นหลังของ Card
  elevation: 0, // เอาเงาของ Card ออกไป
  child: ListTile(
    title: Text(
      '${data.docs[index]['ชื่อยา']} ${data.docs[index]['ปริมาณยาที่ทานต่อครั้ง']} ${data.docs[index]['หน่วยยา']} ',
      style: const TextStyle(fontSize: 25),
    ),
    subtitle: Text(
      'เวลาทานยา ${data.docs[index]['เวลาแจ้งเตือน']}',
    ),
    onTap: () {
      showMedicationDialog(context, data.docs[index]['ชื่อยา']);
    },
  ),
),
    );
  },
);
    },
  ),
),
    ),
    ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Addmedicine()),
    );
  },
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32), // ปรับขนาดปุ่มตามต้องการ
    primary: Colors.blue, // สีพื้นหลังของปุ่ม
    onPrimary: Colors.white, // สีข้อความ
  ),
  child: Text('เพิ่มยา'),
),
            ],
          ),
        ),
bottomNavigationBar: BottomNavigationBar(
        items: _icons.asMap().entries.map((MapEntry<int, Map<String, dynamic>> entry) {
          return BottomNavigationBarItem(
            icon: Icon(entry.value["icon"], size: 60, color: Color.fromARGB(255, 72, 71, 71),),
             // Icon size
            label: entry.value["label"],
          );
        }).toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),


    );
  }
 




//  Function pop up
// สร้างตัวแปรสถานะสำหรับเก็บสีของ Card
Color cardColor = Colors.white; // เริ่มต้นสีของ Card เป็นสีขาว

void showMedicationDialog(BuildContext context, String medicationName) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("รับยา"),
        content: Text("คุณต้องการที่จะรับยา $medicationName ใช่หรือไม่?"),
        actions: <Widget>[
          // ปุ่มยกเลิก
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 226, 4, 4), // กำหนดสีพื้นหลังของปุ่ม "ยกเลิก" เป็นสีแดง
            ),
            child: Text(
              'ยกเลิก',
              style: TextStyle(
                color: Colors.white, // กำหนดสีของตัวหนังสือในปุ่ม "ยกเลิก" เป็นสีขาว
              ),
            ),
          ),
          // ปุ่มยืนยัน
          TextButton(
            onPressed: () {
              // เมื่อกดปุ่ม "ยืนยัน" ให้เปลี่ยนสีของ Card เป็นสีเขียว
              setState(() {
                cardColor = Color.fromARGB(255, 239, 4, 4)!;
              });
              Navigator.of(context).pop(); // ปิด AlertDialog
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 16, 186, 220), // กำหนดสีพื้นหลังของปุ่ม "ยืนยัน" เป็นสีแดง
            ),
            child: Text(
              'ยืนยัน',
              style: TextStyle(
                color: Colors.white, // กำหนดสีของตัวหนังสือในปุ่ม "ยืนยัน" เป็นสีขาว
              ),
            ),
          ),
        ],
      );
    },
  );
}
 }