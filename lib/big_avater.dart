import 'package:flutter/material.dart';

class BigAvatar extends StatelessWidget {
  final String avatar;
  final String articleId;

  const BigAvatar({Key? key, required this.avatar, required this.articleId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
          tag: "avatar_$articleId",
          child: Center(child: Image.network(
            avatar,
          ),)),
    );
  }
}
