import 'package:ecommerce_admin/const/colors.dart';
import 'package:flutter/material.dart';

Widget customFormField(
  keyboardtype,
  controller,
  context,
  hinttext,
  validator, {
  bool obscureText = false,
  prefixIcon,
  readOnly = false,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      keyboardType: keyboardtype,
      readOnly: readOnly,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            top: 5,
            bottom: 5,
            right: 10,
          ),
          child: Container(
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFFFDF2EE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              prefixIcon,
              color: AppColors.mandarinColor,
              size: 20,
            ),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}

Widget productFormField(controller, context, hinttext,
    {prefixIcon,
    readOnly = false,
    minLines = 1,
    maxLines = 5,
    keyboardType = TextInputType.text}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      readOnly: readOnly,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2, color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hinttext,
        hintStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}
