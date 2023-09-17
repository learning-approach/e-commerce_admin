import 'package:ecommerce_admin/const/colors.dart';
import 'package:flutter/material.dart';

Widget customButton(
  String title,
  onPressed,
) {
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(title),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: AppColors.mandarinColor,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        fontSize: 14,
      ),
      padding: EdgeInsets.symmetric(horizontal: 30),
    ),
  );
}
