import 'package:flutter/material.dart';
import 'package:flutter_study_chatapp/config/palette.dart';

TextFormField buildLoginArgument(
    {required int key,
    required IconData prefixIcon,
    required String text,
    required validator,
    required onSaved}) {
  return TextFormField(
    key: ValueKey(key),
    onSaved: onSaved,
    onTap: () {
      AnimatedPadding(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.only(bottom: 20),
      );
    },
    validator: validator,
    decoration: InputDecoration(
      prefixIcon: Icon(
        prefixIcon,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Palette.textColor1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(35.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Palette.textColor1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(35.0),
        ),
      ),
      hintText: text,
      hintStyle: TextStyle(
        color: Palette.textColor1,
        fontSize: 14,
      ),
      contentPadding: EdgeInsets.all(10),
    ),
  );
}
