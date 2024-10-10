import 'package:flutter/material.dart';
import 'package:method_channel_flutter/src/system_info/system_info_page.dart';

import 'src/utils/app_navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('System Info'),
              onPressed: () {
                AppNavigation.push(context, const SystemInfoPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
