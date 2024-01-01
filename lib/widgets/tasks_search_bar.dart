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

  List<Day> searchInformation(String keywords) {
    final List<Day> searchResult = [];

    for (Day day in daysController.dayList) {
      if (day.toString().toLowerCase().contains(keywords.toLowerCase())) searchResult.add(day);
    }

    return searchResult;
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      constraints: const BoxConstraints(
        maxHeight: 300,
        minHeight: 30,
      ),
      searchController: searchController,
      barHintText: 'Search',
      suggestionsBuilder: (context, controller) {
        List<Day> days = searchInformation(searchController.text);

        return [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: days.length,
            itemBuilder: (BuildContext context, int index) {
              return SearchTile(
                day: days[index],
              );
            },
          )
        ];
      },
    );
  }
}
