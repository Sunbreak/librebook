import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:librebook/ui/shared/theme.dart';
import 'package:librebook/ui/shared/ui_helper.dart';
import 'package:librebook/ui/views/home/home_view.dart';

class SplashController extends GetxController {
  final appdata = GetStorage();

  @override
  void onInit() {
    super.onInit();
    appdata.writeIfNull('isDarkMode', false);
    final isDarkMode = appdata.read('isDarkMode');
    setDarkMode(isDarkMode);
  }

  @override
  void onReady() {
    super.onReady();
    final isDarkMode = appdata.read('isDarkMode');
    setCurrentOverlay(isDarkMode);
    Future.delayed(Duration(milliseconds: 1000))
        .then((value) => Get.off(HomeView()));
  }

  setDarkMode(bool value) async {
    if (value) {
      Get.changeTheme(kDarkTheme);
    } else {
      Get.changeTheme(kLightTheme);
    }
  }
}
