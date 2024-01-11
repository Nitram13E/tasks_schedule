import 'package:flutter/material.dart';
import 'package:tasks_schedule/widgets/day_list.dart';
import 'package:tasks_schedule/widgets/day_section.dart';
import 'package:tasks_schedule/widgets/title_bar.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
  await windowManager.setMinimumSize(const Size(600, 400));

  runApp(const TaskSchedule());
}

class TaskSchedule extends StatelessWidget {
  const TaskSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Schedule',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        useMaterial3: true,
        fontFamily: 'OpenSans',
        dividerColor: Colors.transparent,
        listTileTheme: const ListTileThemeData(
          selectedColor: Colors.white,
          selectedTileColor: Colors.black,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      home: const MyHomePage(title: 'Task Schedule'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: TitleBar(title: widget.title),
      ),
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 0,
            child: DayList(),
          ),
          Expanded(
            child: DaySection(),
          ),
        ],
      ),
    );
  }
}
