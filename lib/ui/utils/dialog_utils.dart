import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Row(
            children: [
              Text("Loading..."),
              Spacer(),
              CircularProgressIndicator(),
            ],
          ),
        );
      });
}

hideLoading(BuildContext context) {
  Navigator.pop(context);
}

showMessage(BuildContext context, String message,
    {String? title,
    String? posButtonText,
    String? negButtonText,
    Function? posButtonClick,
    Function? negativeButtonClick}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: title != null ? Text(title) : null,
          content: Text(message),
          actions: [
            if (posButtonText != null)
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (posButtonClick != null) posButtonClick();
                  },
                  child: Text(posButtonText)),
            if (negButtonText != null)
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (negativeButtonClick != null) negativeButtonClick();
                  },
                  child: Text(negButtonText)),
          ],
        );
      });
}
