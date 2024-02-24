import 'package:flutter/material.dart';

Widget iconButtonWithName({
  double? bHeight,
  double? bWidth,
  Color? bColor,
  String? bIcon,
  String? bName,
}) =>
    InkWell(
      child: Container(
        width: bWidth ?? 100,
        height: bHeight ?? 50,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: bColor,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: Image.asset(bIcon ?? ''),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(bName ?? 'Button'),
            )
          ],
        ),
      ),
    );
