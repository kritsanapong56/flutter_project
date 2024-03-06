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
   final Stream<QuerySnapshot> user = FirebaseFirestore.instance.collection('test').snapshots();
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
               AsyncSnapshot<QuerySnapshot> snapshot,
               ) {
                if (snapshot.hasError){
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Text('Loading');
                }
                final data = snapshot.requireData;
                return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context,index) {
                    return Text('${data.docs[index]['ชื่อยา']} ${data.docs[index]['จำนวนเม็ด']}',
                    style: TextStyle(fontSize: 25),);
                  },
                  );
               },
               ),
      ),
    );
  }
}