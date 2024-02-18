import 'package:ecommerce/core/enums/view_state.dart';
import 'package:ecommerce/core/view_models/profile_view_model.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<GetProfileViewModel>(
      onModelReady: (model) async {
        await model.getApiViewModel();
      },
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Center(
              child: model.state == ViewState.idle
                  ? Column(
                      children: [
                        if (model.getModel.isNotEmpty &&
                            model.getModel[0].data != null)

                          ///----for specific  entity show -----   model.getModel[0].data!['name'] ?? '',
                          ///total length 0 to 6 so  length is 7 that's why 7-1
                          Text(
                            model
                                    .getModel[0]
                                    .data![model.getModel[0].data!.length - 1]
                                    .attributes
                                    ?.name ??
                                ' ',
                          ),
                        // Text(model.getModel[0].data![0].attributes!.name ?? ''),
                        Text(
                          model
                                  .getModel[0]
                                  .data![model.getModel[0].data!.length - 1]
                                  .attributes
                                  ?.email ??
                              '',
                        ),
                      ],
                    )
                  : const CircularProgressIndicator()),
        ),
      ),
    );
  }
}
