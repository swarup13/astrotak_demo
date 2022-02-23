import 'package:astrotak_demo/views/screens/ask_a_question_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.landingPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const AskAQuestionScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (_) => const  AskAQuestionScreen(),
          settings: settings,
          fullscreenDialog: true,
        );
    }
  }
}

class AppRoutes {
  static const landingPage = '/';
}


/*
Call AppRoutes.pageName whenever needed

Example scenario in case of arguments passing
case AppRoutes.listingCategorySearch:
        Map<String, dynamic> args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ListingCategorySearchView(queryParams: args,),
          settings: settings,
          fullscreenDialog: true,
        );
case AppRoutes.listingDetails:
        ListingDetailsArgs args = settings.arguments;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ListingDetailsPage(offerID: args.offerID, favouriteCount: args.favouriteCount, commentCount: args.commentCount, dealCount: args.dealCount,viewCount: args.viewCount, isLoadingFromOfferCreateScreen: args.isLoadingFromOfferCreateScreen,),
          settings: settings,
          fullscreenDialog: true,
        );
 */
