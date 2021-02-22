import 'package:blocbuster/presentation/journeys/home/movie_tabbed/tab.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // remove the comment for this line

class MovieTabbedConstants {
  static const List<Tab> movieTabs = const [
    const Tab(index: 0, title: 'Popular'),
    const Tab(index: 1, title: "Now"),
    const Tab(index: 2, title: "Soon")
  ];
}
