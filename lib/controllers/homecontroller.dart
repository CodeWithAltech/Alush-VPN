// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:alush/helpers/alerts.dart';
import 'package:alush/hooks/engine_vpn.dart';
import 'package:alush/models/vpn_model.dart';
import 'package:alush/models/vpncfg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/pref.dart';

class HomeController extends GetxController {
  final Rx<Vpn> vpn = Pref.vpn.obs;

  final vpnState = VpnEngine.vpnDisconnected.obs;

  void connectToVpn() async {
    if (vpn.value.openVPNConfigDataBase64.isEmpty) {
      Alushlert.info(msg: 'Select a Location by clicking \'Change Location\'');
      return;
    }

    if (vpnState.value == VpnEngine.vpnDisconnected) {
      // log('\nBefore: ${vpn.value.openVPNConfigDataBase64}');

      final data = Base64Decoder().convert(vpn.value.openVPNConfigDataBase64);
      final config = Utf8Decoder().convert(data);
      final vpnConfig = VpnConfig(
          country: vpn.value.countryLong,
          username: 'vpn',
          password: 'vpn',
          config: config);

      // log('\nAfter: $config');

      //code to show interstitial ad and then connect to vpn
      // AdHelper.showInterstitialAd(onComplete: () async {
      //   await VpnEngine.startVpn(vpnConfig);
      // });
    } else {
      await VpnEngine.stopVpn();
    }
  }

  // vpn buttons color
  Color get getButtonColor {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return Colors.blue;

      case VpnEngine.vpnConnected:
        return Colors.green;

      default:
        return Colors.orangeAccent;
    }
  }

  // vpn button text
  String get getButtonText {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return 'Tap to Connect';

      case VpnEngine.vpnConnected:
        return 'Disconnect';

      default:
        return 'Connecting...';
    }
  }
}
