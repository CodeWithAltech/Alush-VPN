import 'package:get/get.dart';
import 'package:alush/models/ipinfo.dart';
import 'package:alush/models/ip_controller.dart';

class IpController extends GetxController {
  var ipInfo = IpInfo(
    ip: 'Loading...',
    location: Location(country: '', region: '', timezone: ''),
    domains: [],
    asInfo: ASInfo(asn: 0, name: '', route: '', domain: '', type: ''),
    isp: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    fetchIPDetails(); // Automatically fetch data on controller init
  }

  Future<void> fetchIPDetails() async {
    await APIS.getIPDetails(ipconfig: ipInfo);
  }
}
