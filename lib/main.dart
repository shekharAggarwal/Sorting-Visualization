import 'package:flutter/material.dart';
import 'package:sorting/common/constants/page_configuration.dart';
import 'package:sorting/presentation/journeys/insertionSort/insertion_sort_algo.dart';
import 'package:sorting/presentation/journeys/selectSorting/select_sorting.dart';
import 'package:sorting/presentation/journeys/unknownScreen/unknown_screen.dart';
import 'package:url_strategy/url_strategy.dart';

import 'common/constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(
    MaterialApp.router(
      title: 'Sorting',
      routerDelegate: PageRouteDelegate(),
      routeInformationParser: PageRouteInformationParser(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class PageRouteDelegate extends RouterDelegate<PageRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageRoutePath> {
  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  String? _selectedSort;
  bool show404 = false;

  void _handleBookTapped(String sort) {
    _selectedSort = sort;
    notifyListeners();
  }

  @override
  PageRoutePath get currentConfiguration {
    if (show404) return PageRoutePath.unknown();

    if (_selectedSort == null) return PageRoutePath.home();

    return PageRoutePath.details(_selectedSort);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('SelectSorting'),
          child: SelectSorting(
            onTap: (index) {
              _handleBookTapped(Strings.CheckSortName[index]);
            },
          ),
        ),
        if (show404)
          const MaterialPage(
              key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_selectedSort != null)
          if (_selectedSort == 'QuickSort')
            const MaterialPage(
                key: ValueKey('InsertionSortAlgo'), child: InsertionSortAlgo())
          else if (_selectedSort == 'BubbleSort')
            const MaterialPage(
                key: ValueKey('InsertionSortAlgo'), child: InsertionSortAlgo())
          else if (_selectedSort == 'MergeSort')
            const MaterialPage(
                key: ValueKey('InsertionSortAlgo'), child: InsertionSortAlgo())
          else if (_selectedSort == 'InsertionSort')
            const MaterialPage(
                key: ValueKey('InsertionSortAlgo'), child: InsertionSortAlgo())
          else if (_selectedSort == 'SelectionSort')
            const MaterialPage(
                key: ValueKey('InsertionSortAlgo'), child: InsertionSortAlgo())
          else if (_selectedSort == 'HeapSort')
            const MaterialPage(
                key: ValueKey('InsertionSortAlgo'), child: InsertionSortAlgo())
          else if (_selectedSort == 'RadixSort')
            const MaterialPage(
                key: ValueKey('InsertionSortAlgo'), child: InsertionSortAlgo())
          else if (_selectedSort == 'BucketSort')
            const MaterialPage(
                key: ValueKey('InsertionSortAlgo'), child: InsertionSortAlgo())
          else
            const MaterialPage(
                key: ValueKey('UnknownPage'), child: UnknownScreen())
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedSort = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(PageRoutePath path) async {
    if (path.isUnknown) {
      _selectedSort = null;
      show404 = true;
      return;
    }

    if (Strings.CheckSortName.contains(path.id)) {
      _selectedSort = path.id;
    } else {
      _selectedSort = null;
    }
    show404 = false;
  }
}

class PageRouteInformationParser extends RouteInformationParser<PageRoutePath> {
  // Converts the given route information into parsed data to pass to a
  // RouterDelegate
  @override
  Future<PageRoutePath> parseRouteInformation(
      RouteInformation routeInfo) async {
    final uri = Uri.parse(routeInfo.location!);

    // Handle '/'
    if (uri.pathSegments.isEmpty) return PageRoutePath.home();

    // Handle 'Sort/:id'
    if (uri.pathSegments.length == 2) {
      if (uri.pathSegments.first != "Sort") return PageRoutePath.unknown();
      final id = uri.pathSegments.elementAt(1).toString();
      if (id.isEmpty) return PageRoutePath.unknown();
      return PageRoutePath.details(id);
    }

    // Handle unknown routes
    return PageRoutePath.unknown();
  }

  // which is used for updating browser history for the web application. If you
  // decides to opt in, you must also overrides this method to return a route
  // information.

  @override
  RouteInformation restoreRouteInformation(PageRoutePath path) {
    if (path.isUnknown) {
      return const RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return const RouteInformation(location: '/');
    }
    if (path.isQuickSort) {
      return const RouteInformation(location: '/Sort/QuickSort');
    }
    if (path.isBubbleSort) {
      return const RouteInformation(location: '/Sort/BubbleSort');
    }
    if (path.isMergeSort) {
      return const RouteInformation(location: '/Sort/MergeSort');
    }
    if (path.isInsertionSort) {
      return const RouteInformation(location: '/Sort/InsertionSort');
    }
    if (path.isSelectionSort) {
      return const RouteInformation(location: '/Sort/SelectionSort');
    }
    if (path.isHeapSort) {
      return const RouteInformation(location: '/Sort/HeapSort');
    }
    if (path.isRadixSort) {
      return const RouteInformation(location: '/Sort/RadixSort');
    }
    if (path.isBucketSort) {
      return const RouteInformation(location: '/Sort/BucketSort');
    }

    return const RouteInformation();
  }
}
