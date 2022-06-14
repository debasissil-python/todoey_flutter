import 'package:flutter/material.dart';

SnackBar customSnackBar(text) => SnackBar(
      backgroundColor: Colors.amber,
      content: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );

void showSnackBar(BuildContext context, String text) =>
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        customSnackBar(text),
      );
