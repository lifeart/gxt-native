/*
 * Copyright (C) 2019-2022 The Kraken authors. All rights reserved.
 * Copyright (C) 2022-present The WebF authors. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webf/webf.dart';
import 'package:webf/devtools.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // add this line
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Kraken Browser',
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  late WebFController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size viewportSize = queryData.size;
    controller = WebFController(
      context,
      devToolsService: ChromeDevToolsService(),
      viewportWidth: viewportSize.width -
          queryData.padding.horizontal, // Adjust the viewportWidth
      viewportHeight: viewportSize.height -
          queryData.padding.vertical, // Adjust the viewportHeight
    );
    controller.preload(WebFBundle.fromUrl('http://localhost:3001/'));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: WebFDemo(controller: controller)),
    );
  }
}

class WebFDemo extends StatelessWidget {
  final WebFController controller;

  WebFDemo({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: WebF(
        controller: controller,
      ),
    ));
  }
}
