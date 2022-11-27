// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    CovidDataRoute.name: (routeData) {
      final args = routeData.argsAs<CovidDataRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CovidDataView(
          key: args.key,
          countryName: args.countryName,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/home',
          fullMatch: true,
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
        RouteConfig(
          CovidDataRoute.name,
          path: '/details',
        ),
      ];
}

/// generated route for
/// [HomeView]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CovidDataView]
class CovidDataRoute extends PageRouteInfo<CovidDataRouteArgs> {
  CovidDataRoute({
    Key? key,
    required String countryName,
  }) : super(
          CovidDataRoute.name,
          path: '/details',
          args: CovidDataRouteArgs(
            key: key,
            countryName: countryName,
          ),
        );

  static const String name = 'CovidDataRoute';
}

class CovidDataRouteArgs {
  const CovidDataRouteArgs({
    this.key,
    required this.countryName,
  });

  final Key? key;

  final String countryName;

  @override
  String toString() {
    return 'CovidDataRouteArgs{key: $key, countryName: $countryName}';
  }
}
