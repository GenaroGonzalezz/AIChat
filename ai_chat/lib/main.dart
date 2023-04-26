import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';
import 'providers/models_provider.dart';
import 'screens/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
            scaffoldBackgroundColor: theScaffoldBackgroundColor,
            appBarTheme: AppBarTheme(color: cardColor)),
        home: const Scaffold(
          // appBar: AppBar(
          //   title: const Text('Material App Bar'),
          // ),
          body: ChatScreen(),
        ),
      ),
    );
  }
}
