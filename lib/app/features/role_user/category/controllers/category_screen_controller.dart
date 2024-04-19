import 'package:get/get.dart';
import 'package:ninjafood/app/core/core.dart';
import 'package:ninjafood/app/features/role_user/home/controllers/home_controller.dart';
import 'package:ninjafood/app/models/category_model.dart';
import 'package:ninjafood/app/models/product_model.dart';

class CategoryScreenController extends BaseController {
  final homeController = Get.find<HomeController>();

  late final CategoryModel currentMenu;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  @override
  void onInit() {
    currentMenu = Get.arguments as CategoryModel;
    products.value = homeController.filterProductByIds(currentMenu.productIds!);

    homeController.products.listen((_newVal) {
      products.assignAll(
          homeController.filterProductByIds(currentMenu.productIds!));
    });
    super.onInit();
  }

  void onSelectedProduct(ProductModel product) {
    Get.snackbar('Selected', product.name!);
  }
}
