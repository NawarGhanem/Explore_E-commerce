import 'package:get/get.dart';
import 'package:project1/app/data/models/categories_model.dart';
import 'package:project1/app/data/models/product_model.dart';
import 'package:project1/core/data/remot_source/base_api_client.dart';
import 'package:project1/core/utils/dialogs/error_dialog.dart';
import 'package:project1/core/utils/dialogs/loading_dialog.dart';

import '../../../../core/constants/api_const.dart';

class HomeController extends GetxController {
  var products = <ProductModel>[].obs;
  var categories = <CategoriesModel>[].obs;

  void getProduct() async {
    var response = await BaseApiClient.get<List<ProductModel>>(
        url: ApiConst.products,
        converter: (e) {
          return ProductModel.fromJsonList(e['data']);
        });

    response.fold((l) {
      showErrorDialog(l);
    }, (r) {
      products.assignAll(r); // Update `products` list with new data
      update();
    });
  }

  void getCategories() async {
    var response = await BaseApiClient.get<List<CategoriesModel>>(
        url: ApiConst.categories,
        converter: (e) {
          return CategoriesModel.fromJsonList(e['data']);
        });
    response.fold((l) {
      showErrorDialog(l);
    }, (r) {
      categories.assignAll(r);
      update();
    });
  }

  @override
  void onInit() {
    getProduct();
    getCategories();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
