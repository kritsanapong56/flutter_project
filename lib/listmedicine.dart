import 'package:flutter/material.dart';

class listmedicine extends StatefulWidget {
  const listmedicine({super.key});

  @override
  State<listmedicine> createState() => _listmedicineState();
}

class _listmedicineState extends State<listmedicine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(88, 135, 255, 1),
        leadingWidth: 0,
        title: const Text('ข้อมูลยา',
            style: TextStyle(fontFamily: 'SukhumvitSet-Bold',
                fontSize: 22,fontWeight: FontWeight.w500
            )
        ),
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
        child: const Expanded(
          child: Center(
            child: Text('data'),
          )
          ),
      ),
    );
  }
}