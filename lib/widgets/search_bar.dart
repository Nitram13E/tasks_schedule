import 'package:flutter/material.dart';
import 'package:tasks_schedule/models/day.dart';
import 'package:tasks_schedule/utilities/day_controller.dart';
import 'package:tasks_schedule/widgets/search_tile.dart';

class TaskSearchBar extends StatefulWidget {
  const TaskSearchBar({super.key});

  @override
  State<TaskSearchBar> createState() => _TaskSearchBarState();
}

class _TaskSearchBarState extends State<TaskSearchBar> with ChangeNotifier {
  final DaysController daysController = DaysController();
  final SearchController searchController = SearchController();
  final List<Day> searchResult = [];

  //TODO: Reformular. Se debe replantear casos de uso para busqueda instantanea y solucionar problema de actualizacion de sugerencias al estar desplegada.
  void searchInformation() {
    if (searchController.isOpen) searchController.closeView(searchController.text);
    searchResult.clear();

    for (Day day in daysController.days) {
      if (day.toString().contains(searchController.text)) searchResult.add(day);
    }
    searchController.notifyListeners();
    searchController.openView();
  }

  List<SearchTile> generateSearchTiles() {
    List<SearchTile> searchTiles = [];

    for (Day day in searchResult) {
      searchTiles.add(SearchTile(
        day: day,
      ));
    }

    return searchTiles;
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: searchController,
      builder: (context, controller) => SearchBar(
        controller: controller,
        constraints: const BoxConstraints(
          maxHeight: 300,
          minHeight: 40,
          maxWidth: 500,
        ),
        hintText: 'Find',
        backgroundColor: const MaterialStatePropertyAll(Colors.black),
        shape: const MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        onChanged: (value) => searchInformation(),
        onTap: () => searchInformation(),
      ),
      suggestionsBuilder: (context, controller) => generateSearchTiles(),
    );
  }
}
