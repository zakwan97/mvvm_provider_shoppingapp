import 'package:mvvm_provider_shoppingapp/app/constant/nav_bar_constant.dart';
import 'package:mvvm_provider_shoppingapp/app/view_model/base_view_model.dart';

class MainPageViewModel extends BaseViewModel {
  int selectedBottomTabIndex = BottomTabBarItem.home.index;

  void setSelectedBottomTabIndex(int index) {
    if (index >= BottomTabBarItem.values.length) {
      return;
    }
    selectedBottomTabIndex = index;
    notifyListeners();
  }
}
