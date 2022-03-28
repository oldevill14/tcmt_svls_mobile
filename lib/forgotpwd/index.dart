import 'package:flutter/material.dart';

class ForgotpwdPage extends StatefulWidget {
  const ForgotpwdPage({Key? key}) : super(key: key);
  @override
  State<ForgotpwdPage> createState() => _ForgotpwdPageState();
}

class _ForgotpwdPageState extends State<ForgotpwdPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/LOGO_Planet_KID.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 10),
            const Text(
              'ลืมรหัสผ่าน? SVLS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'ระบบบริหารจัดการข้อมูลทะเบียนประวัติอาสาสมัครแรงงาน (อสร.)',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 5),
            const Text(
              'ใส่อีเมลที่ลงทะเบียนเพื่อรีเซ็ตรหัสผ่านของคุณ',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'อีเมลของคุณ',
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  primary: Colors.green,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {},
                child: const Text(
                  'รีเซ็ตรหัสผ่านของคุณ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
