import 'package:app_widya_edu/src/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

class buttonRegister extends StatelessWidget {
  const buttonRegister({
    super.key,
    required this.sizeScreen, required this.onPress,
  });

  final Size sizeScreen;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(40),
        ),
        width: sizeScreen.width * 0.8,
        height: sizeScreen.height * 0.08,
        child: Center(
            child: Text(
          "DAFTAR",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        )),
      ),
    );
  }
}
