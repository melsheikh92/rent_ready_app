import 'package:rent_ready_app/features/home/data/models/HomeModel.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/Home_bloc.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/Home_event.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/Home_state.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/FiltersWidget.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/ItemWidget.dart';
import 'package:rent_ready_app/features/settings/bloc/SettingsConfigBloc.dart';
import 'package:rent_ready_app/features/settings/bloc/events/ThemeEvent.dart';
import 'package:rent_ready_app/utilities/common_imports.dart';
import 'package:rent_ready_app/utilities/language_manager.dart';
import 'package:split_view/split_view.dart';

import '../DetailsScreen.dart';

class TabletHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TabletHomeScreen> {
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (ctx, state) {
          if (state is AccountsLoadedState) {
            return _buildBody(state);
          } else {
            return Scaffold(
              body: Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                    strokeWidth: 10,
                  ),
                ),
              ),
            );
          }
        });
  }

  Scaffold _buildBody(AccountsLoadedState state) {
    return Scaffold(
      appBar: _buildAppBar(state),
      body: SplitView(
        children: [
          _buildAccountsBody(state),
          DetailsScreen(state.selectedAccount)
        ],
        viewMode: SplitViewMode.Horizontal,
        indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
        activeIndicator: SplitIndicator(
          viewMode: SplitViewMode.Vertical,
          color: Theme.of(context).cardColor,
          isActive: true,
        ),
        controller: SplitViewController(
            limits: [WeightLimit(max: 0.5), WeightLimit(max: 0.7)]),
        onWeightChanged: (w) {},
      ),
    );
  }

  AppBar _buildAppBar(AccountsLoadedState state) {
    return AppBar(
      title: Text(
        AppStrings.appName,
        style: Theme.of(context).textTheme.headline1,
      ),
        actions: [
          Padding(padding: EdgeInsets.all(8),
          child: PopupMenuButton(
              onSelected: (txt) {
                if (txt == "LIGHT_THEME") {
                  BlocProvider.of<SettingsConfigBloc>(context)
                      .add(ThemeModeChangedEvent(themeMode: ThemeMode.light));
                }
                if (txt == "DARK_THEME") {
                  BlocProvider.of<SettingsConfigBloc>(context)
                      .add(ThemeModeChangedEvent(themeMode: ThemeMode.dark));
                }
                if (txt == "LANGUAGE") {
                  var manager = getIt<LanguageManager>();
                  manager.changeLanguage(context);
                }
              },
              child: Icon(
                Icons.settings,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text(
                    AppStrings.settingsLightTheme,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: "LIGHT_THEME",
                ),
                PopupMenuItem(
                  child: Text(
                    AppStrings.settingsDarkTheme,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: "DARK_THEME",
                ),
                PopupMenuItem(
                  child: Text(
                    AppStrings.settingsChangeLanguage,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  value: "LANGUAGE",
                )
              ]),
          )
        ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: FiltersWidget(
          accounts: state.accounts,
          allStates: state.allStates,
          filtersModel: state.filters,
          onFiltersChanged: (filters) {
            BlocProvider.of<HomeBloc>(context).add(FilterChangedEvent(filters));
          },
        ),
      ),
    );
  }

  void _didSelectAccount(UIAccountModel accountModel) {
    BlocProvider.of<HomeBloc>(context).add(SelectAccountEvent(accountModel));
  }

  Widget _buildAccountsBody(AccountsLoadedState state) {
    return GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: state.filters.isGrid == true ? 2 : 1),
        children: state.accounts
            .map((e) => ItemWidget(
                account: e, onPickAccount: _didSelectAccount, isGrid: state.filters.isGrid, isSelected: e == state.selectedAccount,))
            .toList());
  }
}
