import 'package:flutter/material.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'code-store-form',
      (int viewId) {
        final iframe = IFrameElement();

        iframe.width = '640';
        iframe.height = '360';
        iframe.src = 'https://codetec.activehosted.com/f/36';
        iframe.style.border = 'none';

        return iframe;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 60,
            width: 180,
            child: ElevatedButton(
              onPressed: () {

                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Entre em contato conosco",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min, // <---
                          children: const <Widget>[
                            SizedBox(
                              width: 640,
                              height: 400,
                              child: HtmlElementView(viewType: 'code-store-form'),
                            ),
                          ],
                        ),
                        buttonPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(primary: Colors.blue),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Fechar",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: const Text(
                'Entrar em contato',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
