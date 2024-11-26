import 'dart:developer';
import 'package:alush/helpers/alerts.dart';
import 'package:alush/helpers/pref.dart';
import 'package:alush/models/vpn_model.dart';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<Vpn>> getVPNServers() async {
    final List<Vpn> vpnList = [];

    try {
      final res =
          await http.get(Uri.parse('http://www.vpngate.net/api/iphone/'));
      final csvString = res.body.split("#")[1].replaceAll('*', '');

      List<List<dynamic>> list = const CsvToListConverter().convert(csvString);

      final header = list[0];

      for (int i = 1; i < list.length - 1; ++i) {
        Map<String, dynamic> tempJson = {};

        for (int j = 0; j < header.length; ++j) {
          tempJson.addAll({header[j].toString(): list[i][j]});
        }
        vpnList.add(Vpn.fromJson(tempJson));
      }
    } catch (e) {
      Alushlert.error(msg: e.toString());
      log('\ngetVPNServersE: $e');
    }
    vpnList.shuffle();

    if (vpnList.isNotEmpty) Pref.vpnList = vpnList;

    return vpnList;
  }
}
