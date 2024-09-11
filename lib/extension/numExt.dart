import 'package:flutter/material.dart';

extension Numext on num {
  SizedBox get heightBox => SizedBox(
        height: toDouble(),
      );
  SizedBox get widthBox => SizedBox(
        height: toDouble(),
      );
}
