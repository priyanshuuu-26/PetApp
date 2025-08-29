import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_app/routes/app_pages.dart';
import '../../../data/models/pet_model.dart';
import '../../../data/providers/api_provider.dart';

class HomeController extends GetxController {
  final apiProvider = Get.find<ApiProvider>();
  final box = GetStorage();
  var pets = <Pet>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    Get.put(ApiProvider());
    fetchPets();
    super.onInit();
  }

  void fetchPets() async {
    isLoading.value = true;
    final response = await apiProvider.getPets();
    if (response.statusCode == 200) {
      final List<dynamic> petList = response.body;
      pets.value = petList.map((json) => Pet.fromJson(json)).toList();
    } else {
      Get.snackbar('Error', 'Failed to fetch pets');
    }
    isLoading.value = false;
  }
  
  void logout() {
    box.remove('token');
    Get.offAllNamed(Routes.LOGIN);
  }
}