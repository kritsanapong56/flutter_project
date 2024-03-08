import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/Addmedicine.dart';
import 'package:flutter_application_1/ui/Addtime.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:weekday_selector/weekday_selector.dart';

StreamController<List<String>> selectedDaysController =
    StreamController<List<String>>.broadcast();

class frequency extends StatefulWidget {
  const frequency({super.key});

  @override
  State<frequency> createState() => _frequencyState();
}

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  int _selectedValue = 1;
  String _selectedType = 'Day';

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> _dropdownMenuItems = [
      const DropdownMenuItem(
          value: 'Day',
          child: Text(
            'วัน',
            style: TextStyle(fontSize: 25),
          )),
      const DropdownMenuItem(
          value: 'Week',
          child: Text(
            'สัปดาห์',
            style: TextStyle(fontSize: 25),
          )),
      const DropdownMenuItem(
          value: 'Month',
          child: Text(
            'เดือน',
            style: TextStyle(fontSize: 25),
          )),
    ];
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(bottom: 10)),
      ],
    );
  }

  String getSelectedDate() {
    switch (_selectedType) {
      case 'Day':
        return "$_selectedValue วัน";
      case 'Month':
        return "$_selectedValue เดือน";
      case 'Week':
        return "$_selectedValue สัปดาห์";
      default:
        return "";
    }
  }
}

