import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_thai_hotline_app/views/%E0%B8%B4bank_ui.dart';
import 'package:flutter_thai_hotline_app/views/about_ui.dart';
import 'package:flutter_thai_hotline_app/views/emg_ui.dart';
import 'package:flutter_thai_hotline_app/views/pub_ui.dart';
import 'package:flutter_thai_hotline_app/views/travel_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // สร้างตัวแปรเก็บหน้าย่อยที่จะแสดงที่ body
  // ตัวแปรแบบ List เก็บได้มากกว่า 1 ค่าข้อมูล
  // แต่ละค่าข้อมูลจะมี index number กำกับ
  List subView = [
    TravelUI(),
    EmgUI(),
    BankUI(),
    PubUI(),
  ];

  int? selectedIndex;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // ส่วนของ Appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'สายด่วน THAILAND',
          style: TextStyle(
            color: Colors.white,
            fontSize: MediaQuery.of(context).size.width * 0.065,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actionsPadding: const EdgeInsets.only(right: 10),
        actions: [
          IconButton(
            iconSize: 26,
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUI(),
                ),
              );
            },
          ),
        ],
      ),
      // ส่วนของ BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (paramValue) {
          setState(() {
            selectedIndex = paramValue;
          });
        },
        currentIndex: selectedIndex ?? 0,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.travel_explore,
            ),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.emergency,
            ),
            label: 'อุบัติเหตุ-เหตุฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance,
            ),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.electric_bolt,
            ),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
      // ส่วนของ body
      body: selectedIndex == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'สายด่วนประเทศไทย ☎️',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: sin(_controller.value * 2 * pi) * 0.25,
                        child: child,
                      );
                    },
                    child: const Icon(
                      Icons.phone_in_talk,
                      size: 150,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Text(
                    'เลือกเมนูที่ต้องการ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          0,
                          sin(_controller.value * 2 * pi) * 10,
                        ),
                        child: child,
                      );
                    },
                    child: const Icon(
                      Icons.expand_more,
                      color: Colors.black,
                      size: 70,
                    ),
                  ),
                ],
              ),
            )
          : subView[selectedIndex ?? 0],
    );
  }
}
