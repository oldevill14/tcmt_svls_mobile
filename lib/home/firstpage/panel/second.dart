import 'package:flutter/material.dart';

class PanelSecond extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '2',
                style: TextStyle(
                    fontSize: 100,
                    color: Color(0xff5e5e60),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
