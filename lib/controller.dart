import 'package:background_sms/background_sms.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class SmsController extends GetxController {
  fetch() async {
    try {
      var response = await http.get(Uri.parse(
          'https://script.googleusercontent.com/macros/echo?user_content_key=5Axo4Od2IBn4pYMoNcxv4Yxbt4y-c73MoArDjABBzx-dJFQP878xIE98SlUnuEEEa-AS1PRvPwgJk4wapADYuwmQiGOMXs_em5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnLkqZDO3H9sdZTxyNd2gzJohJfuvgOUMhVm9sSk32pXYTO5gAXlplBU6ARv8qRBwu4xoZRDL_kB-cBKYFH54a2zZ32noWemZrg&lib=M-HzV3DA_GFutjMWPp_jYqwLlgcBIBhGm'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        final messageList = messageListFromJson(response.body);
        Fluttertoast.showToast(msg: 'Messages fetched successfully');
        return messageList;
      } else {
        Fluttertoast.showToast(msg: 'Something went wrong');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  send(messages) async {
    for (var item in messages) {
      debugPrint(item[1].toString() + item[2].toString());
      var result = await BackgroundSms.sendMessage(
          phoneNumber: item[1].toString(), message: item[2].toString());
      if (result == SmsStatus.sent) {
        Fluttertoast.showToast(msg: 'Sent to ${item[1]}');
      } else {
        Fluttertoast.showToast(msg: 'Failed for ${item[1]}');
      }
    }
  }
}
