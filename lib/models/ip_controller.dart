import 'dart:convert';
import 'dart:developer';
import 'package:alush/helpers/alerts.dart';

import 'package:alush/models/ipinfo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class APIS {
  // getting the available vpn servers and people on it

  // Getting ip Address of the user
  static const String ipApiUrl =
      'https://geo.ipify.org/api/v2/country?apiKey=at_QulIqLceRhAeShv80oIFFJ3T73SOT';

  static Future<void> getIPDetails({required Rx<IpInfo> ipconfig}) async {
    try {
      final response = await http.get(Uri.parse(ipApiUrl)).timeout(
            const Duration(seconds: 10),
          );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // log('API Response: $data');
        // print(response.body);
        ipconfig.value = IpInfo.fromJson(data);
        Alushlert.success(
          msg: 'IP details: ${ipconfig.value.ip}',
        );
      } else {
        Alushlert.error(
          msg:
              'Failed to fetch IP details. Status code: ${response.statusCode}',
        );
      }
    } catch (error) {
      Alushlert.error(msg: 'Error fetching IP details: $error');
      log('Error fetching IP details: $error');
    }
  }
}
