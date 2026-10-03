import 'package:flutter/material.dart';

class AppInputBorders {
  AppInputBorders._();


  static const OutlineInputBorder borderless = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );

 
  static OutlineInputBorder borderlessWithRadius(double radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide.none,
    );
  }

  static OutlineInputBorder errorBorderless = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      
    ),
    borderRadius: BorderRadius.all(Radius.circular(30)),
  );
}