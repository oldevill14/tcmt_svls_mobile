import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return dialogContent(context);
  }

  Widget dialogContent(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(
                top: 18.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  SizedBox(height: 50),
                  Icon(
                    Icons.cancel_outlined,
                    color: Colors.red,
                    size: 150.0,
                  ),
                  SizedBox(height: 50),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      shadows: [
                        Shadow(color: Colors.red, offset: Offset(0, -2))
                      ],
                      color: Colors.transparent,
                      decorationColor: Colors.red,
                    ),
                    child: Text(
                      'การเข้าสู่ระบบล้มเหลว',
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                      child: Text(
                        'ขออภัย มีข้อผิดพลาดเกิดขึ้นอาจเกิดจากอีเมลหรือรหัสผ่านไม่ถูกต้อง',
                      ),
                    ),
                  ),
                  Center(
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                      child: Text(
                        'โปรดกรอกข้อมูลอีกครั้งภายหลัง',
                      ),
                    ),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
            Positioned(
              top: 10,
              right: 0.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
