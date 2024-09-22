import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/post.dart';


class SupabaseService {
  final SupabaseClient client;

  SupabaseService(this.client);

  Future<List<Post>> fetchPosts() async {
  final response = await client.from('posts').select();

  if (response.isNotEmpty) {
    return response.map((post) => Post.fromMap(post)).toList();
  }

  throw Exception('No posts found.');
}


}
