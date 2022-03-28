import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart' as gauges;

class Item {
  Item({
    required this.headerValue,
    this.isExpanded = false,
  });

  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  final headername = [
    'ข้อมูลผู้ใช้งาน',
    'ประวัติส่วนตัว',
    'การดำเนินงาน',
    'ค่าตอบแทน อสร.',
    'ค้นหาเครือข่าย อสร.',
    'รายงาน / Dashboard'
  ];
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: '${headername[index]}',
    );
  });
}

class FirstHomePage extends StatefulWidget {
  const FirstHomePage({Key? key}) : super(key: key);

  @override
  State<FirstHomePage> createState() => _FirstHomePageState();
}

class _FirstHomePageState extends State<FirstHomePage> {
  final List<Item> _data = generateItems(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 239, 241, 1),
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  'บริหารการจัดการข้อมูล',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff5e5e60),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      width: 150.0,
                      height: 155.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/Header.png'),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'นางสาวอาสา ใจบริการ',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xff5e5e60),
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(Icons.recent_actors,
                              color: Color(0xff5e5e60)),
                        ),
                      ],
                    ),
                    Text(
                      'ตำแหน่ง จนท. สรจ.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 50,
                      color: Color(0xfff0fff2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.calendar_month_outlined,
                                color: Colors.green),
                          ),
                          Text(
                            'วันที่เริ่มต้นวาระ 11/06/2562',
                            style: TextStyle(fontSize: 20, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: Icon(Icons.calendar_month_outlined,
                                color: Colors.red),
                          ),
                          Text(
                            'วันที่สิ้นสุดวาระ 10/06/2565',
                            style: TextStyle(fontSize: 20, color: Colors.red),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        color: Color(0xffffdbdb),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'จำนวนงาน',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff5da2fd),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          'ทั้งหมด',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff5da2fd),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Container(
                          height: 120,
                          child: // Defaults.verticalAxis,
                              gauges.SfRadialGauge(
                            axes: <gauges.RadialAxis>[
                              gauges.RadialAxis(
                                  showLabels: false,
                                  showTicks: false,
                                  startAngle: 270,
                                  endAngle: 270,
                                  minimum: 0,
                                  maximum: 100,
                                  radiusFactor: 0.65,
                                  axisLineStyle: const gauges.AxisLineStyle(
                                      thicknessUnit:
                                          gauges.GaugeSizeUnit.factor,
                                      color: Colors.white,
                                      thickness: 0.25),
                                  annotations: <gauges.GaugeAnnotation>[
                                    gauges.GaugeAnnotation(
                                      widget: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              '86',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5e5e60)),
                                            ),
                                            const Text(
                                              '%',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5e5e60)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  pointers: const <gauges.GaugePointer>[
                                    gauges.RangePointer(
                                        value: 86,
                                        enableAnimation: true,
                                        animationDuration: 1200,
                                        animationType:
                                            gauges.AnimationType.ease,
                                        sizeUnit: gauges.GaugeSizeUnit.factor,
                                        color: Color(0xff5da2fd),
                                        width: 0.25),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'จำนวนงานที่',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff24c9b6),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          'เสร็จแล้วทั้งหมด',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff24c9b6),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Container(
                          height: 120,
                          child: // Defaults.verticalAxis,
                              gauges.SfRadialGauge(
                            axes: <gauges.RadialAxis>[
                              gauges.RadialAxis(
                                  showLabels: false,
                                  showTicks: false,
                                  startAngle: 270,
                                  endAngle: 270,
                                  minimum: 0,
                                  maximum: 100,
                                  radiusFactor: 0.65,
                                  axisLineStyle: const gauges.AxisLineStyle(
                                      thicknessUnit:
                                          gauges.GaugeSizeUnit.factor,
                                      color: Colors.white,
                                      thickness: 0.25),
                                  annotations: <gauges.GaugeAnnotation>[
                                    gauges.GaugeAnnotation(
                                      widget: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              '62',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5e5e60)),
                                            ),
                                            const Text(
                                              '%',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5e5e60)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  pointers: const <gauges.GaugePointer>[
                                    gauges.RangePointer(
                                        value: 62,
                                        enableAnimation: true,
                                        animationDuration: 1200,
                                        animationType:
                                            gauges.AnimationType.ease,
                                        sizeUnit: gauges.GaugeSizeUnit.factor,
                                        color: Color(0xff24c9b6),
                                        width: 0.25),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'งานที่อยู่ระหว่าง',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xfff6a70a),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Text(
                          'ดำเนินการ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xfff6a70a),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        Container(
                          height: 120,
                          child: // Defaults.verticalAxis,
                              gauges.SfRadialGauge(
                            axes: <gauges.RadialAxis>[
                              gauges.RadialAxis(
                                  showLabels: false,
                                  showTicks: false,
                                  startAngle: 270,
                                  endAngle: 270,
                                  minimum: 0,
                                  maximum: 100,
                                  radiusFactor: 0.65,
                                  axisLineStyle: const gauges.AxisLineStyle(
                                      thicknessUnit:
                                          gauges.GaugeSizeUnit.factor,
                                      color: Colors.white,
                                      thickness: 0.25),
                                  annotations: <gauges.GaugeAnnotation>[
                                    gauges.GaugeAnnotation(
                                      widget: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            Text(
                                              '56',
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5e5e60)),
                                            ),
                                            const Text(
                                              '%',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff5e5e60)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                  pointers: const <gauges.GaugePointer>[
                                    gauges.RangePointer(
                                        value: 56,
                                        enableAnimation: true,
                                        animationDuration: 1200,
                                        animationType:
                                            gauges.AnimationType.ease,
                                        sizeUnit: gauges.GaugeSizeUnit.factor,
                                        color: Color(0xfff6a70a),
                                        width: 0.25),
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: (Center(
                child: Column(
                  children: [_buildPanel()],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  item.headerValue,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
            );
          },
          body: ListTile(
              title: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
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
                            'รายงานผลการดำเนินงานอสร. (ชี้เป้าคัดกรอง/ส่งต่อ)'),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
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
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
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
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
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
                            'รายงานผลการสำรวจความพึงพอใจการให้บริการประชาชน'),
                      )
                    ],
                  ),
                ),
              ]),
              // subtitle: Text(item.expandedValue),
              // trailing: const Icon(Icons.delete),
              onTap: () {
                // setState(() {
                //   _data.removeWhere((Item currentItem) => item == currentItem);
                // });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
