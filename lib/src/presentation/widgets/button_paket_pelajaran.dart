import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';

Container buttonPaketPelajaran(Size sizeScreen, String title) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.all(20),
    width: sizeScreen.width * 0.35,
    child: Column(
      children: [
        Container(
          width: 50,
          height: 50,
          color: AppColors.lightgrey,
          child: Image.asset(AppImg.imgIconMtk2),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text("0/10 Soal"),
      ],
    ),
  );
}
