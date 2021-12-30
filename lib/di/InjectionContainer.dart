

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'InjectionContainer.config.dart';



final getIt = GetIt.instance;

@InjectableInit( initializerName: r'$initGetIt', // default
    preferRelativeImports: true, // default
    asExtension: false,usesNullSafety:false)
Future<GetIt> configure({String environment}) => $initGetIt(getIt, environment: environment);
