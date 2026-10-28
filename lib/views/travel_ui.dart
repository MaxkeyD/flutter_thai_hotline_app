// ignore_for_file: unused_import, unused_label, dead_code

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TravelUI extends StatefulWidget {
  const TravelUI({super.key});

  @override
  State<TravelUI> createState() => _TravelUIState();
}

class _TravelUIState extends State<TravelUI> {
// ฟังก์ชั่นโทรออก
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    
     await launchUrl(phoneUri);
    
  }

// ตัวแปรเก็บข้อมูลต่างๆ
  List data = [
    {
      'image': 'assets/images/travel/travel_1.png',
      'title': 'กรมทางหลวงชนบท',
      'tel': '1146',
    },
    {
      'image': 'assets/images/travel/travel_4.png',
      'title': 'ข้อมูลจราจร',
      'tel': '1197',
    },
    {
      'image': 'assets/images/travel/travel_3.png',
      'title': 'ตำรวจทางหลวง',
      'tel': '1193',
    },
    {
      'image': 'assets/images/travel/travel_2.png',
      'title': 'ตำรวจท่องเที่ยว',
      'tel': '1155',
    },
    {
      'image': 'assets/images/travel/travel_7.png',
      'title': 'เส้นทางบนทางด่วน',
      'tel': '1543',
    },
    {
      'image': 'assets/images/travel/travel_5.png',
      'title': 'ขสมก',
      'tel': '1348',
    },
    {
      'image': 'assets/images/travel/travel_6.png',
      'title': 'บขส',
      'tel': '1490',
    },
    {
      'image': 'assets/images/travel/travel_8.png',
      'title': 'กรมทางหลวง',
      'tel': '1586',
    },
    {
      'image': 'assets/images/travel/travel_9.png',
      'title': 'การรถไฟแห่งประเทศไทย',
      'tel': '1690',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'สายด่วน',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'การเดินทาง',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Image.asset(
                'assets/images/travel/travel_0.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              SizedBox(
                height: 22,
              ),
              // แสดงข้อมูล Listview
              Expanded(
                child: ListView.separated(
                  // จำนวนข้อมูลที่จะแสดงใน Listview
                  itemCount: data.length,
                  // สร้าง Seperate เส้นแบ่งง
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.white,
                  ),
                  // สร้างหน้าตาของรายการที่จะแสดงที่ Listview
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 55,
                          height: 55,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset(
                            data[index]['image'],
                          ),
                        ),
                        title: Text(
                          data[index]['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          data[index]['tel'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            makePhoneCall(data[index]['tel']);
                          },
                          icon: Icon(Icons.phone),
                          color: Colors.green,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
