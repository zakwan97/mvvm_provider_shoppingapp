import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/view/base_stateful_page.dart';
import 'package:mvvm_provider_shoppingapp/app/view/product_detail_page.dart';
import 'package:mvvm_provider_shoppingapp/app/view/widget/custom_page_route.dart';
import 'package:mvvm_provider_shoppingapp/app/view_model/home_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:mvvm_provider_shoppingapp/app/view/widget/search_product.dart';

class HomePage extends BaseStatefulPage {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseStatefulState<HomePage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      context.read<HomePageViewModel>().getProductList();
    });
  }

  void _navigateToProductDetailPage() {
    Navigator.of(context).push(
      CustomPageRoute(
        builder: (_) {
          return const ProductDetailPage();
        },
        customTransitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget body() {
    final viewModel = context.watch<HomePageViewModel>();
    // return Consumer<HomePageViewModel>(
    //   builder: (context, prodCon, child) {
    // if (prodCon.isLoading) {
    //   return buildLoadingIndicator();
    // }
    if (viewModel.prodList.isEmpty) {
      return const Center(
        child: Text("No items at the moment"),
      );
    } else {
      return Column(
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: SearchProduct()),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 5, horizontal: viewModel.showClearButton ? 10 : 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton<String>(
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                  onSelected: (value) {
                    setState(() {
                      viewModel.category = value;
                      viewModel.filterByCategory(value);
                      viewModel.showClearButton = viewModel.category.isNotEmpty;
                    });
                  },
                  itemBuilder: (BuildContext context) {
                    return viewModel.categoryList
                        .map<PopupMenuItem<String>>((String value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Text(value.isEmpty ? 'All' : value),
                      );
                    }).toList();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(viewModel.category.isEmpty
                            ? 'Select Category'
                            : viewModel.category),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: viewModel.showClearButton,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        viewModel.category = "";
                        viewModel.filterByCategory(viewModel.category);
                        viewModel.showClearButton = false;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                    ),
                    child: const Text(
                      'Clear',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    GridView.builder(
                      controller: _controller,
                      itemCount: viewModel.getListToDisplay(viewModel).length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        var prodlist =
                            viewModel.getListToDisplay(viewModel)[index];
                        return InkWell(
                          onTap: () async {
                            _navigateToProductDetailPage();
                          },
                          child: Card(
                            color: Colors.white,
                            surfaceTintColor: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 5, top: 5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(0),
                                    child: Image.network(
                                      prodlist.image ?? '',
                                      fit: BoxFit.fill,
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                ),
                                Text(
                                  prodlist.title ?? 'No Name',
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SmoothStarRating(
                                    allowHalfRating: false,
                                    starCount: 5,
                                    rating: prodlist.rating!.rate ?? 0,
                                    size: 20.0,
                                    color: Colors.amber,
                                    borderColor: Colors.amber,
                                    spacing: 0.0),
                                Text(
                                  'RM${prodlist.price!.toStringAsFixed(2)}',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
    //   },
    // );
  }

  @override
  PreferredSizeWidget? appbar() {
    return AppBar(
      surfaceTintColor: Colors.white,
      title: const Text(
        "Welcome!",
        style: TextStyle(fontSize: 18, color: Colors.blue),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_cart_outlined))
      ],
    );
  }

  @override
  Widget? floatingActionButton() => null;
}
