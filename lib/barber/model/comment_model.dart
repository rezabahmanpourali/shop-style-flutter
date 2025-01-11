
class CommentModel {
  final int userId;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final int id;
  final int targetId;

  CommentModel({
    required this.userId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    required this.id,
    required this.targetId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      userId: json['user_id'],
      rating: json['rating'].toDouble(),
      comment: json['comment'],
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
      targetId: json['target_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'rating': rating,
      'comment': comment,
      'created_at': createdAt.toIso8601String(),
      'id': id,
      'target_id': targetId,
    };
  }
}
