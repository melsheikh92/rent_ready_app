import 'package:rent_ready_app/components/SuccessBottomSheet.dart';
import 'package:rent_ready_app/di/InjectionContainer.dart';
import 'package:rent_ready_app/features/home/presentation/screens/HomeScreen.dart';
import 'package:rent_ready_app/resources/strings_generated.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../bloc/Splash_bloc.dart';
import '../bloc/Splash_state.dart';
import 'MobileSplashScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<SplashBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => _bloc,
        child: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) async {
            if (state is TokenLoadedState) {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: HomeScreen()));
            }
            if (state is FailedTokenLoadedState) {
               await showFailureBottomSheet(context, failureMessage: AppStrings.defaulterrormessage);
            }
          },
          builder: (context, state) {
            return ScreenTypeLayout(
              mobile: MobileSplashScreen(),
            );
          },
        ));
  }
}
