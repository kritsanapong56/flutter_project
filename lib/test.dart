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
  Widget build(BuildContext context)  => Scaffold(
    bottomNavigationBar: NavigationBar(
      destinations: [
        NavigationDestination(
          icon: Icon (Icons.medication),
          label: 'ยา',
          ),
          NavigationDestination(
          icon: Icon (Icons.home),
          label: 'หน้าหลัก',
          ),
          NavigationDestination(
          icon: Icon (Icons.menu),
          label: 'เมนู',
          ),
      ],
    ),
    );
  }
  

