import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/post.dart'; // Ensure you import your Post model
import '../services/supabase_service.dart'; // Ensure you import the SupabaseService class

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  late Future<List<Post>> posts;

  @override
  void initState() {
    super.initState();
    posts = SupabaseService(Supabase.instance.client).fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Feed')),
      body: FutureBuilder<List<Post>>(
        future: posts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final post = snapshot.data![index];
              return ListTile(
                title: Text(post.title),  // Assuming 'title' is a field in your Post model
                subtitle: Text(post.content),  // Assuming 'description' is a field
              );
            },
          );
        },
      ),
    );
  }
}
