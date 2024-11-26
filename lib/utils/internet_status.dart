// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alush/controllers/ipcontroller.dart';
import 'package:alush/helpers/alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alush/utils/alsuhcard.dart';

class InternetStatus extends StatelessWidget {
  const InternetStatus({super.key});

  @override
  Widget build(BuildContext context) {
    final ipController = Get.put(IpController());

    return Obx(() {
      final ipInfo = ipController.ipInfo.value;

      return AlertDialog(
        title: Column(
          children: [
            Text(
              'Your Network Status',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Alsuhcard(
              title: 'IP Address',
              subttile: ipInfo.ip.isEmpty ? 'Loading...' : ipInfo.ip,
              trailing: Icon(Icons.local_activity, size: 18),
            ),
            Alsuhcard(
              title: 'Provider',
              subttile: ipInfo.isp.isEmpty ? 'Loading...' : ipInfo.isp,
              trailing: Icon(Icons.network_cell, size: 18),
            ),
            Alsuhcard(
              title: 'Location',
              subttile: ipInfo.location.country.isEmpty
                  ? 'Collecting .....'
                  : '${ipInfo.location.region}, ${ipInfo.location.country}',
              trailing: Icon(Icons.location_on, size: 18),
            ),
            Alsuhcard(
              title: 'TimeZone',
              subttile: ipInfo.location.timezone.isEmpty
                  ? 'Loading...'
                  : ipInfo.location.timezone,
              trailing: Icon(Icons.timelapse_rounded, size: 18),
            ),
          ],
        ),
        content: FloatingActionButton(
          backgroundColor: Colors.blue,
          // foregroundColor: Colors.blue,
          focusColor: Colors.redAccent,
          onPressed: () {
            // ignore: unused_local_variable
            bool loading = true;
            if (loading = false) {
              Alushlert.showProgress();
            } else {
              ipController.fetchIPDetails();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.refresh_outlined),
              Text('Refresh', style: TextStyle(fontSize: 10)),
            ],
          ),
        ),
      );
    });
  }
}
