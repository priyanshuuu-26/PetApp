import 'package:get/get.dart';
import 'data/providers/api_provider.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ApiProvider>(ApiProvider(), permanent: true);
  }
}