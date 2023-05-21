import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:order_app/utility/constants/color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(color: AppColors.backColor),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: context.roundedRectangleBorderMedium.borderRadius),
              child: Padding(
                padding: context.paddingMedium,
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Last projects'),
                        Text('All Projects'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
