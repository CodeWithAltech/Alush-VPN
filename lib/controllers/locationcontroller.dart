import 'package:alush/models/location_model.dart';
import 'package:alush/models/vpn_model.dart';
import 'package:get/get.dart';
import '../helpers/pref.dart';

class LocationController extends GetxController {
  List<Vpn> vpnList = Pref.vpnList;

  final RxBool isLoading = false.obs;

  Future<void> getVpnData() async {
    isLoading.value = true;
    vpnList.clear();
    vpnList = await Api.getVPNServers();
    isLoading.value = false;
  }
}
