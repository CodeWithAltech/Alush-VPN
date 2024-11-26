// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:alush/auth/register.dart';
import 'package:alush/controllers/ipcontroller.dart';
import 'package:alush/pages/about_us.dart';
import 'package:alush/pages/net_channels.dart';
import 'package:alush/pages/speedtest.dart';
import 'package:alush/utils/button.dart';
import 'package:alush/utils/internet_status.dart';
import 'package:alush/utils/timer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showmenu() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: null,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.vpn_key,
                    size: 10,
                  ),
                  Text(
                    'Alush VPN',
                    style: TextStyle(fontSize: 12),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.cancel,
                      size: 14,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              // Home
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              // Share Alush
              MaterialButton(
                onPressed: () {},
                child: Text(
                  'Share',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              //About us
              MaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AboutUs();
                  }));
                },
                child: Text(
                  'About Us',
                  style: TextStyle(fontSize: 10),
                ),
              ),
              //Rate Us
              MaterialButton(
                onPressed: () {
                  // showBottomSheet(
                  //     enableDrag: true,
                  //     showDragHandle: true,
                  //     context: context,

                  //     builder: (BuildContext) {
                  //       return Container(
                  //         child: AlertDialog(
                  //           title: Text('Hello'),
                  //         ),
                  //       );
                  //     });
                },
                child: Text(
                  'Rate Us',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void speedtest() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SpeedTestView(),
      ),
    );
  }

  void showstatus() {
    showDialog(
      context: context,
      builder: (context) {
        return InternetStatus();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ipController = Get.put(IpController());

    return Obx(
      () {
        final ipInfo = ipController.ipInfo.value;
        return Scaffold(
          // backgroundColor: Colors.transparent,
          // Alush VPN
          appBar: AppBar(
            leading: IconButton(
              onPressed: showmenu,
              icon: Icon(Icons.panorama_fisheye_outlined),
            ),
            centerTitle: true,
            title: Text(
              'Alush VPN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegisterAuth(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                ),
              ),
              IconButton(
                onPressed: speedtest,
                icon: Icon(
                  Icons.speed_rounded,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: null,
            child: Center(
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  //background image
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'lib/images/world.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //Body
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                      ),

                      //DOWNLOAD AND UPLOAD
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ThemeData.dark().canvasColor,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Download',
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Points',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Upload',
                                    style: TextStyle(
                                      color: Colors.greenAccent,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('12/5'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(
                                      '100 alus',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.blue.shade100,
                                      ),
                                    ),
                                  ),
                                  Text('13/7'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      // You are not Connected Now
                      Center(
                        child: Text(
                          'You are not Connected !',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // BUTTON
                      VpnButton(),
                      // Counter
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'You have spent,',
                              ),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            TimerClock(
                              startclock: true,
                            ),
                          ],
                        ),
                      ),

                      // MORE ABOUT THE APP
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NetWorkChannels();
                          }));
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Colors.lightBlue,
                              )),
                          child: Text(
                            'Change Network Channel',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: showstatus,
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.lightBlue,
                            ),
                          ),
                          child: Text(
                            'Tap to Check Internet Status',
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ThemeData.dark().canvasColor,
                              width: 5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // ping
                                    Icon(Icons.keyboard_double_arrow_up),
                                    //Location
                                    Icon(Icons.location_on_rounded),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // ping
                                    Text(
                                      'Pinged: 10',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    //Location
                                    Text(
                                      '${ipInfo.location.country},${ipInfo.location.region}',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
