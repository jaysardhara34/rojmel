import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color(0xfffafafa),
            appBar: AppBar(
              primary: false,
              toolbarHeight: 65,
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue.shade900),
              ),
              elevation: 00,
              centerTitle: true
              ,
              title: Text('History'),
            )));
  }
}
