import 'package:rent_ready_app/features/home/domain/GetHomeDataUseCase.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/bloc.dart';
import 'package:rent_ready_app/utilities/common_imports.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'MobileHomeScreen.dart';
import 'TabletHomeScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _bloc;

  @override
  void initState() {
    super.initState();
    // Temporary because of bug in getIt genrator can't register HomeBloc properly
    GetHomeDataUseCase datasource = getIt<GetHomeDataUseCase>();
    _bloc = HomeBloc(datasource);
    _bloc.add(LoadAccountsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: ScreenTypeLayout(
        mobile: MobileHomeScreen(),
        tablet: TabletHomeScreen(), // works for both mobile and tablet
      )
    );
  }
}
