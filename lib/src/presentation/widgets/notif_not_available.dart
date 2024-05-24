
import 'package:flutter/material.dart';

import '../../core/utils/app_images.dart';

class NotifNotAvailable extends StatelessWidget {
  NotifNotAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(AppImg.notifNot),
    );
  }
}
