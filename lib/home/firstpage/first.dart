import 'package:flutter/material.dart';
import '../../main.dart';
import 'panel/panel.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart' as gauges;

class Item {
  Item({
    required this.headerValue,
    required this.index,
    this.isExpanded = false,
  });

  int index;
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
      index: index + 1,
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
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
              child: Column(children: [
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
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'นางสาวอาสา ใจบริการ',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff5e5e60),
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.recent_actors, color: Color(0xff5e5e60)),
                  ),
                ]),
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
                      ]),
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
                      ]),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    color: Color(0xffffdbdb),
                  ),
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(children: [
              MyRadialBar(
                textFirst: 'จำนวนงาน',
                textSecond: 'ทั้งหมด',
                setColor: Color(0xff5da2fd),
                setPercent: 86,
              ),
              MyRadialBar(
                textFirst: 'จำนวนงานที่',
                textSecond: 'เสร็จแล้วทั้งหมด',
                setColor: Color(0xff24c9b6),
                setPercent: 62,
              ),
              MyRadialBar(
                textFirst: 'งานที่อยู่ระหว่าง',
                textSecond: 'ดำเนินการ',
                setColor: Color(0xfff6a70a),
                setPercent: 56,
              ),
            ]),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: (Center(
              child: _buildPanel(),
            )),
          ),
        ]),
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
      children: _data.map<ExpansionPanel>(
        (Item item) {
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
            body: _expandContent(item.index, item.isExpanded),
            isExpanded: item.isExpanded,
          );
        },
      ).toList(),
    );
  }

  Widget _expandContent(int index, bool isExpanded) {
    if (isExpanded) {
      switch (index) {
        case 1:
          return PanelFirst();
        case 2:
          return PanelSecond();
        case 3:
          return PanelThird();
        case 4:
          return PanelFourth();
        case 5:
          return PanelFifth();
        case 6:
          return PanelSixth();
        default:
          return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }
}

class MyRadialBar extends StatelessWidget {
  MyRadialBar(
      {required this.textFirst,
      required this.textSecond,
      required this.setColor,
      required this.setPercent});
  final String textFirst;
  final String textSecond;
  late Color setColor;
  late double setPercent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Text(
          '$textFirst\n$textSecond',
          style: TextStyle(
            fontSize: 18,
            color: setColor,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
          textAlign: TextAlign.center,
        ),
        Container(
          height: 120,
          child: // Defaults.verticalAxis,
              gauges.SfRadialGauge(axes: <gauges.RadialAxis>[
            gauges.RadialAxis(
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                minimum: 0,
                maximum: 100,
                radiusFactor: 0.65,
                axisLineStyle: const gauges.AxisLineStyle(
                    thicknessUnit: gauges.GaugeSizeUnit.factor,
                    color: Colors.white,
                    thickness: 0.25),
                annotations: <gauges.GaugeAnnotation>[
                  gauges.GaugeAnnotation(
                    widget: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              '${setPercent.round()}',
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
                          ]),
                    ),
                  ),
                ],
                pointers: <gauges.GaugePointer>[
                  gauges.RangePointer(
                      value: setPercent,
                      enableAnimation: true,
                      animationDuration: 1200,
                      animationType: gauges.AnimationType.ease,
                      sizeUnit: gauges.GaugeSizeUnit.factor,
                      color: setColor,
                      width: 0.25),
                ]),
          ]),
        ),
      ]),
    );
  }
}
