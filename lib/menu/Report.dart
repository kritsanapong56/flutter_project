import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xfff6f6f9),
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(88, 135, 255, 1),
        title: Text('รายงานการทานยา',
            style: TextStyle(fontFamily: 'SukhumvitSet-Bold',
                fontSize: 22,fontWeight: FontWeight.w500
            )
        ),
        leadingWidth: 0,
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(
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

    );
  }
}