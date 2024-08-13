import 'package:bookmeeter/routes/BookmarkPage.dart';
import 'package:bookmeeter/routes/CartPage.dart';
import 'package:bookmeeter/routes/Chat.dart';
import 'package:bookmeeter/routes/ChatListPage.dart';
import 'package:bookmeeter/routes/HomePage.dart';
import 'package:bookmeeter/routes/ProductPage.dart';
import 'package:bookmeeter/routes/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static const String homePage = '/';
  static const String bookmarkPage = '/bookmarks';
  static const String cartPage = '/cart';
  static const String searchPage = '/search';
  static const String productPage = '/product';
  static const String chatPage = '/chats';
  static const String chat = '/private';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomePage(),
        );
      case searchPage:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SearchPage(),
        );
      case bookmarkPage:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const BookmarkPage(),
        );
      case cartPage:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const CartPage(),
        );
      case productPage:
        return MaterialPageRoute(
          builder: (_) => const ProductPage(),
        );
      case chatPage:
        return MaterialPageRoute(
          builder: (_) => const ChatListPage(),
        );
      case chat:
        return PageTransition(
            child: const Chat(), type: PageTransitionType.rightToLeft);

      default:
        throw const FormatException("Route not Found");
    }
  }
}

class RouteException implements Exception {
  final String message;
  const RouteException(this.message);
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
