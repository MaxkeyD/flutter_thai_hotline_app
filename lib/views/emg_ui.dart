import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmgUI extends StatefulWidget {
  const EmgUI({super.key});

  @override
  State<EmgUI> createState() => _EmgUIState();
}

class _EmgUIState extends State<EmgUI> {
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
      'image': 'assets/images/emergency/emg_1.png',
      'title': 'เหตุด่วน-เหตุร้าย',
      'tel': '191',
    },
    {
      'image': 'assets/images/emergency/emg_2.png',
      'title': 'แจ้งไฟไหม้-สัตว์เข้าบ้าน',
      'tel': '1197',
    },
    {
      'image': 'assets/images/emergency/emg_3.png',
      'title': 'สายด่วนรถหาย(ตำรวจแห่งชาติ)',
      'tel': '1192',
    },
    {
      'image': 'assets/images/emergency/emg_4.png',
      'title': 'อุบัติเหตุทางน้ำ',
      'tel': '1196',
    },
    {
      'image': 'assets/images/emergency/emg_5.png',
      'title': 'แจ้งคนหาย',
      'tel': '1300',
    },
    {
      'image': 'assets/images/emergency/emg_6.png',
      'title': 'ศูนย์ปลอดภัยคมนาคม',
      'tel': '1356',
    },
    {
      'image': 'assets/images/emergency/emg_7.png',
      'title': 'หน่วยแพทย์กู้ชีพ',
      'tel': '1554',
    },
    {
      'image': 'assets/images/emergency/emg_8.png',
      'title': 'ศูนย์เอราวัณ',
      'tel': '1646',
    },
    {
      'image': 'assets/images/emergency/emg_9.png',
      'title': 'เจ็บป่วยฉุกเฉิน',
      'tel': '1669',
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
                'อุบัติเหตุ-เหตุฉุกเฉิน',
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
                'assets/images/emergency/emg_0.png',
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
