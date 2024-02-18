import 'package:ecommerce/core/enums/view_state.dart';
import 'package:ecommerce/core/models/profile.dart';
import 'package:ecommerce/core/services/profile.dart';
import 'package:ecommerce/locator.dart';

import 'base_view_model.dart';

class GetProfileViewModel extends BaseViewModel {
  final Profile _getApi = locator<Profile>();

  ///for list
  List<ProfileModel> getModel = [];

  Future<void> getApiViewModel() async {
    setViewState(ViewState.busy);
    final result = await _getApi.getProfile();

    getModel.add(result);

    setViewState(ViewState.idle);
  }
}
