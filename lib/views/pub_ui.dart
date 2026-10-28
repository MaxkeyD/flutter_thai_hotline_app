import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PubUI extends StatefulWidget {
  const PubUI({super.key});

  @override
  State<PubUI> createState() => _PubUIState();
}

class _PubUIState extends State<PubUI> {// ฟังก์ชั่นโทรออก
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
      'image': 'assets/images/pubutil/pub_1.png',
      'title': 'ไฟฟ้านครหลวง',
      'tel': '1130',
    },
    {
      'image': 'assets/images/pubutil/pub_2.png',
      'title': 'ไฟฟ้าส่วนภูมิภาค',
      'tel': '1129',
    },
    {
      'image': 'assets/images/pubutil/pub_3.png',
      'title': 'ไฟฟ้าฝ่ายผลิต',
      'tel': '1416',
    },
    {
      'image': 'assets/images/pubutil/pub_4.png',
      'title': 'การประปานครหลวง',
      'tel': '1125',
    },
    {
      'image': 'assets/images/pubutil/pub_5.png',
      'title': 'การประปาส่วนภูมิภาค',
      'tel': '1662',
    },
    {
      'image': 'assets/images/pubutil/pub_6.png',
      'title': '1242',
      'tel': '1242',
    },
    {
      'image': 'assets/images/pubutil/pub_7.png',
      'title': '1678',
      'tel': '1678',
    },
    {
      'image': 'assets/images/pubutil/pub_8.png',
      'title': '1175',
      'tel': '1175',
    },
    {
      'image': 'assets/images/pubutil/pub_9.png',
      'title': '1100',
      'tel': '1100',
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
                'สาธารณูปโภค',
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
                'assets/images/pubutil/pub_0.png',
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
                          padding: const EdgeInsets.all(4),
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
