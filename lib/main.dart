import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wellbeing_tracker/provider.dart';
import 'package:wellbeing_tracker/switcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wellbeing coach',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        textTheme: GoogleFonts.alegreyaSansScTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BackEnd())
        ],
        builder: ((context, child) {
          // context.read<BackEnd>().initialize();
          return Switcher();
        }),
      ),
    );
  }
}

