import 'dart:convert';

import '../generated/json/base/json_field.dart';
import '../generated/json/moment_item_entity.g.dart';

@JsonSerializable()
class MomentItemEntity {

	int? articleId;
	int? collectionTimes;
	List<MomentItemCommentList>? commentList;
	int? commentTimes;
	String? content;
	String? createTime;
	int? isCollection;
	int? isDeploy;
	int? isLike;
	int? isTop;
	int? likeTimes;
	String? showCover;
	@JSONField(name: "source")
	String? xSource;
	int? timestamp;
	int? topicId;
	String? type;
	String? userAvatar;
	String? userColorVal;
	int? userId;
	String? userLogo;
	String? userName;
  
  MomentItemEntity();

  factory MomentItemEntity.fromJson(Map<String, dynamic> json) => $MomentItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $MomentItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class MomentItemCommentList {

	int? articleId;
	int? commentId;
	String? commenter;
	String? content;
	String? createTime;
	int? parentCommentId;
	String? receiver;
	int? toUserId;
	int? userId;
  
  MomentItemCommentList();

  factory MomentItemCommentList.fromJson(Map<String, dynamic> json) => $MomentItemCommentListFromJson(json);

  Map<String, dynamic> toJson() => $MomentItemCommentListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}