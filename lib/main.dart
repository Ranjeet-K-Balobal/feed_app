import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/feed_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://bknlxbldsvzfxiycysij.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJrbmx4Ymxkc3Z6ZnhpeWN5c2lqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjY5MTYxNDUsImV4cCI6MjA0MjQ5MjE0NX0.UPmFewGxeHa6jfFGynZ9YnuYz-rncNOiXsbcUajgQz8',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feed App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FeedPage(),
    );
  }
}
