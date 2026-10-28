import 'package:flutter/material.dart';

import 'package:flutter_thai_hotline_app/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // โค้ดหน่วงเวลาเอาไว้
    //เปิดไปย้อนกลับไม่ได้
    Future.delayed(
      Duration(
        seconds: 3,
      ),
      (){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeUI(),
          ),
        );
      }
    );

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.004,

            // ),
            
            
            Image.asset(
              'assets/icon/icon.png',
              width: MediaQuery.of(context).size.width * 0.4,
              // height: MediaQuery.of(context).size.height * 0.4,
            
            ),
            SizedBox(
              height:50,
            ),
             SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              child: CircularProgressIndicator(
                color: Colors.redAccent,
                strokeWidth: 5,
              ),
            ),
            SizedBox(
              height: 40,
            ),

            
            
            Text(
              'THAI HOTLINE APP',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            Text(
              'สายด่วน',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),

          ],
        ),
      ),
    );
  }
}