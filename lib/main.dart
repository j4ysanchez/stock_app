import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import  'dart:convert';
import 'stockQuote.dart';

void main() => runApp(new MyApp());

Future<Post> fetchPost() async {
  final response =
        //await http.get('https://jsonplaceholder.typicode.com/posts/1');
    await http.get('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=TSLA&interval=60min&apikey=KWI8RXBVV2ARLN5S');

  if (response.statusCode == 200) {

    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }

// ignore: expected_token, expected_token
}



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
          primarySwatch: Colors.blue,
      ),

      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),

        body: Center(
          child: FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot) {

              if (snapshot.hasData) {

                Map metaData = snapshot.data.title;
                Map quotes = snapshot.data.body;
                List quoteList = quotes.values.toList();

                return Text(metaData["2. Symbol"] + " on " + metaData["3. Last Refreshed"] + " " + quoteList[0].toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            }
          )
        )


      )

    );
  }
}



