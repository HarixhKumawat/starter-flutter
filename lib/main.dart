import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Boots and cats...',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Boots and Cats and Boots and Ca...'),
        ),
        body: const Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}



class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  String get netwrokUrl => 'https://cataas.com/cat/says/';
  @override
  Widget build(BuildContext context) {

    final _biggerFont = const TextStyle(fontSize: 16);
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return const Divider();
        }
        return CachedNetworkImage(
          imageUrl: netwrokUrl + (i~/2).toString(),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.all(5),
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          valueColor : const AlwaysStoppedAnimation(Colors.blueAccent),
                      ),
                    ),
                  ),
                ],
              ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      },
    );
    //return const Placeholder();
  }
}

// class cats extends StatefulWidget {
//   const cats({Key? key}) : super(key: key);
//
//   //String get netwrokUrl => baseUrl + WordPair.random().toString();
//   @override
//   State<cats> createState() => _catsState();
// }
//
// class _catsState extends State<cats>{
//   final base = 0;
//   String get netwrokUrl => 'https://cataas.com/cat/says/$base';
//   @override
//   Widget build(BuildContext context) {
//     return FadeInImage.memoryNetwork(
//       placeholder: kTransparentImage,
//       image: netwrokUrl,
//     );
//     // return getImage.network(
//     //   widget.netwrokUrl,
//     //   fit:BoxFit.cover,
//     //   height: 500,
//     //   loadingBuilder: (BuildContext context, Widget child,
//     //       ImageChunkEvent? loadingProgress) {
//     //     if (loadingProgress == null) return child;
//     //     return Center(
//     //       child: CircularProgressIndicator(
//     //         value: loadingProgress.expectedTotalBytes != null
//     //             ? loadingProgress.cumulativeBytesLoaded /
//     //             loadingProgress.expectedTotalBytes!
//     //             : null,
//     //       ),
//     //     );
//     //   },
//     // );
//     }
// }


