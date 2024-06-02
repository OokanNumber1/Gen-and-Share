import 'package:flutter/material.dart';
import 'package:gen_and_share/constants/colors.dart';

class AppTheme{
     OutlineInputBorder outlinedBorder([Color? color]) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: color ?? Colors.grey),
        );
 ThemeData  getTheme()=>ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: AppColors.text),
          enabledBorder: outlinedBorder(),
          focusedBorder: outlinedBorder(),
          focusedErrorBorder: outlinedBorder(Colors.red),
          errorBorder: outlinedBorder(Colors.red),
        ),
        elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(Colors.grey),
          backgroundColor: MaterialStatePropertyAll(AppColors.cardColor),
          fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 46)),
        )),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );
}