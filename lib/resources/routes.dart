import 'package:ecommerce_app/presentation/home/home.dart';
import 'package:ecommerce_app/presentation/product/product_details/product_deatils.dart';
import 'package:ecommerce_app/presentation/product/products.dart';
import 'package:ecommerce_app/resources/strings.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = "/";
  static const String productRoute = "/products";
  static const String productDetailsRoute = "/products_details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.productRoute:
        return MaterialPageRoute(
            builder: (_) => const ProductPage(), settings: routeSettings);
      case Routes.productDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsPage(),
          settings: routeSettings,
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
