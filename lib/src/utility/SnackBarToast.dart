// ignore_for_file: non_constant_identifier_names, file_names

import 'package:fluttertoast/fluttertoast.dart';
import 'package:notary_ping/styles.dart';

SnackBarToast({message}) {
  Fluttertoast.showToast(
    msg: "$message",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 2,
    backgroundColor: Palette.primaryColor,
    textColor: Palette.whiteColor,
    fontSize: 16,
  );
}
