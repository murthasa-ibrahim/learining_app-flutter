
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learning_app/utils/utils.dart';

class DashBordController extends GetxController {
  RxString userName = ''.obs;
  RxBool hasInterrn = false.obs;

  Future<void> getUserName() async {
    final name = await Utils.storage.read(key: 'username');
    if (name != null) {
      userName.value = name;
    }
  }

  String getdate(DateTime value) {
    return DateFormat('MMM dd yyyy').format(value);
  }

  String getTime(DateTime value) {
    return DateFormat('h:mm a').format(value);
  }

  int getPercentage(int userCount, int count) {
    return (userCount / count * 100).toInt();
  }

  @override
  void onInit() {
    super.onInit();
    getUserName();
  }
}
