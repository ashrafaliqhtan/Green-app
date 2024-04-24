import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Screen on BuildContext {
  getWidth() {
    return MediaQuery.of(this).size.width;
  }

  push({required Widget view, required bool isPush}) {
    return Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => view),
      (route) => isPush,
    );
  }

  getHeight() {
    return MediaQuery.of(this).size.height;
  }

  getMessagesBar(
      {required String msg, required Color color, bool success = true}) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Icon(
              success ? Icons.check_circle : Icons.error,
              color: Colors.white,
            ),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
      ),
    );
  }

  getMessages({required String msg, required Color color, int duration = 2}) {
    showDialog(
      context: this,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: duration), () {
          Navigator.of(context).canPop();
        });

        return AlertDialog(
          backgroundColor: color,
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              msg,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        );
      },
    );
  }
}

String formatDate(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
String formatDateTime(DateTime date) {
  return DateFormat('HH:mm').format(date);
}
String formatDateYMMMd(DateTime date) {
  return DateFormat.yMMMd().format(date);
}