class _frequencyState extends State<frequency> {
  var _stxtHBD = "";
  final txtHBDController = TextEditingController();
  final selectfrequencyController = TextEditingController();
  int selectedNumber = 1;
  final values = List.filled(7, true);
  int _selectedValue = 1;
  String _selectedType = 'วัน';
  final List<DropdownMenuItem<String>> _dropdownMenuItems = [
    const DropdownMenuItem(
        value: 'วัน',
        child: Text(
          'วัน',
          style: TextStyle(fontSize: 25),
        )),
    const DropdownMenuItem(
        value: 'สัปดาห์',
        child: Text(
          'สัปดาห์',
          style: TextStyle(fontSize: 25),
        )),
    const DropdownMenuItem(
        value: 'เดือน',
        child: Text(
          'เดือน',
          style: TextStyle(fontSize: 25),
        )),
  ];
  final List<DropdownMenuItem<int>> _daysDropdownMenuItems =
      List.generate(365, (index) {
    return DropdownMenuItem(
        value: index + 1,
        child: Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 25),
        ));
  });
  final List<DropdownMenuItem<int>> _monthsDropdownMenuItems =
      List.generate(12, (index) {
    return DropdownMenuItem(
        value: index + 1,
        child: Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 25),
        ));
  });
  final List<DropdownMenuItem<int>> _weeksDropdownMenuItems =
      List.generate(52, (index) {
    return DropdownMenuItem(
        value: index + 1,
        child: Text(
          '${index + 1}',
          style: const TextStyle(fontSize: 25),
        ));
  });

  String getSelectedDate() {
    switch (_selectedType) {
      case 'วัน':
        return "$_selectedValue วัน";
      case 'เดือน':
        return "$_selectedValue เดือน";
      case 'สัปดาห์':
        return "$_selectedValue สัปดาห์";
      default:
        return "";
    }
  }

  String getSelectedDaysString(List<bool> values) {
    List<String> selectedDays = [];
    for (int i = 0; i < values.length; i++) {
      if (values[i]) {
        selectedDays.add(getDayNameFromIndex(i));
      }
    }
    return selectedDays.isEmpty ? 'ไม่เลือกวัน' : selectedDays.join(', ');
  }

  String getDayNameFromIndex(int index) {
    // Convert index to day name, customize as needed
    switch (index) {
      case 0:
        return 'อา';
      case 1:
        return 'จ';
      case 2:
        return 'อ';
      case 3:
        return 'พ';
      case 4:
        return 'พฤ';
      case 5:
        return 'ศ';
      case 6:
        return 'ส';
      default:
        return '';
    }
  }

  void dateHBD(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    Timer(const Duration(milliseconds: 400), () {
      int yearCurrent = DateTime.now().year + 1;
      showRoundedDatePicker(
        borderRadius: 25,
        styleDatePicker: MaterialRoundedDatePickerStyle(
          textStyleDayHeader: const TextStyle(
              fontFamily: 'SukhumvitSet-Bold',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(88, 135, 255, 1)),
          textStyleDayOnCalendar: const TextStyle(
              fontFamily: 'SukhumvitSet-Bold',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color.fromRGBO(88, 135, 255, 1)),
          paddingMonthHeader: EdgeInsets.all(10),
          sizeArrow: 40,
          colorArrowPrevious: const Color.fromRGBO(88, 135, 255, 1),
          colorArrowNext: const Color.fromRGBO(88, 135, 255, 1),
          textStyleMonthYearHeader: const TextStyle(
              fontFamily: 'SukhumvitSet-Bold',
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          textStyleButtonPositive: const TextStyle(
              fontFamily: 'SukhumvitSet-Bold',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff8B939A)),
          textStyleButtonNegative: const TextStyle(
              fontFamily: 'SukhumvitSet-Bold',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff8B939A)),
        ),
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(88, 135, 255, 1),
          hintColor: const Color.fromRGBO(88, 135, 255, 1),
          textTheme: const TextTheme(
            caption: TextStyle(
                fontFamily: 'SukhumvitSet-Bold',
                fontWeight: FontWeight.w500,
                color: Color(0xff8B939A)),
          ),
        ),
        // era: EraMode.BUDDHIST_YEAR,
        context: context,
        height: 330,
        fontFamily: 'SukhumvitSet-Bold',
        // locale: const Locale("th"),
        initialDate: DateTime.now(),
        firstDate: DateTime(1850),
        lastDate: DateTime(yearCurrent),
      ).then((date) {
        setState(() {
          _stxtHBD = DateFormat('yyyy-MM-dd').format(date!);
          var strDay = DateFormat('dd/MM/yyyy').format(date!);
          txtHBDController.text = strDay;
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        });
      });
    });
  }

  List<bool> selectedDays = List.filled(7, false);
  bool showWeekdaySelector = false;
  bool isChecked = false;
  bool showSecondColumn = false;
  int selectedRadio = 0;
  int selectedValue = 1;
  String selectedType = 'Day';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(88, 135, 255, 1),
        title: const Text(
          "ความถี่การทานยา",
          style: TextStyle(
              fontSize: 25,
              
              fontFamily: 'SukhumvitSet-Bold'),
        ),
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage("assets/images/arrow_left.png"),
            size: 40,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Addmedicine()),
            );
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 20,
              ),
              width: double.maxFinite,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ความถี่ในการทานยา",
                    style: TextStyle(
                      fontSize: 23.0,
                      fontFamily: 'SukhumvitSet-Medium',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              width: double.maxFinite,
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRadio = value ?? 0;
                      });
                    },
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ประจำวัน",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontFamily: 'SukhumvitSet-Medium',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //////////////////////แสดงประจำวัน
            if (selectedRadio == 1)
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20),
                width: double.maxFinite,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.resolveWith(
                              (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            print("ประจำวัน");
                          },
                          child: const Text(
                            "ประจำวัน",
                            style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'SukhumvitSet-Medium',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              width: double.maxFinite,
              child: Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRadio = value ?? 0;
                      });
                    },
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "วันของสัปดาห์",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontFamily: 'SukhumvitSet-Medium',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
//////////// /////////กดเลือกradio แสดง วัน//////////////////////////////////
            if (selectedRadio == 2)
              SizedBox(
                height: 92,
                child: WeekdaySelector(
                  onChanged: (int day) {
                    setState(() {
                      final index = day % 7;
                      values[index] = !values[index];
                      selectedDays[index] =
                          !selectedDays[index]; // Store selected values
                      // Call the function to print selected days
                    });
                  },
                  values: values,
                  shortWeekdays: const ['อา', 'จ', 'อ', 'พ', 'พฤ', 'ศ', 'ส'],
                ),
              ),

            if (selectedRadio == 2)
              Container(
                width: 380,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(211, 234, 250, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    getSelectedDaysString(selectedDays),
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'SukhumvitSet-Medium',
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20),
              width: double.maxFinite,
              child: Row(
                children: [
                  Radio(
                    value: 3,
                    groupValue: selectedRadio,
                    onChanged: (int? value) {
                      setState(() {
                        selectedRadio = value ?? 0;
                      });
                    },
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ช่วงวัน",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontFamily: 'SukhumvitSet-Medium',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (selectedRadio == 3)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(bottom: 10)),
                  const Text('เลือกช่วงวัน',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DropdownButton(
                        value: _selectedValue,
                        items: _selectedType == 'Day'
                            ? _daysDropdownMenuItems
                            : (_selectedType == 'Month'
                                ? _monthsDropdownMenuItems
                                : _weeksDropdownMenuItems),
                        onChanged: (value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                      ),
                      DropdownButton(
                        value: _selectedType,
                        items: _dropdownMenuItems,
                        onChanged: (value) {
                          setState(() {
                            _selectedType = value!;
                            _selectedValue =
                                1; // Reset selected value when changing type
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("วันที่เลือก: ${getSelectedDate()}",
                          style: const TextStyle(fontSize: 24),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ),
                ],
              ),

            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin:const EdgeInsets.only(top: 20, left: 10, right: 10),
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Align text to the start
                          children: [
                            const Text(
                              "เริ่มต้น",
                              style: TextStyle(
                                fontSize: 23.0,
                                fontFamily: 'SukhumvitSet-Medium',
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                                height:
                                    10), // Adjust the spacing between "เริ่มต้น" and TextField
                            TextField(
                              onTap: () {
                                dateHBD(context);
                              },
                              controller: txtHBDController,
                              readOnly: true,
                              style: const TextStyle(
                                fontSize: 25.0,
                                fontFamily: 'SukhumvitSet-Bold',
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0,
                                  horizontal: 15,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                filled: true,
                                hintText: "วันที่เริ่มทาน",
                                hintStyle: TextStyle(
                                  fontSize: 22,
                                  fontFamily: 'SukhumvitSet-Medium',
                                  color: Colors.grey[800],
                                ),
                                fillColor:
                                    const Color.fromRGBO(211, 234, 250, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                        (states) => const Color.fromRGBO(88, 135, 255, 1)),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                        return 2.0;
                      },
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Addmedicine()),
                    );
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
                        (states) => const Color.fromRGBO(88, 135, 255, 1)),
                    elevation: MaterialStateProperty.resolveWith<double>(
                      (Set<MaterialState> states) {
                        return 2.0;
                      },
                    ),
                  ),
                  onPressed: () async {
                    CollectionReference collRef =
                        FirebaseFirestore.instance.collection('medicine');
                    String frequency = '';
                    switch (selectedRadio) {
                      case 1:
                        frequency = 'ประจำวัน';
                        collRef.add({
                          'ความถี่ในการทานยา': frequency,
                          'วันที่เริ่มทาน': txtHBDController.text,
                        });
                        break;
                      case 2:
                        frequency = 'วันของสัปดาห์';
                        collRef.add({
                          'ความถี่ในการทานยา': frequency,
                          'วัน':getSelectedDaysString(selectedDays),
                          'วันที่เริ่มทาน': txtHBDController.text,
                        });
                        break;
                      case 3:
                        frequency = 'ช่วงวัน';
                        collRef.add({
                          'ความถี่ในการทานยา': frequency,
                          'ช่วง': _selectedType,
                          'จำนวนของช่วง': _selectedValue,
                          'วันที่เริ่มทาน': txtHBDController.text,
                        });
                        break;
                    }

                    ///ชื่อcollection

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Addtime()),
                    );
                    print('เลือกข้อมูล: $selectedNumber');
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
