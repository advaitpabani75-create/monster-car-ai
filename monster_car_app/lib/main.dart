
import 'package:flutter/material.dart';
import 'package:ultralytics_yolo/ultralytics_yolo.dart';

void main() {
  runApp(const MonsterAIApp());
}

class MonsterAIApp extends StatelessWidget {
  const MonsterAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monster Car AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const AIHomePage(),
    );
  }
}

class AIHomePage extends StatelessWidget {
  const AIHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monster Car AI'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'YOLO26 Object Detection',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: YOLOView(
              modelPath: 'yolo26n',
              onResult: (results) {
                debugPrint(
                  'Objects detected: ${results.length}',
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Vision test only — motors are not connected.',
            ),
          ),
        ],
      ),
    );
  }
}
