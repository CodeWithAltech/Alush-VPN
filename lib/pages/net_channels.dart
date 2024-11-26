// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:alush/controllers/locationcontroller.dart';
import 'package:alush/helpers/alerts.dart';
import 'package:alush/utils/vpn_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_controller.dart';

class NetWorkChannels extends StatelessWidget {
  NetWorkChannels({super.key});
  final _controller = LocationController();

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Network Channels',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              themeController.themeMode == ThemeMode.dark
                  ? Icons.dark_mode_sharp
                  : Icons.light,
            ),
            onPressed: themeController.toggleTheme,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(12, 13),
          child: Text(
            'Available Wifi Networks  ${_controller.vpnList.length}',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            _controller.getVpnData();
            Alushlert.success(msg: 'Refreshing the Network Channels');
          },
          child: Icon(
            Icons.refresh,
          ),
        ),
      ),
      body: _controller.isLoading.value
          ? _loadingWidget()
          : _controller.vpnList.isEmpty
              ? _noVPNFound()
              : _vpnData(),
    );
  }

  _vpnData() => ListView.builder(
      itemCount: _controller.vpnList.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (ctx, i) => VpnCard(vpn: _controller.vpnList[i]));

  _loadingWidget() => SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Animation for Loader
            Alushlert.showProgress(),
          ],
        ),
      );

  _noVPNFound() => Center(
        child: Text(
          'No VPNs Found At Moment',
          style: TextStyle(
              fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
        ),
      );
}
