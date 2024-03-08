import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/Addmedicine.dart';
import 'package:flutter_application_1/ui/freq.dart';

class Addtime extends StatefulWidget {
  const Addtime({super.key});

  @override
  State<Addtime> createState() => _AddtimeState();
}

class _AddtimeState extends State<Addtime> {
  final CollectionReference timeCollection =
      FirebaseFirestore.instance.collection('medicine');
  final String userId = 'user_id';

Future<void> addPickedTime(TimeOfDay pickedTime) async {
    // Check if the document already exists
    final DocumentSnapshot<Object?> document =
        await timeCollection.doc(userId).get();

    if (document.exists) {
      // If the document exists, update the existing document
      return timeCollection.doc(userId).update({
        'selectedTimes': FieldValue.arrayUnion([
          {
            'hour': pickedTime.hour,
            'minute': pickedTime.minute,
          },
        ]),
      });
    } else {
      // If the document doesn't exist, create a new document
      return timeCollection.doc(userId).set({
        'selectedTimes': [
          {
            'hour': pickedTime.hour,
            'minute': pickedTime.minute,
          },
        ],
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  List<TimeOfDay> selectedTimes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('คุณต้องการรับแจ้งเตือนกี่โมง',
            style: TextStyle(
                fontFamily: 'SukhumvitSet-Bold',
                fontSize: 24,
                fontWeight: FontWeight.w500)),
        backgroundColor: const Color.fromRGBO(88, 135, 255, 1),
        leading: IconButton(
          icon: const ImageIcon(
            AssetImage("assets/images/arrow_left.png"),
            size: 40,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const frequency()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 25)),
            const Text(
              'เวลาแจ้งเตือน',
              style: TextStyle(fontSize: 24, fontFamily: "SukhumvitSet-Medium"),
            ),
            for (int index = 0; index < selectedTimes.length; index++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedTimes[index],
                        builder: (BuildContext context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          );
                        },
                      );
                      if (pickedTime != null && pickedTime.minute <= 59) {
                        setState(() {
                          selectedTimes[index] = pickedTime;
                        });
                      }
                    },
                    child: Container(
                      width: 130,
                      height: 65,
                      padding: const EdgeInsets.fromLTRB(21, 8, 2, 5),
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${selectedTimes[index].hour} : ${selectedTimes[index].minute.toString().padLeft(2, '0')}',
                            style: const TextStyle(
                              fontSize: 26,
                              fontFamily: "SukhumvitSet-Bold",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        selectedTimes.removeAt(index);
                      });
                    },
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (BuildContext context, Widget? child) {
                      return MediaQuery(
                        data: MediaQuery.of(context)
                            .copyWith(alwaysUse24HourFormat: true),
                        child: child!,
                      );
                    },
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedTimes.add(pickedTime);
                    });
                  }

                  if (selectedTimes.isNotEmpty) {
                    await addPickedTime(selectedTimes.last);
                  }
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 128, 202, 255)),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add,
                        color: Colors.white), // Add the desired icon
                    SizedBox(
                        width:
                            10), // Adjust the spacing between the icon and text
                    Text(
                      'ตั้งเวลาแจ้งเตือน',
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: "SukhumvitSet-Medium",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

/////////////////////ย้อนกลับ-ตกลง/////////////////////////////////
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
                        builder: (context) => const frequency(),
                      ),
                    );
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ย้อนกลับ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'SukhumvitSet-Bold'),
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
                    // Assuming you want to add the last picked time
                    if (selectedTimes.isNotEmpty) {
                      await addPickedTime(selectedTimes.last);
                    }
                    // Add any other navigation logic or actions you need
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ตกลง",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'SukhumvitSet-Bold'),
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
