import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showExitPopup(context, {message = "Do you want to exit an app?"}) {
  showDialog<void>(
    //show confirm dialogue
    //the return value will be from "Yes" or "No" options
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text('Exit App'),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: const Color(0xff2EC4B6)),
          //return false when click on "NO"

          child: const Text(
            'No',
            style: TextStyle(color: Color(0xffffffff)),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Color(0xff2EC4B6))),
          ),
          onPressed: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          },
          //return true when click on "Yes"
          child: const Text(
            'Yes',
            style: TextStyle(color: Color(0xff2EC4B6)),
          ),
        ),
      ],
    ),
  ); //if showDialouge had returned null, then return false
}
