import 'package:rent_ready_app/features/home/presentation/DetailsScreen.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/bloc.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/FiltersWidget.dart';
import 'package:rent_ready_app/features/home/presentation/widgets/ItemWidget.dart';
import 'package:rent_ready_app/utilities/common_imports.dart';

class MobileHomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {

        },
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
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
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
        AppStrings.appname,
        style: Theme.of(context).textTheme.headline1,
      ),
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
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: state.filters.isGrid ? 3 : 1),
        children: state.accounts.map((e) => ItemWidget(
                account: e, onPickAccount: (account) {
          BlocProvider.of<HomeBloc>(context).add(SelectAccountEvent(account));
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: DetailsScreen(account)));

        }, isGrid: state.filters.isGrid)).toList());
  }
}
