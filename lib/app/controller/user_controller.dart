import 'package:get/get.dart';

import '../../../data/models/user.dart';

class UserController extends GetxController {
  static UserController instance = Get.put(UserController());

  late User currentUser = User().obs.value;
  late bool isFirstTime = false.obs.value;
}
