import 'dart:html';
import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// statelesswidget makes the app itself a widget (in flutter, almost everything is a widget)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    // Material is a visual design language that is standard on mobile and web
    return MaterialApp(
      title: 'Startup Name Generator',
      // Scaffold is a widget (Material library) - provides default app bar and body property
      home: RandomWords(),
    );
  }
}



class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /* 1 */ (context, i) {
        if (i.isOdd) return const Divider(); /* 2 */

        final index = i ~/ 2; /* 3 */
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /* 4 */
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      )
    );
  }
}