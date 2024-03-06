import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  final nameController = TextEditingController();
  final listmedicineController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(88, 135, 255, 1),
        leadingWidth: 0,
        title: const Text('TEST',
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'name'),
              ),
              TextFormField(
                controller: listmedicineController,
                decoration: const InputDecoration(hintText: 'medicine'),
              ),
              ElevatedButton(
                onPressed: () {
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('test');///ชื่อcollection
                  collRef.add({
                    'name': nameController.text,
                    'listmedicine': listmedicineController.text,
                  });
                },
                child: const Text('ตกลง'),
              )
            ],
          )),
    );
  }
}
