import 'package:rent_ready_app/features/home/presentation/DetailsScreen.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/bloc.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/FiltersWidget.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/ItemWidget.dart';
import 'package:rent_ready_app/features/settings/bloc/SettingsConfigBloc.dart';
import 'package:rent_ready_app/features/settings/bloc/events/ThemeEvent.dart';
import 'package:rent_ready_app/utilities/common_imports.dart';
import 'package:rent_ready_app/utilities/language_manager.dart';

class MobileHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (ctx, state) {
          if (state is AccountsLoadedState) {
            return Scaffold(
              appBar: _buildAppBar(state),
              body: _buildBody(state),
            );
          } else {
            return Scaffold(
              body: Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).cardColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).accentColor),
                    strokeWidth: 10,
                  ),
                ),
              ),
            );
          }
        });
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

  Widget _buildBody(AccountsLoadedState state) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: state.filters.isGrid ? 2 : 1),
        children: state.accounts
            .map((e) => ItemWidget(
                account: e,
                onPickAccount: (account) {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child:
                          Scaffold(
                            appBar: AppBar(title: Text(AppStrings.appName, style: Theme.of(context).textTheme.headline1,),
                            leading: InkWell(
                              child: Icon(Icons.arrow_back, size: 25),
                              onTap: () {
                              Navigator.of(context).pop();
                            },),
                            ),
                            body: DetailsScreen(account),)
                          ));
                },
                isGrid: state.filters.isGrid))
            .toList());
  }
}
