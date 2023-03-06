import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SmsController extends GetxController {
  fetch() async {
    try {
      var response = await http.get(Uri.parse(
          'https://script.googleusercontent.com/macros/echo?user_content_key=5Axo4Od2IBn4pYMoNcxv4Yxbt4y-c73MoArDjABBzx-dJFQP878xIE98SlUnuEEEa-AS1PRvPwgJk4wapADYuwmQiGOMXs_em5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnLkqZDO3H9sdZTxyNd2gzJohJfuvgOUMhVm9sSk32pXYTO5gAXlplBU6ARv8qRBwu4xoZRDL_kB-cBKYFH54a2zZ32noWemZrg&lib=M-HzV3DA_GFutjMWPp_jYqwLlgcBIBhGm'));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(response.body);
      }
    } catch (e) {}
  }
}
