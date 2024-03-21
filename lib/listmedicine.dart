import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/menu/menulist.dart';

class listmedicine extends StatefulWidget {
  const listmedicine({super.key});

  @override
  State<listmedicine> createState() => _listmedicineState();
}

class _listmedicineState extends State<listmedicine> {
  final Stream<QuerySnapshot> user =
      FirebaseFirestore.instance.collection('medicine').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(88, 135, 255, 1),
        leadingWidth: 0,
        title: const Text('ข้อมูลยา',
            style: TextStyle(
                fontFamily: 'SukhumvitSet-Bold',
                fontSize: 22,
                fontWeight: FontWeight.w500)),
        leading: Container(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const menulist()),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: StreamBuilder<QuerySnapshot>(
          stream: user,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,) {
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
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      '${data.docs[index]['ชื่อยา']} ${data.docs[index]['ปริมาณยาที่ทานต่อครั้ง']} ${data.docs[index]['หน่วยยา']} ',
                      style: const TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      'เริ่มทาน ${data.docs[index]['วันที่เริ่มทาน']} ความถี่ ${data.docs[index] ['ความถี่']}',),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // IconButton(
                        //   icon: const Icon(Icons.edit),
                        //   onPressed: () {
                        //     showEditDialog(context, data.docs[index]);
                        //   },
                        // ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext dialogContext) {
                                return AlertDialog(
                                  title: const Text('คุณต้องการลบยาหรือไม่'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(dialogContext)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('ยกเลิก'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        data.docs[index].reference.delete();
                                        Navigator.of(dialogContext)
                                            .pop(); // Close the dialog
                                      },
                                      child: const Text('ตกลง'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

void showEditDialog(BuildContext context, DocumentSnapshot document) {
  TextEditingController newNameController = TextEditingController();
  TextEditingController newAmountController = TextEditingController();
  newNameController.text = document['ชื่อยา'];
  newAmountController.text = document['ปริมาณยาที่ทานต่อครั้ง'].toString();
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit Medication'),
        content: Column(
          children: [
            TextField(
              controller: newNameController,
              decoration: const InputDecoration(labelText: 'New Medication Name'),
            ),
            TextField(
              controller: newAmountController,
              decoration: const InputDecoration(labelText: 'New Amount of Pills'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () {
              document.reference.update({
                'ชื่อยา': newNameController.text,
                'ปริมาณยาที่ทานต่อครั้ง': int.parse(newAmountController.text),
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

  Future<void> deleteData(String documentId) async {

      print('Error deleting document:');
      // Handle errors as needed
    
  }
}
