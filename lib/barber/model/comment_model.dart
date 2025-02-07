// class CommentModel {
//   final int userId;
//   final double rating;
//   final String comment;
//   final DateTime createdAt;
//   final int id;
//   final int targetId;

//   CommentModel({
//     required this.userId,
//     required this.rating,
//     required this.comment,
//     required this.createdAt,
//     required this.id,
//     required this.targetId,
//   });

//   factory CommentModel.fromJson(Map<String, dynamic> json) {
//     return CommentModel(
//       userId: json['user_id'],
//       rating: json['rating'].toDouble(),
//       comment: json['comment'],
//       createdAt: DateTime.parse(json['created_at']),
//       id: json['id'],
//       targetId: json['target_id'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'user_id': userId,
//       'rating': rating,
//       'comment': comment,
//       'created_at': createdAt.toIso8601String(),
//       'id': id,
//       'target_id': targetId,
//     };
//   }
// }

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
      userId: json['user_id'] ?? 0, // جلوگیری از null برای userId
      rating: (json['rating'] != null)
          ? json['rating'].toDouble()
          : 0.0, // جلوگیری از null برای rating
      comment: json['comment'] ?? '', // جلوگیری از null برای comment
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime
              .now(), // استفاده از تاریخ فعلی در صورت null بودن created_at
      id: json['id'] ?? 0, // جلوگیری از null برای id
      targetId: json['target_id'] ?? 0, // جلوگیری از null برای targetId
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
