import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ReusableRow extends StatelessWidget {
  String title;
  String data;
  ReusableRow({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(data)],
          ),
          const Divider()
        ],
      ),
    );
  }
}
