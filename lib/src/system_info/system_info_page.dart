import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemInfoPage extends StatefulWidget {
  const SystemInfoPage({super.key});

  @override
  State<SystemInfoPage> createState() => _SystemInfoPageState();
}

class _SystemInfoPageState extends State<SystemInfoPage> {
  static const platform = MethodChannel('com.dsantos.systemInfo');
  String _systemInfo = 'Unknown';

  Future<void> _getSystemInfo() async {
    String systemInfo;

    try {
      final String result = await platform.invokeMethod('getSystemInfo');
      systemInfo = 'System info: $result';
    } on PlatformException catch (e) {
      systemInfo = "Failed to get system info: '${e.message}'";
    }

    setState(() {
      _systemInfo = systemInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("System Info"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_systemInfo),
            ElevatedButton(
              onPressed: _getSystemInfo,
              child: const Text("Get System Info"),
            ),
          ],
        ),
      ),
    );
  }
}
