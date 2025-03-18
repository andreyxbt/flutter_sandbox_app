import 'package:flutter/material.dart';
import 'package:shared_design/shared_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Second App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showContentCard() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: ContentCard(
          headline: 'Welcome',
          subhead: 'to the Second App',
          title: 'Content Card Example',
          subtitle: 'Interactive Demo',
          content: 'This is a sample content card that demonstrates the shared design system components.',
          assetPath: "assets/images/sample_image.png",
          onButton1Pressed: () => Navigator.of(context).pop(),
          onButton2Pressed: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Second App',
              style: TextStyle(
                fontFamily: 'BigShouldersStencil',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32),
            StandardButton(
              text: 'Primary Button',
              state: ButtonState.primary,
              onPressed: _showContentCard,
            ),
            const SizedBox(height: 16),
            const StandardButton(
              text: 'Secondary Button',
              state: ButtonState.secondary,
            ),
          ],
        ),
      ),
    );
  }
}