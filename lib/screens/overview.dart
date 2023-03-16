import 'package:flutter/material.dart';
import 'package:writeapp/theme_manager.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text('Notes'),
        actions: [
          Switch.adaptive(
              value: themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                themeManager.toggleTheme(newValue);
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // backgroundColor: WriteColors.accent,
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
