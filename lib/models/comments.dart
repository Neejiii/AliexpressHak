import 'dart:convert';


CommentsModel commentsModelFromJson(String str) =>
    CommentsModel.fromJson(json.decode(str));

class CommentsModel {
  CommentsModel({
    this.comments,
});

  List<Comment> comments;

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
      comments: json["comments"] == null
          ? null
          : List<Comment>.from(
          json["comments"].map((x) => Comment.fromJson(x))),
      );
}

class Comment {
  Comment({
  this.id,
  this.type,
  this.comment_textt,
  this.rating,
  this.picture_url

});

  String id;
  String type;
  String comment_textt;
  String rating;
  String picture_url;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["id"] ?? '',
    type: json["type"],
    comment_textt: json["comment_text"],
    rating: json["rating"],
    picture_url: json["picture_url"],
  );

}