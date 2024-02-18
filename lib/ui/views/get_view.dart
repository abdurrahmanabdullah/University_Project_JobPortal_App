import 'package:ecommerce/core/enums/view_state.dart';
import 'package:ecommerce/core/view_models/product_View_model.dart';
import 'package:flutter/material.dart';

import 'base_view.dart';

class GetView extends StatelessWidget {
  const GetView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      onModelReady: (model) async {
        await model.getApiViewModel();
      },
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Center(
              child: model.state == ViewState.idle
                  ? Column(
                      children: [
                        Text('${model.getModel[0].data![0].attributes!.name}' ??
                            ' ')
                      ],
                    )
                  : const CircularProgressIndicator()),
        ),
      ),
    );
  }
}
