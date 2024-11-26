// ignore_for_file: prefer_const_constructors

import 'package:alush/helpers/alerts.dart';
import 'package:alush/helpers/pref.dart';
import 'package:alush/hooks/engine_vpn.dart';
import 'package:alush/models/vpn_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/homecontroller.dart';

class VpnCard extends StatelessWidget {
  final Vpn vpn;
  const VpnCard({super.key, required this.vpn});

  @override
  Widget build(BuildContext context) {
    // Home Controller
    final controller = Get.find<HomeController>();
    // Media Size

    final Size mq = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Container(
        // elevation: 5,
        margin: EdgeInsets.symmetric(vertical: mq.height * .009),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),

        // ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.lightBlue,
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        child: InkWell(
          onTap: () {
            controller.vpn.value = vpn;
            Pref.vpn = vpn;
            Get.back();

            Alushlert.success(msg: 'Connecting VPN Location...');

            if (controller.vpnState.value == VpnEngine.vpnConnected) {
              VpnEngine.stopVpn();
              Future.delayed(
                  Duration(seconds: 2), () => controller.connectToVpn());
            } else {
              controller.connectToVpn();
            }
          },
          borderRadius: BorderRadius.circular(15),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

            //flag
            leading: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: vpn.numVpnSessions <= 20
                        ? Colors.blueAccent
                        : Colors.yellow,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                    'assests/flags/${vpn.countryShort.toLowerCase()}.png',
                    height: 40,
                    width: mq.width * .15,
                    fit: BoxFit.cover),
              ),
            ),

            //title
            title: Text(
              vpn.countryLong,
              style: TextStyle(fontSize: 12),
            ),

            //subtitle
            subtitle: Row(
              children: [
                Icon(Icons.speed_rounded, color: Colors.blue, size: 20),
                SizedBox(width: 4),
              ],
            ),

            //trailing
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  vpn.numVpnSessions.toString(),
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: vpn.numVpnSessions <= 20
                        ? Colors.blueAccent
                        : Colors.red,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.person_3,
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
