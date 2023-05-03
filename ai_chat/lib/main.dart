import 'package:ai_chat/providers/chats_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';
import 'providers/models_provider.dart';
import 'screens/chat_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load();
  runApp(const MyApp());

  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
        ChangeNotifierProvider(create: (_) => ChatsProvider())
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
