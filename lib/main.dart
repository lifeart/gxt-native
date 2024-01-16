import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:webf/webf.dart';
import 'package:webf/devtools.dart';

void main() {
  runApp(MaterialApp(
    title: 'WebF Demo',
    home: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    final Size viewportSize = queryData.size;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            WebF(
              devToolsService: ChromeDevToolsService(), // Enable Chrome DevTools Services
              viewportWidth: viewportSize.width - queryData.padding.horizontal, // Adjust the viewportWidth
              viewportHeight: viewportSize.height - queryData.padding.vertical, // Adjust the viewportHeight
              bundle: WebFBundle.fromUrl('http://localhost:4173/'), // The page entry point
            ),
          ],
        ),
      ));
  }

}
