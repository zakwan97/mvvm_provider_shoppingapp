import 'package:flutter/material.dart';
import 'package:mvvm_provider_shoppingapp/app/constant/color.dart';
import 'package:mvvm_provider_shoppingapp/app/view/base_stateful_page.dart';
import 'package:mvvm_provider_shoppingapp/app/view/home_page.dart';
import 'package:mvvm_provider_shoppingapp/app/view/test_page.dart';
import 'package:mvvm_provider_shoppingapp/app/view/widget/custom_tabbar_indicator.dart';
import 'package:mvvm_provider_shoppingapp/app/view_model/main_page_view_model.dart';
import 'package:provider/provider.dart';

class MainPage extends BaseStatefulPage {
  const MainPage({
    super.key,
    this.isReload = false,
  });

  final bool isReload;

  static MainPageState? of(BuildContext context) =>
      context.findAncestorStateOfType<MainPageState>();

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends BaseStatefulState<MainPage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  final List<bool> _isDisabledTabs = [false, false];

  onTap() {
    if (_isDisabledTabs[_tabController!.index]) {
      int index = _tabController!.previousIndex;
      setState(() {
        _tabController!.index = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        length: 2,
        animationDuration: const Duration(milliseconds: 500));
    _tabController!.addListener(onTap);
  }

  void onBottomTabTapped(int index) {
    setSelectedBottomtab(index);
    _tabController?.animateTo(index);
  }

  void setSelectedBottomtab(int index) {
    context.read<MainPageViewModel>().setSelectedBottomTabIndex(index);
  }

  @override
  Widget body() {
    return buildScreen();
  }

  Widget buildScreen() {
    final theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: CustomColors.borderDefaultSub,
                  width: 0.5,
                ),
              ),
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 5),
                    text: 'Home',
                    icon: ImageIcon(
                      AssetImage('assets/images/home_icon_active.png'),
                    ),
                  ),
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 5),
                    text: 'Portfolio',
                    icon: ImageIcon(
                      AssetImage('assets/images/icon-portfolio.png'),
                    ),
                  )
                ],
                onTap: onBottomTabTapped,
                splashFactory: NoSplash.splashFactory,
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.focused)
                      ? null
                      : Colors.transparent;
                }),
                labelColor: CustomColors.iconPrimary,
                unselectedLabelColor: CustomColors.iconDefault,
                labelStyle: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
                unselectedLabelStyle: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
                indicator: CustomBottomNavTabbarIndicator(),
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomePage(),
          NumberInputPage(),
        ],
      ),
    );
  }

  @override
  Widget? floatingActionButton() => null;
}
