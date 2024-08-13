import 'package:mvvm_provider_shoppingapp/app/view_model/home_page_view_model.dart';
import 'package:mvvm_provider_shoppingapp/app/view_model/main_page_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Define the type of environment supported in this project
enum EnvironmentType { PRODUCTION, UAT, DEVELOPMENT }

List<SingleChildWidget> providerAssets() => [
      ChangeNotifierProvider(create: (_) => HomePageViewModel()),
      ChangeNotifierProvider(create: (_) => MainPageViewModel()),
    ];
