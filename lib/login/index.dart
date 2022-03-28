import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dialog.dart';
import '../home/index.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
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
              'เข้าสู่ระบบ SVLS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              'ระบบบริหารจัดการข้อมูลทะเบียนประวัติอาสาสมัครแรงงาน (อสร.)',
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'ชื่อผู้ใช้งาน',
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  labelText: 'รหัสผ่าน',
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Checkbox(
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 13),
                            child: Text('จำฉันไว้ในระบบ'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: const Text(
                      'ลืมรหัสผ่าน?',
                      style: TextStyle(color: Colors.green),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotpwd');
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 50),
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
                onPressed: () {
                  checkLogin(_email.text, context);
                },
                child: const Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('ผู้ใช้งานใหม่? '),
                  InkWell(
                    child: const Text(
                      'สร้างบัญชีผู้ใช้งานใหม่',
                      style: TextStyle(
                        color: Colors.green,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      //Do nothing
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

checkLogin(String email, context) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/auth'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': '',
    }),
  );
  Map<String, dynamic> user = jsonDecode(
    response.body,
  );
  if (user['access_token'] != null) {
    Navigator.pushNamed(context, '/home');
  } else {
    showDialog(
        context: context, builder: (BuildContext context) => CustomDialog());
  }
}

class Login {
  final String token;

  const Login({required this.token});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      token: json['access_token'] ?? 'null',
    );
  }
}
