
import 'package:flutter/material.dart';

import '../../core/utils/app_images.dart';

class buttonLogoutProfile extends StatelessWidget {
  const buttonLogoutProfile({
    super.key,
    required this.sizeScreen,
  });

  final Size sizeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
      ),
      width: sizeScreen.width * 0.9,
      height: 60,
      child: Row(
        children: [
          Image.asset(AppImg.imgLogout),
          SizedBox(width: 10),
          Text(
            "Keluar",
            style: TextStyle(color: Colors.red, fontSize: 20),
          )
        ],
      ),
    );
  }
}
