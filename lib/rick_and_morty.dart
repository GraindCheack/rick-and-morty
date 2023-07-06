import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/character/presentation/character_list_screen.dart';

class RickAndMorty extends StatelessWidget {
  const RickAndMorty({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CharacterListScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: const InputDecorationTheme(border: OutlineInputBorder()),
        primaryColor: Colors.teal.shade300,
      ),
    );
  }
}
