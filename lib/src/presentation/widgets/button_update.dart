

import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class buttonUpdate extends StatelessWidget {
  const buttonUpdate({
    super.key,
    required this.sizeScreen,
  });

  final Size sizeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      width: sizeScreen.width * 0.9,
      height: 50,
      child: Center(
          child: Text(
        "Perbarui Data",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )),
    );
  }
}