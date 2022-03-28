import 'package:flutter/material.dart';

class PanelSixth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Row(children: [
            Container(
              child: Text(
                '\u2022',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 18),
              ),
            ),
            Expanded(
              child: Text('รายงานผลการดำเนินงานอสร. (ชี้เป้าคัดกรอง/ส่งต่อ)'),
            )
          ]),
        ),
        Container(
          child: Row(children: [
            Container(
              child: Text(
                '\u2022',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 18),
              ),
            ),
            Expanded(
              child: Text(
                  'รายงานแสดงข้อมูลสรุปจำนวนชี้เป้า คัดกรอง ส่งต่อ จำแนกตามประเภงาน เป็นรายเดือน รายปี'),
            )
          ]),
        ),
        Container(
          child: Row(children: [
            Container(
              child: Text(
                '\u2022',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 18),
              ),
            ),
            Expanded(
              child: Text(
                  'รายงานจำนวนผู้ขอรับบริการจากการประสานการให้บริการด้านแรงงานในพื้นที่'),
            )
          ]),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(children: [
            Container(
              child: Text(
                '\u2022',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 18),
              ),
            ),
            Expanded(
              child: Text('รายงานผลการสำรวจความพึงพอใจการให้บริการประชาชน'),
            )
          ]),
        ),
      ]),
    );
  }
}
