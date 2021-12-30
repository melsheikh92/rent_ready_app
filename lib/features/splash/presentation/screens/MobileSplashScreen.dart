import 'package:rent_ready_app/features/splash/presentation/bloc/Splash_event.dart';
import 'package:rent_ready_app/resources/assets_generated.dart';
import 'package:rent_ready_app/utilities/common_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/Splash_bloc.dart';
import '../bloc/Splash_state.dart';

class MobileSplashScreen extends StatefulWidget {
  @override
  _MobileSplashScreenState createState() => _MobileSplashScreenState();
}

class _MobileSplashScreenState extends State<MobileSplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation sizeAnimation;
  bool showProgressIndicator = false;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    sizeAnimation = Tween<double>(begin: 10.0, end: 200.0).animate(controller);
    sizeAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        BlocProvider.of<SplashBloc>(context).add(LoadTokenEvent());
      }
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return _buildSplash(state: state);
      },
    );
  }

  Scaffold _buildSplash({@required SplashState state}) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLogo(),
          SizedBox(
            height: 100,
          ),
          _buildLoader(state: state),
        ],
      )),
    );
  }

  SizedBox _buildLoader({@required SplashState state}) {
    return SizedBox(
      height: 50,
      width: 50,
      child: (state is StartLoadingState && state.showLoading) ? CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
              strokeWidth: 4,
            )
          : Container(),
    );
  }

  Container _buildLogo() {
    return Container(
      height: 300,
      width: 300,
      child: Center(
        child: AnimatedBuilder(
            animation: sizeAnimation,
            builder: (BuildContext context, Widget child) {
              return Image(
                image: AppAssets.logo,
                height: sizeAnimation.value,
                width: sizeAnimation.value * 1.3,
                alignment: Alignment.center,
              );
            }),
      ),
    );
  }
}
