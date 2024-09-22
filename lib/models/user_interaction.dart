class UserInteraction {
  final int postId;
  final int userId;
  final String interactionType;

  UserInteraction({
    required this.postId,
    required this.userId,
    required this.interactionType,
  });

  factory UserInteraction.fromMap(Map<String, dynamic> json) {
    return UserInteraction(
      postId: json['post_id'],
      userId: json['user_id'],
      interactionType: json['interaction_type'],
    );
  }
}
