import 'package:ecommerce/core/enums/view_state.dart';
import 'package:ecommerce/core/models/productModel.dart';
import 'package:ecommerce/core/services/product.dart';
import 'package:ecommerce/locator.dart';

import 'base_view_model.dart';

class ProfileViewModel extends BaseViewModel {
  final GetAPI _getApi = locator<GetAPI>();

  ///for list
  List<ProductModel> getModel = [];

  Future<void> getApiViewModel() async {
    setViewState(ViewState.busy);
    final result = await _getApi.getApi();

    getModel.add(result);

    setViewState(ViewState.idle);
  }
}
