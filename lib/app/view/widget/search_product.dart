import 'package:flutter/cupertino.dart';
import 'package:mvvm_provider_shoppingapp/app/view_model/home_page_view_model.dart';
import 'package:provider/provider.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({super.key});
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomePageViewModel>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 48,
      child: CupertinoSearchTextField(
        borderRadius: BorderRadius.circular(16),
        placeholder: 'Search Product',
        controller: viewModel.searchController,
        onChanged: (val) {
          viewModel.settxtsearch(val);
        },
      ),
    );
  }
}
