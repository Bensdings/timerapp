import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _runningTime = 0;
  bool _isRunning = false;

  Future<void> _runTimer() async {
    if (_isRunning) {
      await Future.delayed(const Duration(milliseconds: 1));

      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _runningTime += 1;
        });
        _runTimer();
      });
    }
  }

  void runTimmer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
      });
      _runTimer();
    }
  }

  void stopTimmer() {
    setState(() {
      _isRunning = false;
    });
  }

  void clearTimer() {
    setState(() {
      _runningTime = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final seconds = (_runningTime);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$seconds",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : runTimmer,
                  child: const Text('Run'),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: _isRunning ? stopTimmer : null,
                  child: const Text('Stop'),
                ),
                const SizedBox(height: 188),
                ElevatedButton(
                  onPressed: clearTimer,
                  child: const Text('Clear'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
