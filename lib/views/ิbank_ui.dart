import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class BankUI extends StatefulWidget {
  const BankUI({super.key});

  @override
  State<BankUI> createState() => _BankUIState();
}

class _BankUIState extends State<BankUI> {
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
      'image': 'assets/images/bank/bank_1.png',
      'title': '1333',
      'tel': '1333',
    },
    {
      'image': 'assets/images/bank/bank_2.png',
      'title': '1115',
      'tel': '1115',
    },
    {
      'image': 'assets/images/bank/bank_3.png',
      'title': '02 888 8888',
      'tel': '028888888',
    },
    {
      'image': 'assets/images/bank/bank_4.png',
      'title': '02 111 1111',
      'tel': '021111111',
    },
    {
      'image': 'assets/images/bank/bank_5.png',
      'title': '1572',
      'tel': '1572',
    },
    {
      'image': 'assets/images/bank/bank_6.png',
      'title': '1428',
      'tel': '1428',
    },
    {
      'image': 'assets/images/bank/bank_7.png',
      'title': '1588',
      'tel': '1588',
    },
    {
      'image': 'assets/images/bank/bank_8.png',
      'title': '1327',
      'tel': '1327',
    },
    {
      'image': 'assets/images/bank/bank_9.png',
      'title': '02 645 9000',
      'tel': '026459000',
    },
    {
      'image': 'assets/images/bank/bank_10.png',
      'title': '02 777 7777',
      'tel': '027777777',
    },
    {
      'image': 'assets/images/bank/bank_11.png',
      'title': '02 165 5555',
      'tel': '021655555',
    },
    {
      'image': 'assets/images/bank/bank_12.png',
      'title': '02 697 5454',
      'tel': '026975454',
    },
    {
      'image': 'assets/images/bank/bank_13.png',
      'title': '02 285 1555',
      'tel': '026459000',
    },
    {
      'image': 'assets/images/bank/bank_14.png',
      'title': '02 633 6000',
      'tel': '026336000',
      
    },
    {
      'image': 'assets/images/bank/bank_15.png',
      'title': '02 204 2766',
      'tel': '022042766',
    },
    {
      'image': 'assets/images/bank/bank_16.png',
      'title': '02 626 7777',
      'tel': '026267777',
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
                'ธนาคาร',
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
                'assets/images/bank/bank_0.png',
                width: MediaQuery.of(context).size.width * 0.8,
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
