import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF36383D),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(color: const Color(0xFF36383D)),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: context.roundedRectangleBorderMedium.borderRadius),
              ),
            ),
          ],
        ));
  }
}
