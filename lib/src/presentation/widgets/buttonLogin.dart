import 'package:flutter/material.dart';

import '../../core/utils/app_images.dart';
import '../../core/utils/app_string.dart';
import '../screen/home_screen.dart';

enum LoginButtonVariant {
  google,
  apple;

  String get buttonImage {
    switch (this) {
      case google:
        return AppImg.imgGoogle;
      default:
        return AppImg.imgApple;
    }
  }

  String get buttonTitle {
    switch (this) {
      case google:
        return AppString.masukDenganGoogle;
      default:
        return AppString.masukDenganAppleId;
    }
  }

  Color get buttonColor {
    switch (this) {
      case google:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  Color get textColor {
    switch (this) {
      case google:
        return Colors.black;
      default:
        return Colors.white;
    }
  }
}

class LoginButton extends StatelessWidget {
  final LoginButtonVariant loginButtonVariant;
  final VoidCallback onPressed;

  const LoginButton(
      {super.key, required this.loginButtonVariant, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size sizeScreen = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: sizeScreen.width * 0.7,
        height: sizeScreen.height * 0.07,
        decoration: BoxDecoration(
          color: loginButtonVariant.buttonColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(loginButtonVariant.buttonImage),
            SizedBox(width: 20),
            Text(
              '${loginButtonVariant.buttonTitle}',
              style: TextStyle(color: loginButtonVariant.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
