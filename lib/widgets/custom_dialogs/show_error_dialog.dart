import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showDialog(
    context: context,
    builder: ((context) {
      return AlertDialog(
        title: const Text("ERROR"),
        content: Text(
          text,
          style: GoogleFonts.ubuntu(color: Color.fromARGB(255, 105, 4, 4)),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("OK"),
          )
        ],
      );
    }),
  );
}
